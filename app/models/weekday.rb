class Weekday < ApplicationRecord
  has_and_belongs_to_many :members, join_table: 'members_weekdays'
end
