post '/votes' do
  # validation needed
  if !params[:question_id]
    question_id = params[:votable_id]
  else
    question_id = params[:question_id]
  end
  current_user.votes.create(votable_id: params[:votable_id], votable_type: params[:votable_type])
  redirect "/questions/#{question_id}"
end
