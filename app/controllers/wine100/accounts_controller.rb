#encoding: utf-8
module Wine100
	class AccountsController < ::Wine100::ApplicationController

		before_filter :authenticate_wine100_user
		before_filter :get_profile
		before_filter :get_user
		
		def index
			@wines = current_user.wines
		end

		def edit
			@user = current_user
		end

		def update
			@user = current_user
		 if @user.update_attributes(params[:wine100_user])
		 	flash[:notice] = t('updated_successfully')
		 	redirect_to wine100_accounts_path
		 else
		 	flash[:notice] = t('updated_failed')
		 	render :edit
		 end
		end

		private 

		def get_profile
			@profile = current_user.profile || current_user.build_profile
		end

		def get_user
			@user ||= current_user
		end


		# def complete
		# 	@profile = current_user.profile || current_user.build_profile 
		# end

	end
end
