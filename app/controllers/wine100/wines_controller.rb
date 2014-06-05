#encoding: utf-8
module Wine100
  class WinesController < ::Wine100::ApplicationController


    before_filter :authenticate_wine100_user

    # before_filter :check_profile_completed

    before_filter :get_profile

    def index
      if params[:status] == 'draft'
        @wines = current_user.wines.draft
      else
        @wines = current_user.wines.online
      end
    end

    def new
      @wine = Wine100::Wine.new
      @wine.varieties.build
      @wine.sale_chanels.build
    end

    def create
      @wine = Wine100::Wine.new(params[:wine100_wine])
      @wine.wine100_user_id = current_user.id
      if @wine.save
        flash[:notice] = t('creating_successful')
        redirect_to wine100_wines_path(:status => 'draft')
      else
        flash[:error] = t('createing_failed')
        render :new
      end
    end

    def edit
      @wine = current_user.wines.find(params[:id])
      # if @wine.status
      #   flash[:error] = '该酒已经是参赛用酒， 不能编辑， 如果需要更新， 请联系系统管理员。'
      #   redirect_to wine100_wines_path(:status => :on)
      # end
    end

    def update
      @wine = current_user.wines.find(params[:id])

      # if @wine.status
      #   flash[:error] = '该酒已经是参赛用酒， 不能编辑， 如果需要更新， 请联系系统管理员。'
      #   redirect_to wine100_wines_path(:status => :on)
      # end

      if @wine.update_attributes(params[:wine100_wine])
        flash[:notice] = t('updated_successfully')
        redirect_to wine100_wines_path(:status => @wine.status)
      else
        flash[:error] = t('updated_failed')
        render(:edit)
      end
    end

    def destroy 
      @wine = Wine100::Wine.find(params[:id])

      # if @wine.status
      #   flash[:error] = '该酒已经是参赛用酒， 不能删除， 如果需要删除， 请联系系统管理员。'
      #   redirect_to wine100_wines_path(:status => :on)
      #   return
      # end


      if @wine.destroy
        flash[:notice] = t('deleted_successful')
      else
        flash[:error] = t('deleted_failed')
      end
      redirect_to wine100_wines_path(:status => 'draft')
    end

    def complete
     if current_user.finish_import!
       flash[:notice] = '恭喜！您的酒已经被选做参赛成功'
     else
       flash[:error] = '错误： 请联系系统管理员'
     end
     redirect_to wine100_wines_path(:status => 'on')
    end

    def one_complete
      wine = Wine100::Wine.find(params[:id])

     if wine.completed!
       flash[:notice] = '恭喜！您的酒已经被选做参赛成功'
     else
       flash[:error] = '错误： 请联系系统管理员'
     end
     redirect_to wine100_wines_path(:status => 'on')
    end

    private


    def check_profile_completed 
      if current_user && current_user.profile.present?
        if  !current_user.profile_completed?
          flash[:error] = '请完成用户信息'
          redirect_to edit_wine100_profile_path(current_user.profile, :for => 'company')  
        else
          true
        end
      else
        flash[:error] = '请完成用户信息'
        redirect_to new_wine100_profile_path(:for => 'company')
      end
    end

    def get_profile
      @profile = current_user.profile  || current_user.build_profile
    end

  end
end
