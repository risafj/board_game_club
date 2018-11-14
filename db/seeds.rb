%w{Checkers Monopoly Chess Scrabble}.each do |game|
    Game.create(name: game)
end

%w{Monday Tuesday Wednesday Thursday Friday}.each do |day|
    Weekday.create(name: day)
end
