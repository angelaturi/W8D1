# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

a = User.create(username: 'angela', password: 'password')
e = User.create(username: 'emma', password: 'password')

s1 = Sub.create(title: 'Lorde', description: 'Best songs', moderator_id: e.id)
s2 = Sub.create(title: 'NYC', description: 'The Big Apple', moderator_id: a.id)
s3 = Sub.create(title: 'food', description: 'Delicious things', moderator_id: e.id)

p1 = Post.create(title: 'Perfect Places', author_id: a.id, content: 'NYC, Paris, and London', sub_ids:[s1.id,s2.id])
p2 = Post.create(title: 'Ribs', author_id: e.id, content: 'I love that song/food!', sub_ids:[s1.id,s3.id])
p3 = Post.create(title: 'A World Alone', author_id: a.id, content: 'Studio apartment life', sub_ids:[s1.id,s2.id])
p4 = Post.create(title: 'Biting Down', author_id: e.id, content: '...on food', sub_ids:[s1.id,s3.id])