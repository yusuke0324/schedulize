class Slot < ApplicationRecord
  belongs_to :user
  has_many :appointments
  # has_many :feedbacks, through: :appointments




end
