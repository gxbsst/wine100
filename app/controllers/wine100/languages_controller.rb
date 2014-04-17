# encoding: utf-8

module Wine100
	class LanguagesController < ::Wine100::ApplicationController
		def index
			local = params[:locale]
			cookies[:locale] = {
       :value => local,
       :expires => 1.year.from_now  
     }
     redirect_to request.referer
		end
	end
end