class Feedback < ApplicationRecord
	belongs_to :user
	has_one :slot, through: :appointments


	validates :rating, :slot_id, :user_id, presence: true
	validates :slot_id, :user_id, uniqueness: true
end
