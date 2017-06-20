class SessionsController < ApplicationController
	def create
		user = User.find_by(email: login_params[:email])
		if user && user.authenticate(login_params[:password])
			session[:user_id] = user.id
			redirect_to '/bright_ideas'
		else
			flash[:login_error] = 'Invalid Credintials!.'
			redirect_to '/'
		end
	end

	def destroy
		reset_session
		redirect_to '/'
	end

	private 
		def login_params
			params.require(:login).permit(:email, :password)
		end
end
