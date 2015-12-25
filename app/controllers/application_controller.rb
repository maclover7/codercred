class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate_user!
    unless session[:user_id]
      flash[:error] = "You must be logged in in order to see this page."
      redirect_to root_url
    end
  end
  helper_method :authenticate_user!

  def current_user
    @current_user ||= User.find(session[:user_id])
  end
  helper_method :current_user

  def user_signed_in?
    !session[:user_id].nil?
  end
  helper_method :user_signed_in?
end
