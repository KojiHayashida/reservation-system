# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
    family_name: "Admin",
    first_name:  "Admin",
    family_name_reading: "かんりしゃ",
    first_name_reading: "かんりしゃ",
    email: "admin@admin.com",
    password: "password",
    admin: true
)

10.times do |num|
    User.create!(
    family_name: "User#{num + 1}",
    first_name:  "User#{num + 1}",
    family_name_reading: "りようしゃ",
    first_name_reading: "りようしゃ",
    email: "user#{num + 1}@user.com",
    password: "password",
    admin: false
    )
end
