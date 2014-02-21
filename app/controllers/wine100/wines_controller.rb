#encoding: utf-8
module Wine100
	class WinesController < ::Wine100::ApplicationController

		
		before_filter :authenticate_user

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
				flash[:notice] = '保存成功'
				redirect_to edit_wine100_wine_path(@wine, :step => 2)
			else
				render :new
			end
		end

		def edit
			@wine = Wine100::Wine.find(params[:id])
		end

		def update
			@wine = Wine100::Wine.find(params[:id])
			if @wine.update_attributes(params[:wine100_wine])
				flash[:notice] = '保存成功'
				if params[:step] == '1'
					redirect_to edit_wine100_wine_path(@wine, :step => 2)
				else
					redirect_to wine100_wines_path()
				end
			else
				render(:edit)
			end
		end

		private


		def check_profile_completed
			if current_user && !current_user.is_completed
				redirect_to new_wine100_profile_path
			end
		end

		def get_profile
			@profile = current_user.profile 
		end

	end
end
