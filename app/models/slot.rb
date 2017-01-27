class Slot < ApplicationRecord
  attr_accessor :skip_must_be_after_now_validation
  belongs_to :mentor, class_name: "User", foreign_key: "user_id"
  has_many :students, through: :appointments, source: :student
  has_many :appointments
  has_many :feedbacks


  accepts_nested_attributes_for :feedbacks


  validate :start_must_be_before_end_time
  validate :start_must_be_after_now
  validates :title, presence: true

  validate :start_must_be_after_now, unless: :skip_must_be_after_now_validation


private
  def start_must_be_before_end_time
      errors.add(:start_time, "Start time must be before end of time") unless
          start_time < end_time
  end

  def start_must_be_after_now
    errors.add(:start_time, "Start time must be on the next calendar day") unless
        start_time > DateTime.now.utc
  end
end
