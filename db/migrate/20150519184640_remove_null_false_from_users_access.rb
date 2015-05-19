class RemoveNullFalseFromUsersAccess < ActiveRecord::Migration
  def change
    change_column :users, :access, :string, :null => true
  end
end
