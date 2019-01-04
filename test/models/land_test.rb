require 'test_helper'

class LandTest < ActiveSupport::TestCase
  def setup
      @land1 = lands(:one)
      @land2 = lands(:two)

      @eastliberty = neighborhoods(:eastliberty)
  end

  test "land has parcel_id" do
    @land1.parcel_id = nil
    assert_not @land1.valid?
  end

  test "land has address" do
    @land1.address = nil
    assert_not @land1.valid?
  end

  test "land has size" do
    @land1.size = nil
    assert_not @land1.valid?
  end

  test "land has zoning_declaration" do
    @land1.size = nil
    assert_not @land1.valid?
  end

  test "land has neighborhood" do
    @land1.neighborhood = nil
    assert_not @land1.valid?
  end

  test "land has pricing" do
    @land1.pricing = nil
    assert_not @land1.valid?
  end

  test "parcel_id format is correct" do
    @land1.parcel_id = '8493947'
    assert_not @land1.valid?
  end


end
