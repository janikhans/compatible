class SearchController < ApplicationController

	def index
		@make = params[:make].upcase.strip
    	@model = params[:model].upcase.strip
    	@year = params[:year]
    	@part = params[:part].strip
    	@vehicle = Vehicle.where(make: @make, model: @model, year: @year).first
    	@oem_parts = @vehicle.parts.where(name:@part)

    	@discoveries = Discovery.where(oem: @vehicle)
        # @discoveries = @vehicle.discoveries.where(replaces: include(@part))

    	# @vehicle = Vehicle.where(make: @make, model: @model, year: @year).first_or_create
    	# @oemfitment = current_user.oemfitments.build(part: @part, vehicle: @vehicle)
	end
end
