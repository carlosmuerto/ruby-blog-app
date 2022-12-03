class CommentsController < ApplicationController
	def create
		@post = Post.find params[:post_id]
		@comment = Comment.new(comment_params)
		@comment.author = current_user
		@comment.post = @post

		if @comment.save
			redirect_to user_post_path @post.author, @post
		else
			# do some Error handeling
		end
	end

	private

	def comment_params
		params.require(:comment).permit(:text)
	end
end
