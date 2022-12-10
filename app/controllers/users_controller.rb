class UsersController < ApplicationController
  before_action :authenticate_user!
  authorize_resource

  def index
    @users = User.accessible_by(current_ability).page params[:page]
  end

  def show
    @user = User.find params[:id]
    @recent_posts = @user.recent_posts.accessible_by(current_ability)
  end
end
