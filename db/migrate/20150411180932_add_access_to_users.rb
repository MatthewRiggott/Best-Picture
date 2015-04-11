class AddAccessToUsers < ActiveRecord::Migration
  def change
    add_column :users, :access, :string, null: false
  end
end
