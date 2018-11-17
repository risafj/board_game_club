%w{Checkers Monopoly Chess Scrabble}.each do |game|
    Game.create(name: game)
end

%w{Monday Tuesday Wednesday Thursday Friday}.each do |day|
    Weekday.create(name: day)
end

# For has_and_belongs_to_many, you have to pass an array or an active record collection proxy (Weekday.where...)
5.times do |n|
    Member.create!(name: "Member#{n}", available_days: [Weekday.first, Weekday.second], favorite_game: Game.first)
end