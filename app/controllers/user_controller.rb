get '/user/profile' do 
	@user = User.find(current_user.id)
	erb :"users/profile"
end