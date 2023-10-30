class ApplicationController < ActionController::Base
  def authenticate_admin!
    unless current_user&.has_role?(:admin)
      flash[:danger] = "You are not authorized to perform this action."
      redirect_to root_path
    end
  end

  def authenticate_author!
    unless current_user&.has_role?(:author)
      flash[:danger] = "You are not authorized to perform this action only author can create book."
      redirect_to category_path(params[:category_id])
    end
  end
end
