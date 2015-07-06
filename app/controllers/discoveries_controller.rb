class DiscoveriesController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@discoveries = Discovery.all
	end

	def show
		@discovery = Discovery.find(params[:id])
	end

	def new
		
	end

	def create
		@oem_make = params[:oem_vehicle][:make].upcase
    	@oem_model = params[:oem_vehicle][:model].upcase
    	@oem_year = params[:oem_vehicle][:year]
    	@compatible_make = params[:compatible_vehicle][:make].upcase
    	@compatible_model = params[:compatible_vehicle][:model].upcase
    	@compatible_year = params[:compatible_vehicle][:year]
    	@part_manufacturer = params[:part][:manufacturer]
    	@part_description = params[:part][:description]
    	@part_number = params[:part][:part_number]
    	@replaces = params[:discovery][:replaces]
    	@comment = params[:discovery][:comments]
    	@mods = params[:discovery][:modifications]
	    @oem_vehicle = Vehicle.where(:make => @oem_make, :model => @oem_model, :year => @oem_year).first_or_create
	    @compatible_vehicle = Vehicle.where(:make => @compatible_make, :model => @compatible_model, :year => @compatible_year).first_or_create
	    @part = Part.where(manufacturer: @part_manufacturer, description: @part_description).first

	    unless @part
	    	@part = current_user.parts.create(manufacturer: @part_manufacturer, description: @part_description)
	    end

	    @discovery = current_user.discoveries.build(:part => @part, :oem => @oem_vehicle, :compatible => @compatible_vehicle, :comment => @comment, :replaces => @replaces, :modifications => @mods)

	    if @discovery.save
	      redirect_to @discovery, notice: "New Discovery Added!"
	    else
	 			redirect_to new_discovery_path, alert: "Didn't save for some reason" #Temporary fix 
	    end
	end

	private 

		def set_part

		end
	
end
