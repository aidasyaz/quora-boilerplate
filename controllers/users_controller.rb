# class UsersController < ApplicationController
# 	def new
# 	end


# #session: used to store data during one request and can be read during later requests
# 	def create
# 		@user = User.new(user_params)
# 		if @user.save
# 			session[:user_id] = @user.id
# 			redirect_to '/'
# 		else
# 			#error
# 			redirect_to '/signup'
# 		end
# 	end

# 	private def user_params
# 		params.require(:user).permit(:email, :password)
		
# 	end
# end