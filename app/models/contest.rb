class Contest < ActiveRecord::Base
  has_many :photos
  belongs_to :user
  
  validates :user_id, uniqueness: true
end
