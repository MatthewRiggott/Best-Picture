class CreateArchivedVotes < ActiveRecord::Migration
  def change
    create_table :archived_votes do |t|
      t.integer :photo_id, null: false
      t.integer :votes, null: false
      t.integer :archived_contest_id, null: false
    end
  end
end
