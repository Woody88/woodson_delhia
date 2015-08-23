class EventsController < ApplicationController
	
	respond_to :js

	def show
		@event = nil
	end

	def create
	  p = params

	  hk!
	end	

	private

	def events_params
		param.require(:event).permit(:title, :description, :start_time, :end_time)
	end
end
