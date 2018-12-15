class Member < ApplicationRecord
  validates :name, :favorite_game, :available_days, presence: true
  validates :name, length: { minimum: 2, maximum: 8 }

  # Below says "go to Game table, use id column as the foreign key"
  # inverse_of has plural "members" because :members belong to one game
  belongs_to :favorite_game, class_name: 'Game', inverse_of: :members
  has_and_belongs_to_many :available_days, join_table: 'members_weekdays', class_name: 'Weekday'

  # Modeled on
  # https://stackoverflow.com/questions/2168442/many-to-many-relationship-with-the-same-model-in-rails
  # Join tables have no id column on the very left.
  # Instead, they just have the foreign_key column and the association_foreign_key column.
  has_and_belongs_to_many(:friends, class_name: 'Member',
                                    join_table: 'member_friendships',
                                    foreign_key: 'member_a_id',
                                    association_foreign_key: 'member_b_id')
end
