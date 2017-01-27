class Slot < ApplicationRecord
  belongs_to :mentor, class_name: "User", foreign_key: "user_id"
  has_many :students, through: :appointments, source: :student
  has_many :appointments
  has_many :feedbacks

  validate :start_must_be_before_end_time
  validate :start_must_be_after_now
  validates :title, presence: true

private
  def start_must_be_before_end_time
      errors.add(:start_time, "start_time must be before end time") unless
          start_time < end_time
  end

  def start_must_be_after_now
    errors.add(:start_time, "start_time can't be in the past") unless
        start_time > DateTime.UtcNow
  end
end
