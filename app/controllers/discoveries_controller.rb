class DiscoveriesController < ApplicationController
	before_action :set_discovery, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@discoveries = Discovery.all
	end

	def show
		@steps = @discovery.steps
	end

	def new
		@discovery = current_user.discoveries.build	
	end

	def edit
	end

	def create
		@oem_make = params[:oem_vehicle][:make].upcase
  	@oem_model = params[:oem_vehicle][:model].upcase
  	@oem_year = params[:oem_vehicle][:year]
  	@compatible_make = params[:compatible_vehicle][:make].upcase
  	@compatible_model = params[:compatible_vehicle][:model].upcase
  	@compatible_year = params[:compatible_vehicle][:year]
  	@part_manufacturer = params[:part][:manufacturer].upcase.strip
  	@part_name = params[:part][:name].strip.split.map(&:capitalize).join(' ')
    @oem_vehicle = Vehicle.where(:make => @oem_make, :model => @oem_model, :year => @oem_year).first_or_create
    @compatible_vehicle = Vehicle.where(:make => @compatible_make, :model => @compatible_model, :year => @compatible_year).first_or_create
    @part = Part.where(manufacturer: @part_manufacturer, name: @part_name).first

    unless @part
    	@part = current_user.parts.create(manufacturer: @part_manufacturer, name: @part_name)
    end

		@discovery = current_user.discoveries.build(discovery_params)
		@discovery.oem = @oem_vehicle
		@discovery.compatible = @compatible_vehicle
		@discovery.part = @part

  	if @discovery.save
  		redirect_to @discovery, notice: "New discovery has been saved, thanks for being a ninja!"
  	else
  		render 'new'
  	end
	end

	def update
  	if @discovery.update(edit_discovery_params)
  		redirect_to @discovery, notice: "Succesfully updated this discovery"
  	else
  		render 'edit'
  	end
  end

  def destroy
  	@discovery.destroy
  	redirect_to discoveries_path
  end

	private 

		def set_discovery
	  	@discovery = Discovery.find(params[:id])
	  end

		def discovery_params
			params.require(:discovery).permit(:replaces, :comments, :modifications, steps_attributes: [:id, :content, :_destroy])
		# 	params.require(:discovery).permit(:comment, :modifications, steps_attributes: [:id, :content, :_destroy])
		end
	
		def edit_discovery_params
			params.require(:discovery).permit(:comment, :replaces, :modifications)
		end
end
