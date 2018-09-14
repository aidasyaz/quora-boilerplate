class User < ActiveRecord::Base
	has_secure_password 
	
	
	# validates :password, length: {minimum: 8} #validate password min length 

	validates :email, format:{with: /\A[^@\s]+@[^@\s]+\z/, message: "is invalid"}, uniqueness: true
	#validate email is unique and valid format

	# # validates :user_name, length: {minimum: 5}
	# #validate username min length
end

# irb -r ./config/init.rb > test if database exist
# try User.new to test if it works



      
      
   

