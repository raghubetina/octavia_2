class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:username, :curl_pattern_id, :porosity_id, :density_id, :age_group_id])

    devise_parameter_sanitizer.permit(:account_update, :keys => [:username, :curl_pattern_id, :porosity_id, :density_id, :age_group_id])
  end
end
