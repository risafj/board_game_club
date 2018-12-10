module MemberHelper
  # Change this to "Create wednesday member"
  def default_member
    Member.create(name: "Tester1", favorite_game: Game.first, available_days: [Weekday.third], friends: [])
  end

  # Change this to create friend of Member One
  def default_member2
    Member.create(name: "Tester2", favorite_game: Game.first, available_days: [Weekday.third], friends: [Member.first])
  end
end