class Feedback < ApplicationRecord
	belongs_to :user
	has_one :slot, through: :appointments


	validates :rating, :slot, :user, presence: true
	validates :slot, :user, uniqueness: true
end
