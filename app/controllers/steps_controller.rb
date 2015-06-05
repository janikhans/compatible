class StepsController < ApplicationController
	before_action :set_part

	def create
		@step = @part.steps.create(step_params)
		redirect_to @part
	end

	private

	def set_part
		@part = Part.find(params[:part_id])
	end

	def step_params
		params[:step].permit(:content)
	end
end
