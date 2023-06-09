# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do |t|
  coordinators = Coordinator.create!([{name: "Coordinator-#{t}", email: "coordinator-#{t}@test.com", gender: 'Male', phone_number: "12345679#{t}", date_of_birth: Time.now}])
  participants = Participant.create!([{name: "Participant-#{t}", email: "participant-#{t}@test.com", phone_number: "123456#{t}79", gender: "Male", date_of_birth: Time.now + 1.month}])
  registries = Registry.create!([{name: "Registry-#{t}", location: "Test Location", status: 'open'}])
end