class Slot < ApplicationRecord
  belongs_to :mentor, class_name: "User", foreign_key: "user_id"
  has_many :students, through: :appointments, source: :student
  has_many :appointments
  has_many :feedbacks




end
