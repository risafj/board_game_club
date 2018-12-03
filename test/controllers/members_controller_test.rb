require 'test_helper'

class MembersControllerTest < ActionDispatch::IntegrationTest
  def setup
    Rails.application.load_seed
    @memberparams = {member: {name: "Tester", favorite_game: "Checkers", available_days: ["Monday"], friends: ["Member2"]}}
    @friendshipparams = {member: {friends: ["Member3", "Member3"]}}
  end
 
  test "should create member" do
    post '/member', params: @memberparams
    assert_response :success
    assert response.body.include? "Tester"
  end
  
  test "duplicate friendships should not be created" do
  post '/member/1/friends', params: @friendshipparams
  assert_response :success
  assert response.body.include? "Member3"
  # The above works, but next you need to check the fact that there are no duplicates based on the response.
  # Work on that when you have insomnia so you can check the actual response.
  byebug
  end

end
