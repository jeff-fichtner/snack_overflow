class User < ActiveRecord::Base
  has_many :votes
  has_many :comments
  has_many :questions
  has_many :answers
  has_many :answered_questions, through: :questions, source: :answers
end
