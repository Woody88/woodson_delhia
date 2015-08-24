class CalendarController < ApplicationController
  def calendar
  	@event = Event.new
  	@events = Event.where(date: Date.today)
  end
end
