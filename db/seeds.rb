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
# teacher.photo.key = "Jean_loup_tgx3wa"
teacher.save!
p "#{teacher.user.first_name} created"

user2 = User.create!(email: "Bruno@ta.com", first_name: "Bruno", last_name: "Guers", password: "123456")
p "#{user2.email} created"

teacher = Teacher.new(description: "Homme très dynamique spécialiste des groupes difficiles", specialty: "Ruby", price: "99", city_name: "Marseille", user_id: user2.id)
# teacher.photo.key = "Bruno_jcdar1"
teacher.save!
p "#{teacher.user.first_name} created"

user3 = User.create!(email: "Pilou@ta.com", first_name: "Pierre Loic", last_name: "Guers", password: "123456")
p "#{user3.email} created"

teacher = Teacher.new(description: "Je viens de loin, citoyen du monde, j'aime les photos non-contractuelles", specialty: "SQL", price: "60", city_name: "Lille", user_id: user3.id)
# teacher.photo.key = "Pilou_dlkb9q"
teacher.save!
p "#{teacher.user.first_name} created"

user4 = user3 = User.create!(email: "isabelle@ta.com", first_name: "Isabelle", last_name: "Douin", password: "123456")
p "#{user3.email} created"
