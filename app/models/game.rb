class Game < ApplicationRecord
    has_many :members, foreign_key: "favorite_game"
end
