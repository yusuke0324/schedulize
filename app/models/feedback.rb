class Feedback < ApplicationRecord
	belongs_to :user
	belongs_to :slot


	validates :rating, :slot_id, :user_id, presence: true
	validates :slot_id, :user_id, uniqueness: true
end
