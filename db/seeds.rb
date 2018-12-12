# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |n|
	email = "testowy-#{n+1}@mail.org"
  	password = "password"
  	User.create!(email: email,
               	password:              password,
               	password_confirmation: password)
end

User.create!(email: "admin@admin.com",
             password:              "Test90()",
             password_confirmation: "Test90()",
             isAdmin: true)

Page.create!(about: "To jest przykładowy tekst dla strony O nas - możesz zmienić go w panelu administracyjnym",
			 contact: "To jest przykładowy tekst dla strony Kontaks - możesz zmienić go w panelu administracyjnym"
			)