class CreateArchivedContests < ActiveRecord::Migration
  def change
    create_table :archived_contests do |t|
      t.integer :user_id
      t.timestamps
    end
  end
end
