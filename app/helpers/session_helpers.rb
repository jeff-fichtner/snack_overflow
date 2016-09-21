helpers do

  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  def logged_in?
    if session[:user_id] != nil
    end
  end

  def owner?
    if self.user_id == current_user.id
    end
  end

end
