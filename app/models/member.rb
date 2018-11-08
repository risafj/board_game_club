class Member < ApplicationRecord
  belongs_to :favorite_game
  belongs_to :available_days
end
