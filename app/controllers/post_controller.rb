get '/post/new' do 
	erb :"posts/create"
end

post '/post/new' do
	user = current_user()
	post = user.posts.create(content: params[:post],user_id: current_user.id)
	if post.save
		@msg = "Post Created!"
	else
		@msg = "Sorry, post was unable to be created."
	end
	redirect "/?message=#{@msg}"
end

get '/post/show/:post_id' do 
	question = params[:post_id]
	@comment = Comment.where(post_id: params[:post_id])
	@post = Post.find(params[:post_id])
	erb:"posts/post_profile", :layout => :post_admin
end

get '/post/edit/:post_id' do 
	@post = Post.find(params[:post_id])
	@ph = @post.content
	erb:"posts/edit"
end

post '/post/edit/:post_id' do 
	@qid = params[:post_id]
	@question = Post.find(params[:post_id]) 
	@question.content= params[:editor]
	@question.save
	redirect "/post/show/#{@qid}"
end

post '/post/delete/:post_id' do 
	@qid = params[:post_id]
	@post = Post.find(params[:post_id])
	@post.destroy
	redirect "/"
end