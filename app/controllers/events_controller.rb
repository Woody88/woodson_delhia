class EventsController < ApplicationController
	
	respond_to :js, :json

  def index
    @events = Event.all
  end

	def show
		@event = nil
	end

	def create
		@event = Event.new(events_params)

		if @event.save!
      flash[:notice] = "Even successfully added!" 
			respond_with @event 
		else
      flash[:alert] = "Could not add event! Try again."
		end
	end	

	private

	def events_params
		params.require(:event).permit(:title, :description, :start_time, :end_time, :date)
	end
end
