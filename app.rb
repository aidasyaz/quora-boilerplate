##controller actions in here

require_relative './config/init.rb'
set :run, true

get '/' do
  @name = "Bob Smith"
  erb :"home" #erb > embedded ruby to render 
end

# get '/date' do #will go to link
# 	@date = Time.now
# 	erb :"date/time" 
# end

get '/signup' do
	erb :"/signup"
end

post '/signup' do
	
	user = User.new(params[:user])
	if user.save
		#redirect to login page
		redirect :"/"
	else
		#redirect to signup page
		redirect :"/sign_up"
	end
end

get '/login' do
	erb :"/login"
end

post '/login' do
	# 1. check if email exist
	@user = User.find_by(email: params[:email])

	# 2. check if can find user and if password is valid
	# (valid-profile page) (invalid- relogin)
	if @user && @user.authenticate(params[:password])
		sign_in(user) #from session in helper
		redirect user_path (@user)

	else
		redirect '/login'
	end

  	erb :"/login"
end


get '/users/:id' do
	#find user by id
	@user = User.find_by(id: params[:id])
	#if id exist,redirect to profile page
	
	if @user
		erb :'users/profile'
	else
		redirect '/404'
	end
end

get '/404' do
	return "something went wrong :("
end

get'/logout' do
  sign_out # uses the sign out session in helpers file
  # redirect
  redirect back
end






























