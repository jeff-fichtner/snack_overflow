class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :votes, as: :votable
  has_many :comments, as: :commentable

  validates_presence_of :user_id, :title, :body

  def total_votes
    self.votes.count
  end

  def is_owner?(user_id)
    self.user_id == user_id
  end
end
