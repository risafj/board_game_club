class Game < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  # dependent options
  # https://alexhandley.co.uk/rails-dependent-associations/
  # How to think about singular/plural in inverse_of - :game has_many members
  # https://www.viget.com/articles/exploring-the-inverse-of-option-on-rails-model-associations/
  has_many :members, foreign_key: 'favorite_game', dependent: :nullify, inverse_of: :game
end
