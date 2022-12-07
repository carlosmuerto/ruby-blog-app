class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def authenticate_user!
    return if user_signed_in?

    store_location_for(:user, request.url)
    redirect_to new_user_session_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name bio photo])
  end
end
