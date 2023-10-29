class ApplicationController < ActionController::Base
  def authenticate_admin!
    unless current_user&.has_role?(:admin)
      flash[:danger] = "You are not authorized to perform this action."
      redirect_to root_path
    end
  end
end
