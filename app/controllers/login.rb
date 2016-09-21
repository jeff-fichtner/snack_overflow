get '/login' do
  erb :login
end

post '/login' do
  user = User.find_by(email: params[:email])
  if user != nil
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/users/#{user.id}"
    else
      @errors = "username or password not found"
      erb :login
    end
  else
    @errors = "username or password not found"
    erb :login
  end
end

get '/logout' do
  session.destroy
  redirect '/'
end
