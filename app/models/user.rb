class User < ActiveRecord::Base
  has_many :votes
  has_many :comments
  has_many :questions
  has_many :answers
  has_many :answered_questions, through: :answers, source: :question

  validates_presence_of :username, :email, :password_hash

  validates :email, :uniqueness => true

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(password)
    self.password == password
  end
end
