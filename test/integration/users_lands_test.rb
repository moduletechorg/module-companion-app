require 'test_helper'

class UsersLandsTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @admin = users(:admin_user)
    @nonadmin = users(:not_admin_user)
    @land = lands(:one)
  end

  test 'index as non-admin user' do
    sign_in @nonadmin
    get lands_path
    assert_template 'lands/index'
    assert_select 'h2', 'Land Lots'
    assert_select 'a[href=?]', new_land_path, count: 0, text: 'Add a Land Lot'
  end

  test 'index as public' do
    get lands_path
    assert_template 'lands/index'
    assert_select 'h2', 'Land Lots'
    assert_select 'a[href=?]', new_land_path, count: 0, text: 'Add a Land Lot'
  end

  test 'index as admin user' do
    sign_in @admin
    get lands_path
    assert_template 'lands/index'
    assert_select 'h2', 'Land Lots'
    assert_select 'a[href=?]', new_land_path, text: 'Add a Land Lot'
  end

  test 'show as nonadmin user' do
    sign_in @nonadmin
    get land_path(@land)
    assert_template 'lands/show'
    assert_select 'h4', "Lot: #{@land.parcel_id}"
    assert_select 'a[href=?]', edit_land_path, count: 0, text: 'Edit Land Lot'
  end

  test 'show as public' do
    get land_path(@land)
    assert_template 'lands/show'
    assert_select 'h4', "Lot: #{@land.parcel_id}"
    assert_select 'a[href=?]', edit_land_path, count: 0, text: 'Edit Land Lot'
  end

  test 'show as admin user' do
    sign_in @admin
    get land_path(@land)
    assert_template 'lands/show'
    assert_select 'h4', "Lot: #{@land.parcel_id}"
    assert_select 'a[href=?]', edit_land_path, text: 'Edit Land Lot'
  end

  test 'edit as nonadmin user' do
    sign_in @nonadmin
    get edit_land_path(@land)
    assert_response :redirect
  end

  test 'edit as public' do
    get edit_land_path(@land)
    assert_response :redirect
  end

  test 'edit as admin user' do
    sign_in @admin
    get edit_land_path(@land)
    assert_response :success
    assert_template 'lands/edit'
  end
end
