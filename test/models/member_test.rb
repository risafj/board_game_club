require 'test_helper'
require_relative '../helpers/member_helper'

class MemberTest < ActiveSupport::TestCase
  include MemberHelper

  def setup
    Rails.application.load_seed
  end

  test 'adding as friend only works one way' do
    member1 = wednesday_member
    member2 = friend_of_wednesday_member

    assert_not member2.friends.blank?
    assert member1.friends.blank?

    member1.update(friends: [Member.second])
    assert_not member1.friends.blank?
  end
end
