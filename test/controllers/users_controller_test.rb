require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @admin = FactoryBot.create(:user, admin: true)
    @nonadmin = FactoryBot.create(:user)
  end

  test "should get index if admin" do
    sign_in @admin
    get users_path
    assert_response :success
  end

  test "should not get index if not admin" do
    sign_in @nonadmin
    get users_path
    assert_response :redirect
  end

  test "should be able to view own profile" do
    sign_in @nonadmin
    get user_path(@nonadmin)
    assert_response :success
  end

  test "non admin should not be able to view other profiles" do
    sign_in @nonadmin
    get user_path(@admin)
    assert_response :redirect
  end

  test "admin should be able to view other profiles" do
    sign_in @admin
    get user_path(@nonadmin)
    assert_response :success
  end

  test "should be able to edit own profile" do
    sign_in @nonadmin
    get edit_user_registration_path(@nonadmin)
    assert_response :success
  end

end
