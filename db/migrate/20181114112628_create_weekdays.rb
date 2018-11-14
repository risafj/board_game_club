class CreateWeekdays < ActiveRecord::Migration[5.2]
  def change
    create_table :weekdays do |t|
      t.string :name

      t.timestamps
    end
    add_index :weekdays, :name, unique: true
  end
end
