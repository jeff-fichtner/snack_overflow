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

put '/answers' do
  if logged_in?
    answer = Answer.find(params[:answer_id])
    question = answer.question
    if question.user_id == current_user.id && question.id == params[:question_id].to_i
      question.answers.update_all(best: false)
      answer.best = true
      answer.save
      redirect "questions/#{question.id}"
    else
      redirect "questions/#{question.id}"
    end
  else
    redirect '/login'
  end
end
