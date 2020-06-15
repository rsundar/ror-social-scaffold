# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.create(
  name: 'Mario Barrios',
  email: 'mario@example.com',
  password: '123456',
  password_confirmation: '123456'
)

10.times do
  name = Faker::Name.first_name
  User.create(
    name: name,
    email: Faker::Internet.email(name: name, domain: 'example.com'),
    password: '123456',
    password_confirmation: '123456'
  )
end

User.all.each do |user|
  3.times { user.posts.create(content: Faker::Quote.matz) }
end
