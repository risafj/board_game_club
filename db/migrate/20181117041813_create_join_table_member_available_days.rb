class CreateJoinTableMemberAvailableDays < ActiveRecord::Migration[5.2]
  def change
    create_join_table :members, :weekdays do |t|
      t.index [:member_id, :weekday_id]
      t.index [:weekday_id, :member_id]
    end
  end
end