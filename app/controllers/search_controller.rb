class SearchController < ApplicationController

	def index
		@make = params[:make].upcase
    	@model = params[:model].upcase
    	@year = params[:year]
    	@part = params[:part]
    	@vehicle = Vehicle.where(make: @make, model: @model, year: @year).first
    	@oem_part = Part.where()

    	@discoveries = Discovery.where(oem: @vehicle)

    	# @vehicle = Vehicle.where(make: @make, model: @model, year: @year).first_or_create
    	# @oemfitment = current_user.oemfitments.build(part: @part, vehicle: @vehicle)
	end
end
