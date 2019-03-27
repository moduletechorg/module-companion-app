require 'test_helper'

class NearbyLocationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get nearby_locations_new_url
    assert_response :success
  end

  test "should get create" do
    get nearby_locations_create_url
    assert_response :success
  end

  test "should get update" do
    get nearby_locations_update_url
    assert_response :success
  end

  test "should get edit" do
    get nearby_locations_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get nearby_locations_destroy_url
    assert_response :success
  end

  test "should get index" do
    get nearby_locations_index_url
    assert_response :success
  end

end
