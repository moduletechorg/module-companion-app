require 'test_helper'

class UsersPretenderTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @admin = users(:admin_user)
    @nonadmin = users(:not_admin_user)
  end

  test 'admin can sign in as other user' do
    sign_in @admin
    get users_path
    assert_template 'users/index'
  end

  test 'nonadmin cannot sign in as other user' do

  end

end
