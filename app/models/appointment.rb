class Appointment < ApplicationRecord
  belongs_to :slot
  belongs_to :student, class_name: "User", foreign_key: "user_id"
  has_one :mentor, through: :slot, source: :mentor
  #appointments don't need to know about feedback, feedbacks are solely handed thru the 'Slot' event
end
