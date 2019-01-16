class Land < ApplicationRecord
  belongs_to :neighborhood
  validates :address, :neighborhood, :size, :parcel_id, :pricing, :zoning_declaration, presence: true
  validates :parcel_id,
    format: {
      with: /\w{3}[0-9]-\w{0}[A-Z]-\w{4}[0-9]-\w{3}[0-9]-\w{1}[0-9]/,
      message: "Must be a valid Parcel ID format" },
    uniqueness: true
  has_many_attached :images
end
