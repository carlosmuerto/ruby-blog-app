class Api::V1::CommentsController < ApiController
  def index
    @comments = Post.accessible_by(current_ability).find(params[:post_id]).comments

    render json: @comments.as_json(except: %i[created_at updated_at posts_id])
  end
end
