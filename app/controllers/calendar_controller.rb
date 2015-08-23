class CalendarController < ApplicationController
  def calendar
  	@event = Event.new
  end
end
