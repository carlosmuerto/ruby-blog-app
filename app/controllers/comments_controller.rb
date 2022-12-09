class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find params[:post_id]
    @comment = Comment.new(comment_params)
    @comment.author = current_user
    @comment.post = @post

		authorize! :create, @comment

    @comment.save
    redirect_to user_post_path @post.author, @post
  end

	def destroy
		@comment = Comment.includes(:author, :post).find(params[:id])
		@post = @comment.post
		authorize! :create, @comment

		@comment.destroy
    redirect_to user_post_path @post.author, @post
	end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
