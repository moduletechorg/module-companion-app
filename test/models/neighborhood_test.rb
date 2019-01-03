require 'test_helper'

class NeighborhoodTest < ActiveSupport::TestCase
  def setup
      @neighborhood = neighborhoods(:eastliberty)
  end

  test 'valid neighborhood' do
    assert @neighborhood.valid?
  end

  test 'invalid without name' do
    @neighborhood.name = nil
    assert_not @neighborhood.valid?
  end

  test 'invalid without city' do
    @neighborhood.city = nil
    assert_not @neighborhood.valid?
  end

  test 'invalid without state' do
    @neighborhood.state = nil
    assert_not @neighborhood.valid?
  end

  test 'state must be two letter abbreviation' do
    @neighborhood.state = 'Pennsylvania'
    assert_not @neighborhood.valid?
  end

end
