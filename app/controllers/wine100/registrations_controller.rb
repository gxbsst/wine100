# encoding: utf-8

module Wine100
	class RegistrationsController < ::Wine100::ApplicationController
		def new
			redirect_to wine100_accounts_path if current_user
			@user = Wine100::User.new	
		end

		def create
			redirect_to wine100_accounts_path if current_user
			
			@user = Wine100::User.new(params[:wine100_user])

			if @user.valid? && @user.save
				flash[:notice] = '注册成功'
				redirect_to wine100_accounts_path
			else
				render :new
			end
		end
	end
end