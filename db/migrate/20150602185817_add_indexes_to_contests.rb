class AddIndexesToContests < ActiveRecord::Migration
  def change
    add_index :votes, [:user_id, :contest_id], unique: true
  end
end
