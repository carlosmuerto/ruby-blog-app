class CommentsController < ApplicationController
  before_action :authenticate_user!, unless: :devise_controller?

  def create
    @post = Post.find params[:post_id]
    @comment = Comment.new(comment_params)
    @comment.author = current_user
    @comment.post = @post
    @comment.save
    redirect_to user_post_path @post.author, @post
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
