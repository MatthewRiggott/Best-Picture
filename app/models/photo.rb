class Photo < ActiveRecord::Base
  belongs_to :contest
  belongs_to :user

  validate :max_5_pics_per_contest, on: :update

  def max_5_pics_per_contest
    if contest.photos.count >= 5
      errors.messages[:max_pics_error] = ["You've already chosen 5 pictures"]
      false
    else
      true
    end
  end
end
