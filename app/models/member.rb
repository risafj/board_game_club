class Member < ApplicationRecord
  validates :name, :favorite_game, presence: true
  validates :name, length: {minimum: 2, maximum: 8}
  
  # Says "go to Game table, use id column as the foreign key"
  belongs_to :favorite_game, class_name: "Game"
  belongs_to :available_days, class_name: "Weekday"
end
