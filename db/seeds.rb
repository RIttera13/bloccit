require 'random_data'


Post.find_or_create_by(title: "Seeded Post Title", body: "Seeded Post Body")

given = Post.find_by_title("Seeded Post Title")

Comment.find_or_create_by(
post: given,
body: "Body has a Seeded Post"
)

50.times do
  Post.create!(
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph
  )
end
posts = Post.all

100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
