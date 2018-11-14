class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :name
      t.references :favorite_game, index: true

      t.timestamps
    end
    add_index :members, :name, unique: true
  end
end
