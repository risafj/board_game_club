class AddFriendsToMembers < ActiveRecord::Migration[5.2]
  def change
    add_reference :members, :friends, foreign_key: true
  end
end
