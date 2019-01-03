class Neighborhood < ApplicationRecord
  validates :name, :city, :state, presence: true
  validates :state, length: { is: 2 }

  def city_state_name
    self[:city] + ', ' + self[:state]
  end
end
