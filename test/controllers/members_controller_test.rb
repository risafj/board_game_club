require 'test_helper'

class MembersControllerTest < ActionDispatch::IntegrationTest
  def setup
    Rails.application.load_seed
    @member_params = {member: {name: "Tester", favorite_game: "Checkers", available_days: ["Monday"], friends: ["Member2"]}}
    @duplicated_friendship_params = {member: {friends: ["Member3", "Member3", "Member2"]}}
  end
 
  test "should create member" do
    post '/member', params: @member_params
    assert_response :success
    assert response.body.include? "Tester"
  end
  
  test "duplicate friendships should not be created" do
  assert_equal 2, @duplicated_friendship_params[:member][:friends].count('Member3')
  post '/member/1/friends', params: @duplicated_friendship_params
  assert_response :success
  assert response.body.include? "Member3"
  assert_equal 1, response.body.scan("Member3").length
  end

end
