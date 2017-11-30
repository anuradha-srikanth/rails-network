# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

a1 = Account.create!(email: "kyra@gmail.com", role: "admin", password:"foobar", password_confirmation: "foobar");
a2 = Account.create!(email: "spock@gmail.com", role: "admin", password:"foobar", password_confirmation: "foobar");
Profile.create!(first_name: "Kyra", last_name:"Sigmund", phone_no: "(251)546-9442", email: a1.email, designation: "consulting", account_id: a1.id);
Profile.create!(first_name: "Spock", phone_no: "(125)546-4478", email: a2.email, designation: "aliens", account_id: a2.id);
# a1.create_profile(first_name: "Kyra", last_name:"Sigmund", phone_no: "(251)546-9442", email: a1.email, designation: "consulting")
# a2.create_profile(first_name: "Spock", phone_no: "(125)546-4478", email: a2.email, designation: "aliens")


# https://www.railstutorial.org/book/following_users