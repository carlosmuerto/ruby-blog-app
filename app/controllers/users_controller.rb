class UsersController < ApplicationController
  def index
    @users = User.all.page params[:page]
  end

  def show
    # raise ActionController::RoutingError.new('Not Found')
    @user = User.find params[:id]
  end
end
