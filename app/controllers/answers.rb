post '/answers' do
  question_id = params[:question_id]
  if logged_in?
    answer = Answer.new(body: params[:body], user_id: current_user.id, question_id: question_id)

    @errors = answer.errors.full_messages if !answer.save
    redirect "/questions/#{question_id}"
  else
    session[:question_id] = question_id
    erb :'/login'
  end
end
