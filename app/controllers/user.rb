get '/users/new' do
  erb :'users/new'
end

get '/users/:id' do
  @user = User.find(params[:id])
  if @user.id == session[:user_id]
    erb :"/users/show"
  else
    redirect '/login'
  end
end

post '/users' do
  @user = User.new(params)
  if @user.save
    session[:user_id] = @user.id
    redirect '/'
  else
    @error = "Something went wrong, please check your information and try again."
    erb :"users/new"
  end
end
