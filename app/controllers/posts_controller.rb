class PostsController < ApplicationController
  def index
    @user = User.find params[:user_id]
    @posts = @user.posts.page(params[:page]).per(2)
  end

  def show
    @user = User.find params[:user_id]
    @post = Post.find params[:id]
    @comments = @post.comments.page params[:page]
  end

	def new
		@user = current_user
		@post = Post.new
		@post.author = @user
	end

	def like
		@post = Post.find params[:post_id]

		like = Like.create(author: current_user, post: @post)

		redirect_to user_post_path @post.author, @post
	end


	def create
		@post = Post.new(post_params)
		@post.author = current_user

		if @post.save
			redirect_to user_post_path @post.author, @post
		else
			render :new
		end
	end

	private

	def post_params
		params.require(:post).permit(:title, :text)
	end

end
