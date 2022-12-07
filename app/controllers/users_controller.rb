class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all.page params[:page]
  end

  def show
    # raise ActionController::RoutingError.new('Not Found')
    @user = User.find params[:id]
  end
end
