class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :name
      t.references :favorite_game, foreign_key: true
      t.references :available_days, foreign_key: true

      t.timestamps
    end
    add_index :members, :name, unique: true
  end
end
