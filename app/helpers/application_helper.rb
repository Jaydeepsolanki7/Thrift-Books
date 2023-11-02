module ApplicationHelper
  def admin?
    if user_signed_in?
      current_user.has_role? :admin
    else
      flash[:warning] = "Log In first"
      redirect_to new_user_session_path
    end
  end

  def author?
    unless current_user&.has_role? :author
      flash[:danger] = "You are not authorized to perform this action only author can create book."
      redirect_to category_path(params[:category_id])
    end
  end
end