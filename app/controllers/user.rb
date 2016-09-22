get '/users/new' do
  erb :'users/new'
end

# route to user profile page:
# get '/users/:id' do
#   @user = User.find(params[:id])
#   if @user.id == session[:user_id]
#   erb :"/users/show"
#   else
#     redirect '/login'
#   end
# end

post '/users' do
  @user = User.new(params)
  if @user.save
    session[:user_id] = @user.id
    redirect '/'
    # redirect "users/#{@user.id}"
  else
    # stretch: add more spec. error messages based on user input
    @errors = "Something went wrong, please check your information and try again."
    erb :"users/new"
  end
end
