require 'test_helper'

class LandTest < ActiveSupport::TestCase
  def setup
    @land = FactoryBot.create(:land)
  end

  test "land has address" do
    @land.address = nil
    assert_not @land.valid?
  end

  test "land has neighborhood" do
    @land.neighborhood = nil
    assert_not @land.valid?
  end


end
