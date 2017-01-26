class Feedback < ApplicationRecord
	belongs_to :user
	belongs_to :slot

	validates :rating, :appointment_id, :user_id, presence: true
	validates :appointment_id, :user_id, uniqueness: true
end
