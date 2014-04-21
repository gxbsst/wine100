module Refinery
  module Wine100Profiles
    module Admin
      class Wine100ProfilesController < ::Refinery::AdminController

        crudify :'refinery/wine100_profiles/wine100_profile',
                :title_attribute => 'company_name_en', :xhr_paging => true

      end
    end
  end
end
