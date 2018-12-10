require 'test_helper'
require_relative '../helpers/member_helper'

class WeekdayTest < ActiveSupport::TestCase
  include MemberHelper

  # Loads seeds file before testing - necessary in this case because I need all the weekdays loaded.
  def setup
    Rails.application.load_seed
  end

  test "member count goes up if member is added to a specific day" do
    assert_not Weekday.third.members.present?
    # Create a member with weekday 3
    assert Weekday.third.members.present?
  end

  test "member count goes down if member is deleted from a specific day" do
    member = default_member
    assert_not Weekday.third.members.blank?

    member.destroy
    assert Weekday.third.members.blank?
  end

end
