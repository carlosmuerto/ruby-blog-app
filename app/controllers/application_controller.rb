class ApplicationController < ActionController::Base
  def current_user
    User.all.first
  end

  helper_method :current_user
end
