module Refinery
  module Wine100Wines
    class Wine100WinesController < ::ApplicationController

      before_filter :find_all_wine100_wines
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @wine100_wine in the line below:
        present(@page)
      end

      def show
        @wine100_wine = Wine100Wine.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @wine100_wine in the line below:
        present(@page)
      end

    protected

      def find_all_wine100_wines
        @wine100_wines = Wine100Wine.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/wine100_wines").first
      end

    end
  end
end
