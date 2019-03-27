require 'test_helper'

class LandTest < ActiveSupport::TestCase
  def setup
      @land1 = lands(:one)
      @land2 = lands(:two)

      @eastliberty = neighborhoods(:eastliberty)
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

  test "land has land_type" do
    @land1.land_type = nil
    assert_not @land1.valid?
  end


end
