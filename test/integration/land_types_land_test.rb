require 'test_helper'

class LandTypesLandsTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @exclusive = land_types(:exclusive)
    @land = lands(:one)
    @admin = users(:admin_user)
  end


end
