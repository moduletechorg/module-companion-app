class Neighborhood < ApplicationRecord
  validates :name, :city, :state, presence: true
  validates :state, length: { is: 2 }
  has_many :lands
  
  has_many_attached :images

  def city_state_name
    self[:city] + ', ' + self[:state]
  end

end
