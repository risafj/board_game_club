class AddAvailableDaysToMembers < ActiveRecord::Migration[5.2]
  def change
    add_reference :members, :available_days, foreign_key: true
  end
end
