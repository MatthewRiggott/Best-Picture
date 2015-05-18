class AddUserIdToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :user_id, :integer, null: false
  end
end
