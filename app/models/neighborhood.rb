class Neighborhood < ApplicationRecord
  validates :name, :city, :state, presence: true
  validates :state, length: { is: 2 }
end
