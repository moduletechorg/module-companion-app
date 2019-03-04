require 'test_helper'

class NeighborhoodsLandsTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @admin = users(:admin_user)
    @neighborhood = neighborhoods(:lawrenceville)
    @land = lands(:two)
  end

  test 'users can filter land by neighborhood' do
    # get lands_path
    # assert_response :success
    # assert_template 'lands/index'
    # assert_select 'a[href=?]', neighborhood_lands_path(@neighborhood), text: "#{@neighborhood.name} Lots"
    # get neighborhood_lands_path(@neighborhood)
    # assert_response :success
    # assert_template 'lands/index'
    # assert_select 'h2', "#{@neighborhood.name} Land Lots"
    # assert_select 'a[href=?]', land_path(@neighborhood.lands.first), text: 'Learn More'
  end

  test 'deleting neighborhood deletes lands' do
    sign_in @admin
    assert_difference('Land.count', -1) do
      assert_difference('Neighborhood.count', -1) do
        delete neighborhood_path(@neighborhood)
      end
    end
  end

end
