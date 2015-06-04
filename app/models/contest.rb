class Contest < ActiveRecord::Base
  has_many :photos
  belongs_to :user

  validates :user_id, uniqueness: true
  after_create :get_pictures

  def get_pictures
    access_token = User.find(self.user_id).access
    facebook = Koala::Facebook::API.new(access_token)
    facebook.get_object("me?fields=name,photos")["photos"]["data"].each do |photo|
      result = Photo.create(url: photo["images"][2]["source"], user_id: self.id) unless photo["images"][2].nil?
    end
  end

  # This is breaking the app if there's only one contest
  # def random_contest
  #   contest_to_vote_on = Contest.all.sample
  #   if contest_to_vote_on == self
  #     self.random_contest
  #   else
  #     contest_to_vote_on
  #   end
  # end

  def max_pics
    self.photos.count >= 5
  end
end
