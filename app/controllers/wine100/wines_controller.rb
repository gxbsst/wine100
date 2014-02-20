#encoding: utf-8
module Wine100
	class WinesController < ::Wine100::ApplicationController

		
		before_filter :authenticate_user

		before_filter :check_profile_completed

		def index
			
		end

		def new
			
		end

		def create
			
		end

		private


	  def check_profile_completed
	  	if current_user && !current_user.is_completed
	  		redirect_to new_wine100_profile_path
	  	end
	  end

	end
end
