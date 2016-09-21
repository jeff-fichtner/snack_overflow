get '/questions/:id' do
  @question =  Question.find(params[:id])
  @answers = @question.answers.sort{ |a,b| b.total_votes <=> a.total_votes }
  @comments = @question.comments
  @votes = @question.votes
  erb :'questions/show'
end

get '/questions' do
  @questions = Question.all.sort{ |a,b| b.total_votes <=> a.total_votes }
  erb :'questions/index'
end
