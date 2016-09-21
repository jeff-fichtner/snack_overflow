helpers do
  def logged_in?
    session[:user_id] != nil
  end

  def current_user
    if logged_in?
      return @current_user ||= User.find(session[:user_id])
    end
    return nil
  end
