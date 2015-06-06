class ArchivedContest < ActiveRecord::Base
  has_many :photos, through: :archived_votes
  has_many :archived_votes
  belongs_to :user


end
