get '/' do
	@post = Post.all
	@msg = params[:message]
  erb :"static/index"
end

get '/signup' do 
	erb :"static/signup"
end

post '/signup' do 
	user = User.new(params[:user])

	if user.save
		session[:user_id] = user.id
		@msg = "Account created!"
	else
		@msg = "Error, account failed to be created"
	end
	redirect "/?message=#{@msg}"
end

get '/login' do 
	erb :"static/login"
end

post '/login' do
	user = User.authenticate(params[:email],params[:password])
		if !user.nil?
			session[:user_id] = user.id
		 	name = user.username
		 	puts name
			@msg = "Login sucessful, welcome back #{name}"
		else
			@msg = "Username and password doesnt match or exist"
		end
	redirect "/?message=#{@msg}"
end

post '/logout' do 
	session.delete(:user_id)
	@msg = "Logged out"
	redirect "/?message=#{@msg}"
end