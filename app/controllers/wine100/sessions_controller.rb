#encoding: utf-8
module Wine100
	class SessionsController < ::Wine100::ApplicationController

		def new
			redirect_to wine100_accounts_path if current_user
			@user = Wine100::User.new
		end

		def create
			if params[:wine100_user][:email].blank? && params[:wine100_user][:password].blank?
				redirect_to root_path
				return
			end
			@user = ::Wine100::User.find_by_email(params[:wine100_user][:email])
      if @user && @user.authenticate(params[:wine100_user][:password])
        session[:wine100_user_id] = @user.id
        @profile = @user.profile
        if @profile.present?
          if !@user.profile.contact_completed?
            redirect_to edit_wine100_profile_path(@profile, :for => 'contact')
          elsif !@user.profile.company_completed?
            redirect_to edit_wine100_profile_path(@profile, :for => 'company')
          elsif !@user.profile.finance_completed?
            redirect_to edit_wine100_profile_path(@profile, :for => 'finance')
          else
            redirect_to wine100_accounts_path
          end
        else
          redirect_to new_wine100_profile_path(:for => 'contact')
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
