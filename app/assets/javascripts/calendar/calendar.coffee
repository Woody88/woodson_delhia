# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('#calendar').fullCalendar
    editable: true,
    header:
      left: 'prev',
      center: 'title,month,agendaWeek,agendaDay,',
      right: 'next'
    defaultView: 'agendaWeek',
    height: 500,
    aspectRatio: 2,
    droppable: true,
    slotMinutes: 30,

    eventSources: [{
      url: '/events',
    }],

    timeFormat: 'h:mm t{ - h:mm t} ',
    dragOpacity: "0.5"

    eventDrop: (event, dayDelta, minuteDelta, allDay, revertFunc) ->
      updateEvent(event);

    eventResize: (event, dayDelta, minuteDelta, revertFunc) ->
      updateEvent(event);

  $('.event').draggable
    zIndex: 999
    revert: true
    revertDuration: 0

  updateEvent = (the_event) ->
    $.update "/events/" + the_event.id,
      event:
        title: the_event.title,
        starts_at: "" + the_event.start,
        ends_at: "" + the_event.end,
        description: the_event.description

  $('#add_event').on 'click', (e) ->
    e.preventDefault()
    