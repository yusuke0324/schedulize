class Feedback < ApplicationRecord
	belongs_to :user
	belongs_to :slot


	validates :rating, :slot, :user, presence: true
	validates :slot, :user, uniqueness: true
end
