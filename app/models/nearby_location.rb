class NearbyLocation < ApplicationRecord
  validates :name, presence: true
  belongs_to :land
end
