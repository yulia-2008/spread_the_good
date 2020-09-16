# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
 User.destroy_all 
 User.create(username: "Yulia", karma_score: 6, email: "juliana.ny2008@gmail.com", city: "Brooklyn", image: "", password_digest: 111, bio: "tall")