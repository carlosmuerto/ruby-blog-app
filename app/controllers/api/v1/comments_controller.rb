class Api::V1::CommentsController < ApiController
  def index
    @comments = Post.accessible_by(current_ability).find(params[:post_id]).comments.page params[:page]

    render json: @comments.as_json(except: %i[created_at updated_at posts_id])
  end

	def create
    @post = Post.find params[:post_id]
    @comment = Comment.new(comment_params)
    @comment.author = current_user
    @comment.post = @post

    authorize! :create, @comment

		if @comment.save
			render json: @comment.as_json(except: %i[created_at updated_at posts_id])
		else
			render json: @comment.errors, status: :unprocessable_entity
		end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
