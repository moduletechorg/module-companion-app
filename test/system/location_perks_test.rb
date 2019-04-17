require "application_system_test_case"

class LocationPerksTest < ApplicationSystemTestCase
  setup do
    @location_perk = location_perks(:one)
  end

  test "visiting the index" do
    visit location_perks_url
    assert_selector "h1", text: "Location Perks"
  end

  test "creating a Location perk" do
    visit location_perks_url
    click_on "New Location Perk"

    fill_in "Name", with: @location_perk.name
    click_on "Create Location perk"

    assert_text "Location perk was successfully created"
    click_on "Back"
  end

  test "updating a Location perk" do
    visit location_perks_url
    click_on "Edit", match: :first

    fill_in "Name", with: @location_perk.name
    click_on "Update Location perk"

    assert_text "Location perk was successfully updated"
    click_on "Back"
  end

  test "destroying a Location perk" do
    visit location_perks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Location perk was successfully destroyed"
  end
end
