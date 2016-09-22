5.times do
User.create(username: Faker::Superhero.name, password: 'password', email: Faker::Internet.email)
end

Question.create(user_id: 1, title: "Take me out to the ball game...", body: "Which snack is most popularly sold at baseball games and comes with a toy surprise in every box?")
Answer.create(body: "cracker jacks", user_id: 1, question_id: 1, best: false)

Question.create(user_id: 2, title: "Do the twist", body: "Which trademarked 'sandwich cookie' made by Nabisco is considered 'Milk's Favorite Cookie'?")
Answer.create(body: "oreos", user_id: 2, question_id: 2, best: false)

Question.create(user_id: 3, title: "'You're Fired'", body: "Snack known for their orange tint, currently modeled by the Republican's Party 2016 Presidential Nominee?")
Answer.create(body: "cheetos", user_id: 3, question_id: 3, best: false)

Question.create(user_id: 4, title: "Centuries Old Snack", body: "Which snack cookie is modeled after the ancient fig roll?")
Answer.create(body: "fig newton", user_id: 4, question_id: 4, best: false)

Question.create(user_id: 5, title: "Doh!", body: "Nobody better lay a finger on my...")
Answer.create(body: "butterfinger", user_id: 5, question_id: 5, best: false)

10.times do
  Comment.create(user_id: rand(1..5), commentable_id: rand(1..5), commentable_type: 'Question', body: Faker::Hipster.paragraph )
end

20.times do
  Comment.create(user_id: rand(1..5), commentable_id: rand(1..5), commentable_type: 'Answer', body: Faker::Hipster.paragraph )
end

20.times do
  Vote.create(votable_id: rand(1..5), votable_type: 'Answer', user_id: rand(1..5))
end

20.times do
  Vote.create(votable_id: rand(1..5), votable_type: 'Question', user_id: rand(1..5))
end

User.create(username: 'admin', email: 'admin@gmail.com', password: '1234')
