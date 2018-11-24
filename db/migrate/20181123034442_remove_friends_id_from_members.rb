class RemoveFriendsIdFromMembers < ActiveRecord::Migration[5.2]
  def change
    remove_column :members, :friends_id
  end
end
