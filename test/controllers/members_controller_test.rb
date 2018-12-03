require 'test_helper'

class MembersControllerTest < ActionDispatch::IntegrationTest
  def setup
    Rails.application.load_seed
    @memberparams = {member: {name: "Tester", favorite_game: "Checkers", available_days: ["Monday"], friends: ["Member2"]}}
  end
 
  test "should create member" do
    post '/member', params: @memberparams
    assert_response :success
    assert response.body.include? "Tester"
  end

end
