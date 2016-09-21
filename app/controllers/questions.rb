get '/questions/:id' do
  @question =  Question.find(params[:id])
  @answers = @question.answers
  @comments = @question.comments
  @votes = @question.votes
  erb :'/questions/show'
end

get '/' do
  redirect '/questions/1'
end
