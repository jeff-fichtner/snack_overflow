10.times do
User.create(username: Faker::Superhero.name, password_hash: 'password', email: Faker::Internet.email)
end

5.times do
Question.create(user_id: rand(1..10), title: Faker::Hipster.sentence, body: Faker::Hipster.paragraph)
end

30.times do
  Answer.create(body: Faker::Hipster.paragraph, user_id: rand(1..10), question_id: rand(1..5), best: false)
end

30.times do
  Comment.create(user_id: rand(1..10), commentable_id: rand(1..5), commentable_type: 'Question', body: Faker::Hipster.paragraph )
end

30.times do
  Comment.create(user_id: rand(1..10), commentable_id: rand(1..30), commentable_type: 'Answer', body: Faker::Hipster.paragraph )
end

20.times do
  Vote.create(votable_id: rand(1..30), votable_type: 'Answer', user_id: rand(1..10))
end

20.times do
  Vote.create(votable_id: rand(1..5), votable_type: 'Question', user_id: rand(1..10))
end
