class StepsController < ApplicationController
	before_action :set_discovery

	def create
		@step = @discovery.steps.create(step_params)
		redirect_to @discovery
	end

	private

	def set_discovery
		@discovery = Discovery.find(params[:discovery_id])
	end

	def step_params
		params[:step].permit(:content)
	end
end
