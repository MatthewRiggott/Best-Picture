class Vote < ActiveRecord::Base
  after_create :check_votes

  belongs_to :user
  belongs_to :contest
  belongs_to :photo

  validates :user, uniqueness: { scope: :contest,
    message: "You can only vote once per contest" }


  private

  def check_votes
    if !user.can_view
      user.can_view = true if user.votes.count >= 2
    end
  end
end
