require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = FactoryBot.create(:user)
  end

  test "user is valid" do
    assert @user.valid?
  end

  test "email is required" do
    @user.email = nil
    assert_not @user.valid?
  end

  test "email is unique" do
    new_user = FactoryBot.build(:user, email: @user.email)
    assert_not new_user.valid?
  end

  test "first name is required" do
    @user.first_name = nil
    assert_not @user.valid?
  end

  test "last name is required" do
    @user.last_name = nil
    assert_not @user.valid?
  end

  test "housing_option is required" do
    @user.housing_option = nil
    assert_not @user.valid?
  end

  test "state is required" do
    @user.state = nil
    assert_not @user.valid?
  end

  test "city is required" do
    @user.city = nil
    assert_not @user.valid?
  end

  test "preferred_bedroom is required" do
    @user.preferred_bedroom = nil
    assert_not @user.valid?
  end

  test "preferred_bathroom is required" do
    @user.preferred_bathroom = nil
    assert_not @user.valid?
  end

  test "move_in_time is required" do
    @user.move_in_time = nil
    assert_not @user.valid?
  end

  test "budget is required" do
    @user.budget = nil
    assert_not @user.valid?
  end

  test "pre_approved_mortgage is required" do
    @user.pre_approved_mortgage = nil
    assert_not @user.valid?
  end

end
