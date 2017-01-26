class Feedback < ApplicationRecord
	# validates :appointment_id, :user_id, uniqueness: true

  belongs_to :user
end
