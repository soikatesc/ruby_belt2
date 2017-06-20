class UsersController < ApplicationController
	before_action :user_logged_in, only: [:new]
	before_action :user_authorized, only: [:show]
	def new
	end

	def create
		user = User.create(user_params)
		if user.valid?
			session[:user_id] = user.id
			redirect_to '/bright_ideas'
		else
			flash[:registration_errors] = user.errors.full_messages
			redirect_to '/'
		end
	end

	def show
		@current_user = current_user
		@user_posts = Post.where(user:@current_user)
		@post_liked = @current_user.posts_liked
	end

	private
		def user_params
			params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :alias)
		end
end
