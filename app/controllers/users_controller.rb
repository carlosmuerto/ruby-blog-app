class UsersController < ApplicationController

  before_action :authenticate_user!, :load_by_pagination, :only => :index

  load_and_authorize_resource

  def load_by_pagination
    @users = User.accessible_by(current_ability).page params[:page]
  end

  def index
  end

  def show
    @user = User.find params[:id]
		@recent_posts = @user.recent_posts.accessible_by(current_ability)
  end
end
