post '/comment/new' do 
	user = current_user()
	comment = user.comments.create(opinion: params[:comment],user_id: current_user.id, post_id: params[:post_id])
	@qid = params[:post_id]
	if comment.save
		@msg = "Answer subitted!"
		redirect to "/post/show/#{@qid}"
	else
		@msg = "Error, answer failed to be created"
	end
	redirect "/post/show/#{@qid}"
end

post '/comment/delete/:comment_id' do 
	@comment = Comment.find(params[:comment_id])
	id = @comment.post_id
	@comment.destroy
	redirect "/post/show/#{id}"
end

get '/comment/edit/:comment_id' do
	@com = Comment.find(params[:comment_id])
	@post = @com.post_id
	@ph = @com.opinion
	@comment = params[:comment_id]
	erb :"comment/edit"
end

post '/comment/edit/:comment_id' do 
	@comment = Comment.find(params[:comment_id])
	@qid = @comment.post_id
	@comment.opinion = params[:editor]
	@comment.save
	redirect "post/show/#{@qid}"
end