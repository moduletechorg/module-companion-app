class Neighborhood < ApplicationRecord
  validates :name, :city, :state, presence: true
  validates :state, length: { is: 2 }
  before_create :user_is_admin?
  before_update :user_is_admin?
  before_destroy :user_is_admin?

  def city_state_name
    self[:city] + ', ' + self[:state]
  end
end
