class ApplicationController < ActionController::Base
  include ApplicationHelper

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
