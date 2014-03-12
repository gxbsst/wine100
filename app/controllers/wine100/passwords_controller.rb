#encoding: utf-8
module Wine100
	class PasswordsController < ::Wine100::ApplicationController
		before_filter :authenticate_wine100_user
		before_filter :get_profile
		before_filter :get_user
		

		def edit
		 # get_user
		end

		def update
			if @user.update_attributes(params[:wine100_user])
				flash[:notice] = '更新成功'
				redirect_to wine100_accounts_path
			else
				flash[:error] = '更新失败, 请确认密码是否匹配'
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

	end
end
