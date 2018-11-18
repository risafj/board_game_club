class JoinTableForMemberFriendships < ActiveRecord::Migration[5.2]
  def change
    # The difference between below and making a join_table is simply that Rails knows that a join_table shouldn't have an id column.
    # But for this case, since youa are doing smth out of the norm (self-joining using a single model), you need to create a table manually and then tell it not to create an id column.
    create_table "member_friendships", id: false do |t|
    t.integer "member_a_id", null: false
    t.integer "member_b_id", null: false
    end
  end
end
