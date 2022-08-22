require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Contact.destroy_all

87.times do
  contact = Contact.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    cpf: Faker::IDNumber.brazilian_citizen_number,
    email: Faker::Internet.email,
    birth_date: Faker::Date.between_except(from: 60.years.ago, to: 1.year.from_now, excepted: Date.today),
  )

  contact.save
  contact.addresses.create(
    cep: '01001000',
    street: Faker::Address.street_name,
    neighborhood: Faker::Address.community,
    city: Faker::Address.city,
    state: Faker::Address.state,
    number: rand(10..9999),
  )

end

