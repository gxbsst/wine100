#encoding: utf-8
module Wine100
	class SessionsController < ::Wine100::ApplicationController

		def new
			redirect_to wine100_accounts_path if current_user
			@user = Wine100::User.new
		end

		def create
			if params[:wine100_user][:name].blank? && params[:wine100_user][:password].blank?
				redirect_to root_path
				return
			end
			@user = User.find_by_name(params[:wine100_user][:name])
			if @user && @user.authenticate(params[:wine100_user][:password])
				session[:wine100_user_id] = @user.id
				if @user.is_completed
				 redirect_to wine100_accounts_path
				else
				 redirect_to complete_wine100_accounts_path
				end

			else
				@user = Wine100::User.new
				flash[:error] = "请输入正确的用户名和密码 Invalid e-mail or password."
				render :new
			end
		end

		def destroy
			session[:wine100_user_id] = nil
			redirect_to new_wine100_session_path
		end
	end
end
