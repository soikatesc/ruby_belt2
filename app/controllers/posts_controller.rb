class PostsController < ApplicationController
	def index
		@current_user = current_user
		@posts = Post.all
	end

	def create
		post = Post.create(
			post_params.merge(user: current_user)
			)
		if post.valid?
			redirect_to '/bright_ideas'
		else
			flash[:errors] = post.errors.full_messages
			redirect_to "/bright_ideas"
		end
	end

	def like
		Like.create(post: Post.find(params[:post_id]), user:current_user)
		redirect_to '/bright_ideas'
	end

	def destory
		Post.destroy(params[:post_id])
		redirect_to '/bright_ideas'
	end

	def show
		@current_user = current_user
		@post = Post.find(params[:post_id])
		@users_liked = @post.users_liked.group('id')
	end

	private
		def post_params
			params.require(:post).permit(:content)
		end
end
