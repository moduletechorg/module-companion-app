class Land < ApplicationRecord
  belongs_to :neighborhood
  validates :address, :neighborhood, presence: true
  # validates :parcel_id,
  #   format: {
  #     with: /\w{3}[0-9]-\w{0}[A-Z]-\w{4}[0-9]-\w{3}[0-9]-\w{1}[0-9]/,
  #     message: "Must be a valid Parcel ID format" },
  #   uniqueness: true
  has_many_attached :images
  has_many :nearby_locations, dependent: :destroy
  has_many :user_land_feedbacks
  has_many :users, through: :user_land_feedbacks
  has_many :feedbacks, through: :user_land_feedbacks
  attr_accessor :nearby_locations_10, :nearby_locations_mi

  scope :neighborhood_filter, -> (neighborhood_id) { where("neighborhood_id = ?", neighborhood_id) if neighborhood_id.present? }
  scope :land_type_filter, -> (land_type_id) { where("land_type_id = ?", land_type_id) }
end
