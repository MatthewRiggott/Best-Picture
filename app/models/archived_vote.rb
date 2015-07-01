class ArchivedVote < ActiveRecord::Base
  belongs_to :photo
  has_many :archived_contests

end
