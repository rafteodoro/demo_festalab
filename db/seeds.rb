# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

users = [
  {
    name: 'John Doe',
    email: 'john@doe.com',
    phone: '(11) 99999-9999',
    cpf: '123.456.789-10'
  },
  {
    name: 'Jane Doe',
    email: 'jane@doe.com',
    phone: '21999999999',
    cpf: '109.876.543-21'
  },
  {
    name: 'John Smith',
    email: 'smith@email.com',
    phone: '23999999999',
    cpf: '123.456.589-10'
  },
  {
    name: 'Jane Smith',
    email: 'smithj@email.com',
    phone: '31999999999',
    cpf: '109.876.543-22'
  },
  {
    name: 'John Doe Jr',
    email: 'johnjr@doe.com',
    phone: '(11) 88888-8888',
    cpf: '123.456.789-11'
  }
]

puts 'Creating users...'

users.each do |user|
  User.create!(user)
end

puts 'Users created successfully!'
