class PostsController < ApplicationController
  before_action :authenticate_user!
  authorize_resource

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.accessible_by(current_ability).order(updated_at: :desc).page(params[:page])
  end

  def show
    @post = Post.includes(:comments, :author).find params[:id]
    @comments = @post.comments.accessible_by(current_ability).page(params[:page]).includes(:author, post: [:author])
  end

  def new
    @post = Post.new
    @post.author = current_user

    authorize! :create, @post
  end

  def destroy
    @post = Post.includes(:author).find params[:id]
    @author = @post.author

    authorize! :destroy, @post

    @post.destroy

    redirect_to user_path @author
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user

    authorize! :create, @post

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
