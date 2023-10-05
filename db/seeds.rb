# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# db/seeds.rb

# Create some user records
User.create(name: 'John Doe', email: 'john@example.com')
User.create(name: 'Alice Smith', email: 'alice@example.com')
User.create(name: 'Bob Johnson', email: 'bob@example.com')

# Create some post records associated with users
Post.create(title: 'Post 1', text: 'This is the first post', user_id: 1)
Post.create(title: 'Post 2', text: 'Another post here', user_id: 2)
Post.create(title: 'Post 3', text: 'Yet another post', user_id: 3)

# Create some comments associated with users and posts
Comment.create(text: 'Nice post!', user_id: 2, post_id: 1)
Comment.create(text: 'I agree with you.', user_id: 3, post_id: 1)
Comment.create(text: 'Interesting discussion.', user_id: 1, post_id: 2)
Comment.create(text: 'Keep up the good work!', user_id: 2, post_id: 3)

# Create some likes associated with users and posts
Like.create(user_id: 1, post_id: 1)
Like.create(user_id: 2, post_id: 1)
Like.create(user_id: 3, post_id: 2)
Like.create(user_id: 1, post_id: 3)

