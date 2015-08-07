class VehiclesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_vehicle, only: [:edit, :update, :destroy]

	def index
		@vehicles = Vehicle.all
  end

	def new
		@vehicle = Vehicle.new
	end 

	def show
	end

	def create
		@vehicle = Vehicle.new(vehicle_params)

		if @vehicle.save
			redirect_to vehicles_path, notice: "Succesfully created Vehicle"
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @vehicle.update(vehicle_params)
			redirect_to vehicles_path, notice: "Vehicle was Succesfully updated"
		else
			render 'edit'
		end
	end

	def destroy
		@vehicle.destroy
		redirect_to vehicles_path
	end

	private

	def set_vehicle
		@vehicle = Vehicle.find(params[:id])
	end

	def vehicle_params
		params.require(:vehicle).permit(:year, :make, :model)
	end
end
