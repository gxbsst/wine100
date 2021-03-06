#encoding: utf-8
module Wine100
	class ProfilesController < ::Wine100::ApplicationController

		before_filter :authenticate_wine100_user
		before_filter :get_profile

		def show
			@profile = current_user.profile
		end
		
		def new
			@profile = current_user.build_profile 
		end

		def create
			@profile = current_user.profile(params) || current_user.build_profile(params[:wine100_profile])
			if @profile.valid? && @profile.save
				redirect_to edit_wine100_profile_path(@profile, :for => 'contact')
			else
				render :new
			end
		end

		def edit
			@profile = current_user.profile
		end

		def update
			if @profile.update_attributes(params[:wine100_profile])
				flash[:notice] = t('updated_successfully')
				case params[:for]
				when 'company'
					step = 'contact'
				when 'contact'
					step = 'finance'
				else
					flash[:notice] = '您的信息已经录入， 现在可录入参赛用酒.'
					redirect_to new_wine100_wine_path
					return 
				end
				redirect_to edit_wine100_profile_path(@profile, :for => step)
				
			else
				flash[:error] = t('updated_failed')
				render :edit
			end
		end

		protected	

		def get_profile
			@profile = current_user.profile  || current_user.build_profile
		end
	end
end
