class UserLandFeedback < ApplicationRecord
  validates :user_id, presence: true
  validates :land_id, presence: true
  validates :feedback_id, presence: true

  belongs_to :land, dependent: :destroy
  belongs_to :user, dependent: :destroy
  belongs_to :feedback, dependent: :destroy
end
