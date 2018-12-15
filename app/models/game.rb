class Game < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  # Dependent options:
  # https://alexhandley.co.uk/rails-dependent-associations/
  has_many :members, foreign_key: 'favorite_game', dependent: :nullify
end
