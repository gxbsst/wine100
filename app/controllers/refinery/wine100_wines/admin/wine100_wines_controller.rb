# encoding: utf-8
module Refinery
  module Wine100Wines
    module Admin
      class Wine100WinesController < ::Refinery::AdminController

        # EXCEL_TITLES = ['company', 'name',  'region', 'style', 'vintage', 'alcoholicity',  'winery', 'level', 'sweetness', 'is_oak', 'prize_history', 'varieties', 'sales']
        EXCEL_TITLES = [
          '序号', 
          "Wine Chinese Name\n葡萄酒名称（中文）", 
          "Wine English Name\n葡萄酒名称（英文）", 
          "Type\n类型",
          "Country\n原产国", 
          "Region\n产区",  
          "Subregion\n分区", 
          "Winery\n酒庄（中文）", 
          "Winery\n酒庄（英文）", 
          "Quality Classification\n级别", 
          "Vintage\n年份", 
          "Alcohol level\n酒精度", 
          "Residual Sugar Level\n甜度（g/L）",
          "Oaked, unaoked\n是否橡木桶陈酿",
          "Retail price\n市场零售价",
          "Award history\n获奖或评分历史",
          "Barcode\n条形码号",
          "Name\n名称",
          "Percentage\n百分比 ",
          "Name\n名称",
          "Percentage\n百分比 ",
          "Name\n名称",
          "Percentage\n百分比 ",
          "Name\n名称",
          "Percentage\n百分比 ",
          "Name\n名称",
          "Percentage\n百分比 ",
          "Name\n名称",
          "Percentage\n百分比 ",
          "Name\n名称",
          "Percentage\n百分比 ",
          "Name\n名称",
          "Percentage\n百分比 "
        ]

        crudify :'refinery/wine100_wines/wine100_wine',
                :title_attribute => 'style', :xhr_paging => true

        def export_all
          @titles = EXCEL_TITLES
          @wines = Refinery::Wine100Wines::Wine100Wine.online.order('created_at DESC')
          render  :xlsx => 'export_all',:filename =>  "all_wines", :disposition =>  'inline'
        end

      end
    end
  end
end
