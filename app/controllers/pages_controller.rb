class PagesController < ApplicationController

	def home
		@search = true
		@discoveries = Discovery.all.count
	end

	def contact
	end

	def about
	end

	def blog
	end

	def help
	end
end
