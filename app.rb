##controller actions in here

require_relative './config/init.rb'
# set :run, true

get '/' do
  @name = "Bob Smith"
  erb :"home"
  #erb > embedded ruby to render 
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
		redirect :"/signup"
	end
end

get '/login' do
	erb :"/login"
end

post '/login' do
	# 1. check if email exist
	@user = User.find_by(email: params[:user][:email])
	# 2. check if can find user and if password is valid
	# (valid-profile page) (invalid- relogin)
	if @user && @user.authenticate(params[:user][:password])
		sign_in(@user) #from session in helper
		redirect "/users/#{@user.id}"
	else
		redirect '/login'
	end

  	# erb :"/login"
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


##questions section

#list all
get '/questions' do
	@question = Question.all
	erb :"questions/index" 
end

#create questions
get '/questions/new' do
	erb :"questions/new"
end

#post created questions based on id

post '/questions' do

	@question = Question.new(params[:question])
	@question.user_id = current_user.id
	@question.save
	#redirect to question page
	redirect :"/questions/#{@question.id}"
end 

#display id question on a page
get '/questions/:id' do
	@question = Question.find_by(id: params[:id])
	erb :"/questions/show"
end

#load edit form
get '/questions/:id/edit' do
	@question = Question.find_by(id: params[:id])
	erb :"/questions/edit"
end

#post edit action
post '/questions/:id/edit' do
	@question = Question.find_by(id: params[:id])
	@question.title = params[:question]
	@question.details = params[:question]
	@question.save
	redirect :"/questions/#{@question.id}"
end

#delete form
delete '/questions/:id/delete' do
	@question = Question.find_by(id: params[:id])
	@question.destroy
	redirect '/questions'
end


##Answer sections

#list all answer at index page
get '/answers' do
	@answer = Answer.all
	erb :"answers/index" 
end

#create answer at new page
get '/answers/new' do
	erb:"answers/new"
end

#create new answer
post '/answers' do
	@answer = Answer.new(params[:answer])
	@answer.user_id = current_user.id
	@answer.save
	redirect "/questions/{question.id}"
end

#show answer based on id
get '/questions/:id/' do
	@answer = Answer.find_by(id: params[:id])
	erb '/questions/show'
end


# #edit answer
# get '/answers/:id/edit' do

# end

# delete answer
# delete '/answers/:id/delete' do
# 	@answer =Answer.find_by(id: params[:id])
# 	@answer.delete
# 	redirect '/answers'
# end


































