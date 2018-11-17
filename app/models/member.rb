class Member < ApplicationRecord
  validates :name, :favorite_game, :available_days, presence: true
  validates :name, length: {minimum: 2, maximum: 8}
  
  # Says "go to Game table, use id column as the foreign key"
  belongs_to :favorite_game, class_name: "Game"
  has_and_belongs_to_many :available_days, join_table: "members_weekdays", class_name: "Weekday"

end