#encoding: utf-8
module Wine100
	class ProfilesController < ::Wine100::ApplicationController

		before_filter :authenticate_user
		
		def new
		 @profile = current_user.profile || current_user.build_profile 
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
			
		end

		def update
			
		end
	end
end
