class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :invitable,
          :database_authenticatable,
          :registerable,
          :recoverable,
          :rememberable,
          :validatable,
          :confirmable,
          :trackable
  has_and_belongs_to_many :location_perks
  has_and_belongs_to_many :features
  has_many :visits, class_name: "Ahoy::Visit"

  validates_confirmation_of :password
  validates :email,
            :first_name,
            :last_name,
            :password,
            :budget,
            :housing_option,
            :state,
            :city,
            :preferred_bedroom,
            :preferred_bathroom,
            :move_in_time,
            :pre_approved_mortgage, presence: true
  validates :email, uniqueness: true
  validates :password, confirmation: true
  validates_confirmation_of :password
end
