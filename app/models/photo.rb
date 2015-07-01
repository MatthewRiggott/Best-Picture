class Photo < ActiveRecord::Base
  belongs_to :contest
  belongs_to :user
  has_one :archived_vote

  # validate :max_5_pics_per_contest, on: :update


end
