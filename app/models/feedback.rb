class Feedback < ApplicationRecord
	belongs_to :user
	has_one :slot, through: :appointments

	validates :rating, :appointment_id, :user_id, presence: true
	validates :appointment_id, :user_id, uniqueness: true
end
