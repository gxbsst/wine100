module Refinery
  module Wine100Profiles
    class Wine100ProfilesController < ::ApplicationController

      before_filter :find_all_wine100_profiles
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @wine100_profile in the line below:
        present(@page)
      end

      def show
        @wine100_profile = Wine100Profile.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @wine100_profile in the line below:
        present(@page)
      end

    protected

      def find_all_wine100_profiles
        @wine100_profiles = Wine100Profile.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/wine100_profiles").first
      end

    end
  end
end
