# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all 
Event.destroy_all 
Attendance.destroy_all 

Faker::Config.locale = 'fr'


3.times do 
User.create(
    email:Faker::Internet.email(domain: 'yopmail.com'),
    password:Faker::Internet.password,
    description:Faker::ChuckNorris.fact,
    first_name:Faker::Name.first_name, 
    last_name:Faker::Name.last_name)
    puts "ok user"
end 

3.times do
    Event.create(start_date:Faker::Date.between(from: '2021-01-01',to: '2021-12-31'), 
     duration:rand(5..100)*5,
     title:Faker::Games::Pokemon.name, 
     description:Faker::GreekPhilosophers.quote, 
     price:rand(1..1000),
     location:Faker::Nation.capital_city,
     admin_id: User.all.sample.id)
     
end


5.times do
    Attendance.create(
        stripe_customer_id:rand(1..60),
        user_id: User.all.sample.id,
        event_id: Event.all.sample.id)
end


#dans airbnb backend
#10.times do
	#Reservation.create(
		#start_date: Faker::Date.in_date_period, 
		#end_date: Faker::Date.in_date_period, 
		#listing: Listing.all.sample, 
		#user: User.all.sample)




