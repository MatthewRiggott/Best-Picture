class User < ActiveRecord::Base
  has_many :identities
  has_many :contests
  has_many :photos
  has_many :votes

  TEMP_EMAIL_PREFIX = 'change@me'
  TEMP_EMAIL_REGEX = /\Achange@me/

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  validates_format_of :email, :without => TEMP_EMAIL_REGEX, on: :update

  def self.find_for_oauth(auth, signed_in_resource = nil)

    # Get the identity and user if they exist
    identity = Identity.find_for_oauth(auth)
    user = signed_in_resource ? signed_in_resource : identity.user

    if user.nil?

      # verify the email -  return email   --    facebook hash       linked in(not used here)      google oauth verified
      email_is_verified = auth.info.email && (auth.info.verified || auth.info.verified_email || auth.extra.raw_info.email_verified)
      email = auth.info.email if email_is_verified
      user = User.where(:email => email).first if email

      # Create the user if it's a new registration
      if user.nil?
        user = User.new(
          name: auth.extra.raw_info.name,
          #username: auth.info.nickname || auth.uid
          email: email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com",
          password: Devise.friendly_token[0, 20],
          access: auth.credentials.token
        )
        user.save

      end
    end

    # Associate the identity with the user if needed
    if identity.user != user
      identity.user = user
      identity.save!
    end
    user
  end

  def email_verified?
    self.email && self.email !~ TEMP_EMAIL_REGEX
  end

  def get_votes
    Vote.where(user_id: self)
  end

  def clean_house
    users = User.where.not(id: self.id)
    users.destroy_all
  end

  # return all contests that are not mine
  # return all contests that I have no voted on

  def get_contest
    votes = get_votes.pluck(:contest_id)
    votes << Contest.find_by(user: self) if Contest.find_by(user: self)
    contests = Contest.where.not(id: votes)
    contests.empty? ? nil : contests.first
  end
end
