class CreateContests < ActiveRecord::Migration
  def change
    create_table :contests do |t|
      t.references :user, foreign_key: true

      t.timestamps null: false
    end
  end
end
