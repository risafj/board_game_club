class Weekday < ApplicationRecord
    has_many :members, foreign_key: "available_days"
end
