post '/plike/new' do 
	@like = Plike.find_by(user_id: current_user)
	if @like.nil?
		a = Plike.new
		a.user_id = session[:current_user]
		a.post_id = params[:question_id]
		a.yes = true
	else
		a.yes = true
	end
	a.save
	redirect "/"
end