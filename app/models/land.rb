class Land < ApplicationRecord
  belongs_to :neighborhood
  belongs_to :land_type
  validates :address, :neighborhood, :size, :parcel_id, :pricing, :zoning_declaration, :land_type, presence: true
  validates :parcel_id,
    format: {
      with: /\w{3}[0-9]-\w{0}[A-Z]-\w{4}[0-9]-\w{3}[0-9]-\w{1}[0-9]/,
      message: "Must be a valid Parcel ID format" },
    uniqueness: true
  has_many_attached :images

  scope :neighborhood_filter, -> (neighborhood_id) { where("neighborhood_id = ?", neighborhood_id) if neighborhood_id.present? }
  scope :land_type_filter, -> (land_type_id) { where("land_type_id = ?", land_type_id) }
end
