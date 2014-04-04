#encoding: utf-8
module Wine100
  class WinesController < ::Wine100::ApplicationController


    before_filter :authenticate_wine100_user

    before_filter :check_profile_completed

    before_filter :get_profile

    def index
      @wines = current_user.wines
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
        flash[:notice] = '创建成功'
        redirect_to wine100_wines_path()
      else
        flash[:error] = '创建失败'
        render :new
      end
    end

    def edit
      @wine = current_user.wines.find(params[:id])
    end

    def update
      @wine = current_user.wines.find(params[:id])
      if @wine.update_attributes(params[:wine100_wine])
        flash[:notice] = '更新成功'
        redirect_to wine100_wines_path()
      else
        flash[:error] = '更新失败'
        render(:edit)
      end
    end

    def destroy 
      @wine = Wine100::Wine.find(params[:id])
      if @wine.destroy
        flash[:notice] = '删除成功'
      else
        flash[:error] = '删除失败'
      end
      redirect_to wine100_wines_path
    end

    def complete
     if current_user.finish_import!
       flash[:notice] = '恭喜！您的酒已经被选做参赛成功'
     else
       flash[:error] = '错误： 请联系系统管理员'
     end
     redirect_to wine100_wines_path
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
