post '/votes' do
  p params
  votable_id = params[:votable_id]
  votable_type = params[:votable_type]
  if !params[:question_id]
    question_id = params[:votable_id]
  else
    question_id = params[:question_id]
  end

  if logged_in?
    if current_user.votes.where(votable_id: votable_id, votable_type: votable_type).empty?
      current_user.votes.create(votable_id: votable_id, votable_type: votable_type)
    end
    if request.xhr?
      votable = grab_votable(votable_type, votable_id)
      content_type :json
      { votable_type: votable_type, voteable_id: votable_id, points: votable.total_votes }.to_json
    else
      redirect "/questions/#{question_id}"
    end
  else
    redirect '/login'
  end
end

def grab_votable(votable_type, votable_id)
  if votable_type == "Question"
    return Question.find(votable_id)
  elsif votable_type == "Answer"
    return Answer.find(votable_id)
  end
end
