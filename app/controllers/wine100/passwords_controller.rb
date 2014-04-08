#encoding: utf-8
module Wine100
	class PasswordsController < ::Wine100::ApplicationController
		before_filter :authenticate_wine100_user, :except => [:forgot, :reset]
		before_filter :get_profile, :except => [:forgot, :reset]
		before_filter :get_user, :except => [:forgot, :reset]
		

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

		def forgot
			@user = Wine100::User.new
			if request.post?
				if !params[:wine100_user][:email].present?

					flash[:error] = '请输入您的注册邮箱。'
					return
				end
				@user = Wine100::User.find_by_email(params[:wine100_user][:email])
				if !@user.present?
					flash[:error] = '该用户不存在。'
				else
					@user.fogot_password_token = SecureRandom.urlsafe_base64
					@user.fogot_password_created_at = Time.now
					@user.save
					::ForgetPasswordMailer.forgot(@user).deliver
					flash[:notice] = "尊敬的#{@user.email}用户， 我们已经将重置密码链接发到您的邮箱， 请注意查收."
				end
				@user
			end
		end

		def reset
			if !params[:k].present?
				flash[:error] = '对不起， 该链接无效.'
				redirect_to new_wine100_session_path
				return 
			else
				@user = Wine100::User.find_by_fogot_password_token(params[:k])
				if @user.reset_password_token_expire?
					flash[:error] = '对不起， 该链接无效.'
					redirect_to new_wine100_session_path
					return
				else
					flash[:notice] = '请重置您的密码。'
					session[:wine100_user_id] = @user.id
					redirect_to edit_wine100_password_path(@user)
				end
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
