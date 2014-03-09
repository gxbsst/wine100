class ApplicationController < ActionController::Base

  before_filter :set_locale

  protect_from_forgery

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def current_user
    if session[:user_id].present?
    @user ||= User.find(session[:user_id])
    else
      nil
    end
  end

  def authenticate_user
    unless current_user
      redirect_to new_session_path
    end
  end

  helper_method :current_user

end
