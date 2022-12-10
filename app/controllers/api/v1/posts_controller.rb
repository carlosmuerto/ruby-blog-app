class Api::V1::PostsController < ApiController
  def index
    user = User.includes(:posts).find params[:user_id]
    posts = user.posts.accessible_by(current_ability).order(updated_at: :desc).page(params[:page])

    render json: posts.as_json(except: %i[created_at updated_at users_id])
  end
end
