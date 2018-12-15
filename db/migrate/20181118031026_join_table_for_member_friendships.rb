class JoinTableForMemberFriendships < ActiveRecord::Migration[5.2]
  def change
    # The difference between below and making a join_table: Rails knows that a join_table shouldn't have an id column.
    # But this case is out of the norm (self-joining using a single model).
    # So you need to create a table manually and then tell it not to create an id column.
    # rubocop:disable Rails/CreateTableWithTimestamps
    create_table 'member_friendships', id: false do |t|
      t.integer 'member_a_id', null: false
      t.integer 'member_b_id', null: false
      # rubocop:enable Rails/CreateTableWithTimestamps
    end
  end
end
