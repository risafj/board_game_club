require 'test_helper'

class MembersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get members_create_url
    assert_response :success
  end

  test "should get delete" do
    get members_delete_url
    assert_response :success
  end

  test "should get add_friend" do
    get members_add_friend_url
    assert_response :success
  end

  test "should get delete_friend" do
    get members_delete_friend_url
    assert_response :success
  end

end
