require 'test_helper'

class UsersNeighborhoodsTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @admin = users(:admin_user)
    @nonadmin = users(:not_admin_user)
    @neighborhood = neighborhoods(:lawrenceville)
  end

  test 'index as public' do
    get neighborhoods_path
    assert_response :success
    assert_template 'neighborhoods/index'
    assert_select 'h2', 'Neighborhoods'
    assert_select 'a[href=?]', new_neighborhood_path, count: 0, text: 'Add a Neighborhood'
  end

  test 'index as nonadmin user' do
    sign_in @nonadmin
    get neighborhoods_path
    assert_response :success
    assert_template 'neighborhoods/index'
    assert_select 'h2', 'Neighborhoods'
    assert_select 'a[href=?]', new_neighborhood_path, count: 0, text: 'Add a Neighborhood'
  end

  test 'index as admin user' do
    sign_in @admin
    get neighborhoods_path
    assert_response :success
    assert_template 'neighborhoods/index'
    assert_select 'h2', 'Neighborhoods'
    assert_select 'a[href=?]', new_neighborhood_path, text: 'Add a Neighborhood'
  end

  test 'show as public' do
    get neighborhood_path(@neighborhood)
    assert_response :success
    assert_template 'neighborhoods/show'
    assert_select 'h2', "#{@neighborhood.name}"
    assert_select 'a[href=?]', edit_neighborhood_path(@neighborhood), count: 0, text: 'Edit Neighborhood'
  end

  test 'show as nonadmin user' do
    sign_in @nonadmin
    get neighborhood_path(@neighborhood)
    assert_response :success
    assert_template 'neighborhoods/show'
    assert_select 'h2', "#{@neighborhood.name}"
    assert_select 'a[href=?]', edit_neighborhood_path(@neighborhood), count: 0, text: 'Edit Neighborhood'
  end

  test 'show as admin user' do
    sign_in @admin
    get neighborhood_path(@neighborhood)
    assert_response :success
    assert_template 'neighborhoods/show'
    assert_select 'h2', "#{@neighborhood.name}"
    assert_select 'a[href=?]', edit_neighborhood_path(@neighborhood), text: 'Edit Neighborhood'
  end

  test 'edit as public' do
    get edit_neighborhood_path(@neighborhood)
    assert_response :redirect
  end

  test 'edit as nonadmin user' do
    sign_in @nonadmin
    get edit_neighborhood_path(@neighborhood)
    assert_response :redirect
  end

  test 'edit as admin user' do
    sign_in @admin
    get edit_neighborhood_path(@neighborhood)
    assert_response :success
    assert_template 'neighborhoods/edit'
    assert_select 'h2', "Editing #{@neighborhood.name}"
  end

end
