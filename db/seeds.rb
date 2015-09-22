# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
100.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'password',
    )
end

10.times do
  Deal.create(
    title: Faker::Lorem.sentence(rand(3..20)),
    image: 'image/path',
    description: Faker::Lorem.paragraph(1),
    goal: 100,
    location: 'Seattle, WA',
    start: Faker::Time.between(2.days.ago, Time.now, :all),
    end: Faker::Time.forward(30),
    amount: 500,
    owner_id: rand(1..10),
    )
end

