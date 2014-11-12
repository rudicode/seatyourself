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
    summary: Faker::Company.catch_phrase
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