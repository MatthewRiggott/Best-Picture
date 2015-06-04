class AddHasVotedTwiceToUsers < ActiveRecord::Migration
  def up
    add_column :users, :can_view, :boolean, null: false, default: false
    User.all.each do |user|
      user.can_view = (user.votes.count >= 2)
    end
  end

  def down
    remove_column :users, :can_make
  end
end
