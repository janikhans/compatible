class PartsController < ApplicationController

	before_action :set_part, only: [:show, :edit, :destroy, :fitment]
  	before_action :authenticate_user!, except: [:index, :show]

  def index
  	@parts = Part.all
  end

  def show
  end

  def new
  	@part = current_user.parts.build
  end

  def create
  	@part = current_user.parts.build(part_params)

  	if @part.save
  		redirect_to @part, notice: "New compatible part has been saved, thanks for being a ninja!"
  	else
  		render 'new'
  	end
  end

  def edit
  end

  def update
  	if @part.update(part_params)
  		redirect_to @part, notice: "Succesfully updated this part"
  	else
  		render 'edit'
  	end
  end

  def destroy
  	@part.destroy
  	redirect_to parts_path
  end

  def fitment
    @make = params[:vehicle][:make].upcase
    @model = params[:vehicle][:model].upcase
    @year = params[:vehicle][:year]
    @vehicle = Vehicle.where(:make => @make, :model => @model, :year => @year).first_or_create
    @oemfitment = current_user.oemfitments.build(:part_id =>@part.id, :vehicle_id => @vehicle.id)

    if @oemfitment.save
      redirect_to @part, notice: "New oem model has been saved"
    else
      render 'show'
      # redirect_to @part, alert: "Didn't save for some reason" #Temporary fix 
    end
  end

  private

  def set_part
  	@part = Part.find(params[:id])
  end

  def part_params
  	params.require(:part).permit(:manufacturer, :description, :part_number, :comment, steps_attributes: [:id, :content, :_destroy])
  end


end
