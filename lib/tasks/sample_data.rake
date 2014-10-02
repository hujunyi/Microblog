namespace :db do
  desc "Fill database with sample data"

  task populate: :environment do
    make_users
    make_microposts
    make_relationships
  end
end

def make_users
  Rake::Task["db:reset"].invoke
  10.times do |n|
    name = Faker::Name.name
    email = "example-#{n+1}@joeyhu.info"
    password = "password"
    User.create!(name: name,
                 email: email,
                 password: password,
                 password_confirmation: password)
  end
  admin = User.create!(name: "Joey Hu",
                       email: "hujunyi1990@gmail.com",
                       password: "123456",
                       password_confirmation: "123456",
                       admin: true)
end


def make_microposts
  users = User.where.not(email: "hujunyi1990@gmail.com")
  5.times do
    content = Faker::Lorem.sentence(5)
    users.each { |user| user.microposts.create!(content: content) }
  end
end



def make_relationships
  users = User.all
  user = User.find_by(email: "hujunyi1990@gmail.com")
  demo_posts = ["Welcom to the microblog!", "This demo app is built on Ruby on Rails and Bootstrap.","I strictly followed TDD to develop this app. And I used Rspec/Capybara as my test script frameworks.", "The live version is hosted in my Heroku.","This is a twitter-like app in which you can post your microposts and follow others'.", "Source Code can be found here: http://github.com/hujunyi/Microblog", "Sign up an account and enjoy!"]
  followed_users = users[2..50]
  followers = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  #followers.each { |follower| follower.follow!(user) }
  demo_posts.reverse.each do |post|
    user.microposts.create!(content: post)
  end
end

