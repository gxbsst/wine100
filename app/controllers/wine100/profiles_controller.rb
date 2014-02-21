#encoding: utf-8
module Wine100
	class ProfilesController < ::Wine100::ApplicationController

		before_filter :authenticate_user
		before_filter :get_profile

		def show
			@profile = current_user.profile
		end
		
		def new
		 redirect_to edit_wine100_profile_path(current_user.profile) if current_user.profile 
		 @profile =  current_user.build_profile 
		end

		def create
		  @profile = current_user.profile(params) || current_user.build_profile(params[:wine100_profile])
		  if @profile.valid? && @profile.save
		  	redirect_to wine100_accounts_path
		  else
		  	render :new
		  end
		end

		def edit
			@profile = current_user.profile
		end

		def update
			
		end

		private

		def get_profile
			@profile = current_user.profile 
		end
	end
end
