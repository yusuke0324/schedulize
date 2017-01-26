require 'date'
Feedback.destroy_all
User.destroy_all
Slot.destroy_all

now = Time.now
tomorrow = now + 1.day
yesterday = now - 1.day
user = User.create(first_name: 'Seed', last_name: 'Mentor', phase: 1, mentor: true, email: 'mentor@seed.com', password: 'password', password_confirmation: 'password')
user = User.create(first_name: 'meric', last_name: 'bal', phase: 1, mentor: false, email: 'meric@bal.com', password: '1234', password_confirmation: '1234')


5.times do |i|
  Slot.create(title: "SeedSlot#{i}", capacity: i, start_time: now, end_time: tomorrow, mentor: user )
end



a = ['good', 'very nice', 'good', 'so good', 'so very fucking nice']
n = [1,2,3,4,5]
# 5.times do |i|
	# Feedback.create(rating: n.sample, comment: a.sample, appointment_id: i, user_id: i)
# end

Feedback.create(rating: n.sample, comment: a.sample, appointment_id: 1, user_id: 1)
Feedback.create(rating: n.sample, comment: a.sample, appointment_id: 2, user_id: 2)

Appointment.create(user_id: 1, slot_id: 1)
Appointment.create(user_id: 2, slot_id: 2)