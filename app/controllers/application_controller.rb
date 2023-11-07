class ApplicationController < ActionController::Base
  include ApplicationHelper

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) do |user|
        user.permit(:name, :email, :password, :stripe_customer_id)
      end
  
      devise_parameter_sanitizer.permit(:account_update) do |user|
        user.permit(:name, :email, :password, :current_password, :stripe_customer_id)
      end
    end
  
  def authenticate_admin!
    if user_signed_in?
      unless admin?
        flash[:danger] = "you are not authorized for this action"
        redirect_to root_path 
      end
    else
      flash[:warning] = "Log In first!"
      redirect_to new_user_session_path
    end
  end
end

