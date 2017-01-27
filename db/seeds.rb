# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'date'
Feedback.destroy_all
User.destroy_all
Slot.destroy_all

now = Time.now
tomorrow = now + 1.day
yesterday = now - 1.day
user = User.create(first_name: 'Seed', last_name: 'Mentor', phase: 1, mentor: true, email: 'mentor@seed.com', password: 'password', password_confirmation: 'password')

# create slot with now ~ tomorrow
5.times do |i|
  Slot.create(title: "SeedSlot_Active#{i}", capacity: i, start_time: now, end_time: tomorrow, mentor: user )
end

# create slot with 2days ago ~ yesterday

5.times do |i|
  Slot.create(title: "SeedSlot_Old#{i}", capacity: i, start_time: yesterday - 1.day, end_time: yesterday, mentor: user )
end

Feedback.create(rating: 1, comment: 'AAA', user_id: 7, slot_id: 7)
Feedback.create(rating: 5, comment: 'BBB', user_id: 2, slot_id: 6)
