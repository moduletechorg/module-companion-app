require 'test_helper'

class LocationPerksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @location_perk = location_perks(:one)
  end

  test "should get index" do
    get location_perks_url
    assert_response :success
  end

  test "should get new" do
    get new_location_perk_url
    assert_response :success
  end

  test "should create location_perk" do
    assert_difference('LocationPerk.count') do
      post location_perks_url, params: { location_perk: { name: @location_perk.name } }
    end

    assert_redirected_to location_perk_url(LocationPerk.last)
  end

  test "should show location_perk" do
    get location_perk_url(@location_perk)
    assert_response :success
  end

  test "should get edit" do
    get edit_location_perk_url(@location_perk)
    assert_response :success
  end

  test "should update location_perk" do
    patch location_perk_url(@location_perk), params: { location_perk: { name: @location_perk.name } }
    assert_redirected_to location_perk_url(@location_perk)
  end

  test "should destroy location_perk" do
    assert_difference('LocationPerk.count', -1) do
      delete location_perk_url(@location_perk)
    end

    assert_redirected_to location_perks_url
  end
end
