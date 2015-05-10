class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :contest
  belongs_to :photo
end
