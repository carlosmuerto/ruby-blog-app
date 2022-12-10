class Api::V1::CommentsController < ApiController
  def index
    @comments = Post.accessible_by(current_ability).find(params[:post_id]).comments

    render json: @comments
  end
end
