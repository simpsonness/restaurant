require 'faker'

rand(20..40).times do
  t = Table.create(title: Faker::Lorem.words(rand(1..10)).join(" "), body: Faker::Lorem.paragraphs(rand(3..6)).join("\n"))
  rand(5..15).times do 
    t.comments.create(body: Faker::Lorem.paragraphs(rand(2..5)).join("\n"))
    end 
end

puts "Seed finished"
puts "#{Table.count} posts created"
puts "#{Comment.count} comments created"








# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
