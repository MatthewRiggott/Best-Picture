class Photo < ActiveRecord::Base
  belongs_to :contest
  belongs_to :user

  # validate :max_5_pics_per_contest, on: :update

  
end
