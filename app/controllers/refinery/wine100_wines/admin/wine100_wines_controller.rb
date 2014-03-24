# encoding: utf-8
module Refinery
  module Wine100Wines
    module Admin
      class Wine100WinesController < ::Refinery::AdminController

        EXCEL_TITLES = ['name',  'region', 'style', 'vintage', 'alcoholicity',  'winery', 'level', 'sweetness', 'is_oak', 'prize_history', 'varieties', 'sales']

        crudify :'refinery/wine100_wines/wine100_wine',
                :title_attribute => 'style', :xhr_paging => true

        def export_all
          @titles = EXCEL_TITLES
          @wines = Refinery::Wine100Wines::Wine100Wine.order('created_at DESC')
          render  :xlsx => 'export_all',:filename =>  "all_wines_notes", :disposition =>  'inline'
        end

      end
    end
  end
end
