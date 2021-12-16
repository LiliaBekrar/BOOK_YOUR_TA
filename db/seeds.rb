# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Booking.destroy_all
Teacher.destroy_all
User.destroy_all

user = User.create!(email: "Jeanloup@ta.com", first_name: "Jean Loup", last_name: "Peres", password: "123456")
p "#{user.email} created"

teacher = Teacher.new(description: "Je suis un super TA", specialty: "JavaScript", price: "56", city_name: "Toulon", user_id: user.id)
teacher.photo.attach(io: File.open(Rails.root.join('app/assets/images/Jean_loup.jpg')), filename: 'Jean_loup.jpg')
teacher.save!
p "#{teacher.user.first_name} created"

user2 = User.create!(email: "Bruno@ta.com", first_name: "Bruno", last_name: "Guers", password: "123456")
p "#{user2.email} created"

teacher2 = Teacher.new(description: "Homme très dynamique spécialiste des groupes difficiles", specialty: "Ruby", price: "99", city_name: "Marseille", user_id: user2.id)
teacher2.photo.attach(io: File.open(Rails.root.join('app/assets/images/Bruno.jpg')), filename: 'Bruno.jpg')

teacher2.save!
p "#{teacher.user.first_name} created"

user3 = User.create!(email: "Pilou@ta.com", first_name: "Pierre Loic", last_name: "Pichon", password: "123456")
p "#{user3.email} created"

teacher3 = Teacher.new(description: "Je viens de loin, citoyen du monde, j'aime les photos non-contractuelles", specialty: "SQL", price: "60", city_name: "Lille", user_id: user3.id)
teacher3.photo.attach(io: File.open(Rails.root.join('app/assets/images/Pilou.jpg')), filename: 'Pilou.jpg')
teacher3.save!
p "#{teacher3.user.first_name} created"

user4 = User.create!(email: "isabelle@ta.com", first_name: "Isabelle", last_name: "Douin", password: "123456")
p "#{user4.email} created"

user5 = User.create!(email: "georgia@ta.com", first_name: "Georgia", last_name: "Drai", password: "123456")
p "#{user5.email} created"

teacher4 = Teacher.create!(description: "Je suis un super TA", specialty: "JavaScript", price: "56", city_name: "Toulon", user_id: user5.id)

Booking.create!(user_id: user5.id, teacher_id: teacher3.id, date: "2021-12-17 00:00:00.000000000 +0000", accepted: true)
p "booking created"

Booking.create!(user_id: user5.id, teacher_id: teacher2.id, date: "2022-01-14 00:00:00.000000000 +0000")
p "booking created"

Booking.create!(user_id: user3.id, teacher_id: teacher4.id, date: "2021-12-14 00:00:00.000000000 +0000", accepted: true)
p "booking created"

Booking.create!(user_id: user2.id, teacher_id: teacher4.id, date: "2022-05-14 00:00:00.000000000 +0000")
p "booking created"
