# encoding: utf-8
module Wine100
 class ApplicationController < ActionController::Base

 	  layout 'wine100_application'

	  before_filter :set_locale
	  # before_filter :check_profile_completed

	  protect_from_forgery

	  private

	  def set_locale
	    I18n.locale = params[:locale] || I18n.default_locale
	  end

	  def current_user
	    @user = User.find(session[:wine100_user_id]) if session[:wine100_user_id]
	  end

	  def authenticate_user
	  	
	    unless current_user
	      redirect_to new_wine100_session_path
	    end
	  end


	  helper_method :current_user
	end
end