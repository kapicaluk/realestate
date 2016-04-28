class AccountsController < ApplicationController

def login
end

def logout
	@user = User.find(session[:user_id])
	session[:user_id] = nil 
end

def authenticate
	user = User.find_by_email(params[:email])
	if user != nil && user.authenticate(params[:password])
	session[:user_id] = user.user.id
	if user.usertype == 'Admin'
		redirect_to user_listings_path(user)
	else 
		redirect_to users_path
	end 
else 
	redirect_to login_path 
		

		end 
	end
end
