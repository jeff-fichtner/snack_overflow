get '/login' do
  erb :login
end

post '/login' do
  user = User.find_by(email: params[:email])
  if user != nil
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/questions/#{session[:question_id]}" if session[:question_id]
      redirect "/users/#{user.id}"
    else
      @error = "Username or password not found."
      erb :login
    end
  else
    @error = "Username or password not found."
    erb :login
  end
end

get '/logout' do
  session.destroy
  redirect '/'
end
