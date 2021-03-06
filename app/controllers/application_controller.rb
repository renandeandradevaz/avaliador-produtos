class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :email, :name) }
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:login, :email, :name, :password, :password_confirmation) }
  end

end