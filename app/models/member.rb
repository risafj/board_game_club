class Member < ApplicationRecord
  validates :name, :favorite_game, presence: true
  validates :name, length: {minimum: 2, maximum: 8}, uniqueness: true
  
  belongs_to :favorite_game, foreign_key: "name", class_name: “Game”
  belongs_to :available_days, foreign_key: "name", class_name: “WeekDay”
end
