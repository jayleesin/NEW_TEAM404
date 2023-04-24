$(function() {
  // 달력 설정
  $("#datepicker").datepicker();
});
$(document).ready(function() {
    // Initialize FullCalendar
    $('#calendar').fullCalendar({
      // Add your calendar options and settings here
      // For example:
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay'
      },
      defaultView: 'month',
      events: [
        // Add your events data here
        // For example:
        {
          title: 'Event 1',
          start: '2023-04-15T10:00:00',
          end: '2023-04-15T12:00:00'
        },
        {
          title: 'Event 2',
          start: '2023-04-20T14:00:00',
          end: '2023-04-20T16:00:00'
        }
      ]
    });
  });
  