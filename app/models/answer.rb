class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :votes, as: :votable
  has_many :comments, as: :commentable

  validates_presence_of :body, :user_id, :question_id, :best

  def total_votes
    self.votes.count
  end

  def is_owner?(user_id)
    self.user_id == user_id
  end
end
