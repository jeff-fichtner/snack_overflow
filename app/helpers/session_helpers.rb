helpers do

  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  def logged_in?
    session[:user_id] != nil

  end

  def owner?
    self.user_id == current_user.id
  end

end
