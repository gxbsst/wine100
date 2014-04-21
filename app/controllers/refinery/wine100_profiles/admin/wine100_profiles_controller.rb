module Refinery
  module Wine100Profiles
    module Admin
      class Wine100ProfilesController < ::Refinery::AdminController



      	# EXCEL_TITLES = ['company', 'name',  'region', 'style', 'vintage', 'alcoholicity',  'winery', 'level', 'sweetness', 'is_oak', 'prize_history', 'varieties', 'sales']
      	EXCEL_TITLES = [
      	  '序号', 
      	  "用户账号", 
      	  "公司名", 
      	  "公司地址",
      	  "公司电话", 
      	  "公司网站",  
      	  "可出售酒数", 
      	  "联系人姓名", 
      	  "联系人电话", 
      	  "联系人邮箱", 
      	  "联系人职位", 
      	  "发票抬头", 
      	  "税务登记号",
      	  "发票邮寄地址",
      	  "财务联系人",
      	  "财务联系电话"
      	]

        crudify :'refinery/wine100_profiles/wine100_profile',
                :title_attribute => 'company_name_en', :xhr_paging => true

        def export_all
          @titles = EXCEL_TITLES
          @users = Refinery::Wine100Profiles::Wine100Profile.order('created_at DESC')
          render  :xlsx => 'export_all',:filename =>  "all_users", :disposition =>  'inline'
        end

      end
    end
  end
end
