# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require "faker"

10.times do
  Restaurant.create!(
    name: Faker::Company.name,
    summary: Faker::Company.catch_phrase,
    capacity: 50,
    map_url: '<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2887.042461718134!2d-79.38707569999995!3d43.64728490000001!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x882b34d17621bc11%3A0x3155c79d1dfa6d10!2s220+King+St+W%2C+Toronto%2C+ON+M5V+3M2!5e0!3m2!1sen!2sca!4v1416248805048" width="400" height="320" frameborder="0" style="border:0"></iframe>'
  )
end

5.times do
  Customer.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: "password",
    password_confirmation: "password"
  )  
end

5.times do
  Reservation.create!(
    customer_id: Customer.all.sample.id,
    restaurant_id: Restaurant.all.sample.id,
    time: Faker::Date.between(2.days.ago, Date.today),
    people: (1..10).to_a.sample
  )
end