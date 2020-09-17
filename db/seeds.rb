# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
 Comment.destroy_all
 Post.destroy_all
 Connection.destroy_all
 User.destroy_all 
 
 y = User.create(username: "Yulia", karma_score: 6, email: "juliana.ny2008@gmail.com", city: "Brooklyn", image: "", password_digest: 111, bio: "tall")
 o = User.create(username: "Olga", karma_score: 6, email: "liana.ny2008@gmail.com", city: "Minsk", image: "", password_digest: 111, bio: "tall")
 n = Post.create(user_id: y.id, title: "need help", description: "sit my god", image: "k", active: true)
 d = Post.create(user_id: o.id, title: "also need help", description: "bring pakage", image: "L", active: true)
 q = Comment.create(post_id: n.id, user_id: o.id, text: "How long")
 c = Connection.create(help_seeker_id: y.id, helper_id: o.id)
