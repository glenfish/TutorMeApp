# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Tutor.find_or_create_by(email: "nick.fehlberg@gmail.com", password: "pass1234", firstname: "Nick", lastname: "Fehlberg", address_1: "50 State St", address_2: "", postcode: "89102", state: "NV", country: "USA")
Tutor.find_or_create_by(email: "maryrosen@gmail.com", password: "pass1234", firstname: "Mary", lastname: "Rosen", address_1: "123 Main Street", address_2: "Apt C", postcode: "89103", state: "NV", country: "US")
Tutor.find_or_create_by(email: "haroldhoughton675@yahoo.com", password: "pass1234", firstname: "Harold", lastname: "Houghton", address_1: "54 1st Street", address_2: "Apt 60", postcode: "2000", state: "NSW", country: "AU")

Student.find_or_create_by(email: "joeblow@gmail.com", firstname: "Joe", lastname: "Blow", password: "pass1234")
