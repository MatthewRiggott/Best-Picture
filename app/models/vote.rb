class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :contest
  belongs_to :photo

  validates :user, uniqueness: { scope: :contest,
    message: "can only vote once per contest" }
end
