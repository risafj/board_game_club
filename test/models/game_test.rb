require 'test_helper'

class GameTest < ActiveSupport::TestCase
  
  test "game cannot have blank name" do
    game = Game.new(name: nil)
    assert_not game.save
    game.name = ""
    assert_not game.save
    game.name = "Clue"
    assert game.save
  end
  
end
