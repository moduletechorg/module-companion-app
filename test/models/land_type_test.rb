require 'test_helper'

class LandTypeTest < ActiveSupport::TestCase

  def setup
    @land_type = land_types(:exclusive)
  end

  test 'land type name must exist' do
    @land_type.name = ''
    assert_not @land_type.valid?
  end
end
