module MemberHelper
  def default_member
    Member.create(name: "Tester1", favorite_game: Game.first, available_days: [Weekday.third], friends: [])
  end

  def default_member_2
    Member.create(name: "Blob", favorite_game: Game.first, available_days: [Weekday.third], friends: [Member.first])
  end
end