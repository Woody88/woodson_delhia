(function() {
  $(document).ready(function() {
    var updateEvent;
    $('#calendar').fullCalendar({
      editable: true,
      header: {
        left: 'prev',
        center: 'title,month,agendaWeek,agendaDay,',
        right: 'next'
      },
      defaultView: 'agendaWeek',
      height: 500,
      aspectRatio: 2,
      droppable: true,
      slotMinutes: 30,
      eventSources: [
        {
          url: '/events'
        }
      ],
      timeFormat: 'h:mm t{ - h:mm t} ',
      dragOpacity: "0.5",
      eventDrop: function(event, dayDelta, minuteDelta, allDay, revertFunc) {
        return updateEvent(event);
      },
      eventResize: function(event, dayDelta, minuteDelta, revertFunc) {
        return updateEvent(event);
      }
    });
    $('.event').draggable({
      zIndex: 999,
      revert: true,
      revertDuration: 0
    });
    updateEvent = function(the_event) {
      return $.update("/events/" + the_event.id, {
        event: {
          title: the_event.title,
          starts_at: "" + the_event.start,
          ends_at: "" + the_event.end,
          description: the_event.description
        }
      });
    };
    return $('#add_event').on('click', function(e) {
      return e.preventDefault();
    });
  });

}).call(this);
