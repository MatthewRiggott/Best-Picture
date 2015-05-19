class Photo < ActiveRecord::Base
  belongs_to :contest
  belongs_to :user

  validate :max_5_pics_per_contest, on: :update

  def max_5_pics_per_contest
    # the && logic checks if the picture is already part of this contest, which is ok
    if contest.photos.count >= 5 && !contest.photos.ids.include?(self.id)
      errors.messages[:max_pics_error] = ["You've already chosen 5 pictures"]
      false
    else
      true
    end
  end
end
