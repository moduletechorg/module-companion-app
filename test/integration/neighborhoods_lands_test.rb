require 'test_helper'

class UsersNeighborhoodsTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @neighborhood = neighborhoods(:lawrenceville)
  end

  test 'users can filter land by neighborhood' do
    get lands_path
    assert_response :success
    assert_template 'lands/index'
    assert_select 'a[href=?]', neighborhood_lands_path(@neighborhood), text: "#{@neighborhood.name} Lots"
    get neighborhood_lands_path(@neighborhood)
    assert_response :success
    assert_template 'lands/index'
    assert_select 'h2', "#{@neighborhood.name} Land Lots"
    assert_select 'a[href=?]', land_path(@neighborhood.lands.first), text: 'Learn More'
  end

end
