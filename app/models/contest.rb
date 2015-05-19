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

  def self.random_contest
    Contest.all.sample
  end
end
