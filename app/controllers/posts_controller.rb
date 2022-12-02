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
end
