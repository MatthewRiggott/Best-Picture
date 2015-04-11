class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :url, null: false
      t.integer :vote_count, default: 0
    end
  end
end
