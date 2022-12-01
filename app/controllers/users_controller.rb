class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    # raise ActionController::RoutingError.new('Not Found')
    begin
      @user = User.find params[:id]
    rescue ActiveRecord::RecordNotFound => e
			ActiveRecord::RecordNotFound
    end
  end
end
