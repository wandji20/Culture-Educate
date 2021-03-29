class ApplicationController < ActionController::Base
  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  private

  def sign_in
    redirect_to new_session_path unless current_user
  end
end
