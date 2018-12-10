module MemberHelper
  # Change this to "Create Wednesday member"
  def wednesday_member
    Member.create(name: "Tester1", favorite_game: Game.first, available_days: [Weekday.third], friends: [])
  end

  # Change this to create friend of Member One
  def friend_of_wednesday_member
    Member.create(name: "Tester2", favorite_game: Game.first, available_days: [Weekday.third], friends: [Member.first])
  end
end