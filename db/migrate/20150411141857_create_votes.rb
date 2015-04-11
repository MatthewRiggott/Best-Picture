class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id, null: false, index: true
      t.integer :photo_id, null: false
      t.integer :contest_id, null: false
      t.timestamps
    end
  end
end
