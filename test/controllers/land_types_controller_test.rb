require 'test_helper'

class LandTypesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @land_type = land_types(:exclusive)
    @admin = users(:admin_user)
  end

  test 'admin can view land types' do
    get land_types_path
    assert_response :redirect
    sign_in @admin
    get land_types_path
    assert_response :success
    assert_template 'land_types/index'
  end

  test 'admin can add land types' do
    get new_land_type_path
    assert_response :redirect
    sign_in @admin
    get new_land_type_path
    assert_response :success
    assert_template 'land_types/new'
  end

  test 'admin can edit land types' do
    get edit_land_type_path(@land_type)
    assert_response :redirect
    sign_in @admin
    get edit_land_type_path(@land_type)
    assert_response :success
    assert_template 'land_types/edit'
  end

end
