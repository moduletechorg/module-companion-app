require 'test_helper'

class UsersPretenderTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @admin = FactoryBot.create(:user, admin: true)
    @nonadmin = FactoryBot.create(:user)
  end

  test 'admin can sign in as other user and sign back out' do
    sign_in @admin
    get users_path
    assert_template 'users/index'
    assert_select 'a[href=?]', impersonate_user_path(@nonadmin), text: "Sign in as #{@nonadmin.email}"
    post impersonate_user_path(@nonadmin)
    assert_redirected_to root_path
    get root_path
    assert_select 'a[href=?]', stop_impersonating_users_path, text: "Back to admin"
  end

  test 'nonadmin cannot sign in as other user' do
    sign_in @nonadmin
    post impersonate_user_path(@admin)
    assert_redirected_to root_path
    get root_path
    assert_select 'a[href=?]', stop_impersonating_users_path, text: "Back to admin", count: 0
  end

  test 'admin cannot sign in as self using pretender' do
    sign_in @admin
    post impersonate_user_path(@admin)
    assert_redirected_to root_path
    get root_path
    assert_select 'a[href=?]', stop_impersonating_users_path, text: "Back to admin", count: 0
  end

end
