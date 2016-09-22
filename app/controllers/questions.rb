get '/questions' do
  @questions = Question.all.sort{ |a,b| b.total_votes <=> a.total_votes }
  erb :'questions/index'
end

get '/questions/new' do
  erb :'questions/new'
end

get '/questions/:id' do
  @question =  Question.find(params[:id])
  @answers = @question.answers.sort{ |a,b| b.total_votes <=> a.total_votes }
  @comments = @question.comments
  @votes = @question.votes
  session[:question_id] = @question.id
  erb :'questions/show'
end

post '/questions' do
  @question = Question.new(user_id: session[:user_id], title: params[:title], body: params[:body])
    if @question.save
      redirect "/questions/#{@question.id}"
    else
      @errors = "Something went wrong. Please check your entry and resubmit your post."
      erb :'/questions/new'
    end
end


get '/questions/:id/comments/new' do
  @question = Question.find(params[:id])
  erb :'/comments/new'
end

post '/questions/:id/comment' do
  @question = Question.find(params[:id])
  @comment = Comment.new(user_id: current_user.id, commentable_id: @question.id, commentable_type: 'Question', body: params[:body])
  if @comment.save
    redirect "/questions/#{@question.id}"
  else
    @errors = @comment.errors.full_messages
  erb :'/comments/new'
  end
end

get '/questions/:question_id/answers/:id/comment/new' do
  @question = Question.find(params[:question_id])
  @answer = Answer.find(params[:id])
  erb :"comments/new"
end

post '/questions/:question_id/answers/:id/comment' do
  @question = Question.find(params[:question_id])
  @answer = Answer.find(params[:id])
  @comment = Comment.new(user_id: current_user.id, commentable_id: @answer.id, commentable_type: 'Answer', body: params[:body])
  if @comment.save
    redirect "/questions/#{@question.id}"
  else
  @errors = "There was a problem posting your comment. Please try again."
  erb :'/comments/new'
  end
end

