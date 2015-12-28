class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if
    session[:user_id]
  end

  def require_user
    redirect_to root_path unless current_user
  end

  def edit_profile
    unless current_user == User.find(params[:id])
      flash[:alert] = "You cannot access this page"
      redirect_to user_path(current_user)
    end
  end
  
end
