post '/votes' do
  if logged_in?
    if !params[:question_id]
      question_id = params[:votable_id]
    else
      question_id = params[:question_id]
    end
    if current_user.votes.where(votable_id: params[:votable_id], votable_type: params[:votable_type]).empty?
      current_user.votes.create(votable_id: params[:votable_id], votable_type: params[:votable_type])
    end
    redirect "/questions/#{question_id}"
  else
    redirect '/login'
  end
end
