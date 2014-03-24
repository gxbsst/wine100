module Refinery
  module Wine100Wines
    module Admin
      class Wine100WinesController < ::Refinery::AdminController

        crudify :'refinery/wine100_wines/wine100_wine',
                :title_attribute => 'style', :xhr_paging => true

      end
    end
  end
end
