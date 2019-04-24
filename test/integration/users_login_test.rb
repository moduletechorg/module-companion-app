require 'test_helper'

class UsersLandsTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @admin = FactoryBot.create(:user, admin: true)
    @nonadmin = FactoryBot.create(:user)
  end


end
