class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action :set_flash_message, only: [:after_sign_in_path_for, :after_sign_out_path_for]
  
  
  
  def after_sign_in_path_for(resource)
    user_path(current_user)
  end
  
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
  
  def set_flash_message
    flash[:notice] = "Signed in successfully." if request.path == after_sign_in_path_for(nil)
    flash[:notice] = "Signed out successfully." if request.path == after_sign_out_path_for(nil)
  end
end
