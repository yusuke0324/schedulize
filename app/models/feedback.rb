class Feedback < ApplicationRecord
	
	belongs_to :user
	belongs_to :appointment

	validates :rating, :appointment_id, :user_id, presence: true
	validates :appointment_id, :user_id, uniqueness: true
	# validates :user_id, scope: { :user_id }
end
