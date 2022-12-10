class Api::V1::UsersController < ApiController
  def index
    @users = User.accessible_by(current_ability).page params[:page]

    render json: @users.as_json(except: %i[created_at updated_at role])
  end
end
