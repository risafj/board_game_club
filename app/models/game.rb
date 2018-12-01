class Game < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  
  has_many :members, foreign_key: "favorite_game"
end
