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
user = User.create(username: 'SeedMentor', phases: 1, mentor: true, email: 'mentor@seed.com', password: 'password')

5.times do |i|
  Slot.create(title: "SeedSlot#{i}", capacity: i, start_time: now, end_time: tomorrow, user: user )
end

# Feedback.create(rating: 1, comment: 'AAA', appointment_id: 1, user_id: 1)
# Feedback.create(rating: 5, comment: 'BBB', appointment_id: 2, user_id: 2	)
