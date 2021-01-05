class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  # :nocov:
  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |user| user.permit(:name, :email, :password, :role)}
    devise_parameter_sanitizer.permit(:account_update) { |user| user.permit(:name, :email, :password, :current_password, :role)}
  end
  # :nocov:

end
