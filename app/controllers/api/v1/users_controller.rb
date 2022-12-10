class Api::V1::UsersController < ApiController
  def index
    @users = User.accessible_by(current_ability).page params[:page]

    render json: @users
  end

  def show
    user = User.includes(:posts).find params[:id]

    render json: user.as_json(
      include: {
        posts: {
          only: %i[id title comments_counter likes_counter]
        }
      }
    )
  end
end
