class LandType < ApplicationRecord
  validates :name, presence: true
  has_many :lands, dependent: :destroy

end
