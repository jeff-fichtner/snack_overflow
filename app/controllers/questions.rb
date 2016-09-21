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
  # puts '============im here==================='
  # p params
  @question = Question.new(user_id: session[:user_id], title: params[:title], body: params[:body])
    if @question.save
      redirect "/questions/#{@question.id}"
    else
      @errors = "Something went wrong. Please check your entry and resubmit your post."
      erb :'/questions/new'
    end
end
