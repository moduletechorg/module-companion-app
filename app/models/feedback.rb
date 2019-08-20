class Feedback < ApplicationRecord
  validates :name, presence: true
  validates :icon_class, presence: true

  has_many :user_land_feedbacks
  has_many :users, through: :user_land_feedbacks
  has_many :lands, through: :user_land_feedbacks
end
