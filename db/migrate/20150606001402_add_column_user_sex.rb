class AddColumnUserSex < ActiveRecord::Migration
  def change
    add_column :users, :sex, :string, null: false
  end
end
