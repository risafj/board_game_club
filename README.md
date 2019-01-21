# Board Game Club

## Overview
This is a simple project showcasing how relational databases work. I built an Rails API app for a board game club.

From the API, you can add/delete members, each of whom have a favorite game, weekdays that they are available on, and may have friends in the club. You can add/delete games as well.

## Motivation and DB Desription
My goal was to learn how to create relational data such as `belongs_to`, `has_many` and `has_and_belongs_to_many`. I managed to use these in my DB, such as "member belongs to favorite game":

```
belongs_to :favorite_game, class_name: 'Game', inverse_of: :members
```

For the relationship "member has and belongs to many available_days", I created a join table (migration below):
```
class CreateJoinTableMemberAvailableDays < ActiveRecord::Migration[5.2]
  def change
    create_join_table :members, :weekdays do |t|
      t.index %i[member_id weekday_id]
      t.index %i[weekday_id member_id]
    end
  end
end
```

The relationship "member has and belongs to many friends" also needed a join table, but the difference was that this table had to be self-joining (the friends are also members). So I created a table without an id column manually.

Migration:
```
class JoinTableForMemberFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table 'member_friendships', id: false do |t|
      t.integer 'member_a_id', null: false
      t.integer 'member_b_id', null: false
    end
  end
end
```

Model:
```
has_and_belongs_to_many(:friends, class_name: 'Member',
                                    join_table: 'member_friendships',
                                    foreign_key: 'member_a_id',
                                    association_foreign_key: 'member_b_id')
```