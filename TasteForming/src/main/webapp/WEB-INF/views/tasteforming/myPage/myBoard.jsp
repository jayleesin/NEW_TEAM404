<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
      <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
        <c:set var="path" value="${pageContext.request.contextPath}" />
        <%@ page session="false" %>
          <!DOCTYPE html>
          <html lang="en">

          <head>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <title>TasteForming | 마이페이지</title>

            <link rel="stylesheet"
              href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
            <link rel="stylesheet" href="${path }/resources/plugins/fontawesome-free/css/all.min.css">
            <link rel="stylesheet" href="${path }/resources/plugins/fullcalendar/main.css">
            <link rel="stylesheet" href="${path }/resources/dist/css/adminlte.min.css">
          </head>

          <body class="hold-transition sidebar-mini">
            <%@ include file="./myPageIncludes/menu.jsp" %>

              <div class="content-wrapper">

                <section class="content">
                  <div class="container-fluid">
                    <div class="row">
                      <div class="col-12">
                        <div class="card card-primary">
                          <div class="card-body p-0">
                            <div id="calendar"></div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </section>
              </div>

              <footer class="main-footer">
                <strong>Copyright &copy; 2023 <a href="https://www.naver.com">TasteForming</a>.</strong>
                All rights reserved.
              </footer>
              </div>
              <script src="${path }/resources/plugins/jquery/jquery.min.js"></script>
              <script src="${path }/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
              <script src="${path }/resources/plugins/jquery-ui/jquery-ui.min.js"></script>
              <script src="${path }/resources/dist/js/adminlte.min.js"></script>
              <script src="${path }/resources/plugins/moment/moment.min.js"></script>
              <script src="${path }/resources/plugins/fullcalendar/main.js"></script>
              <script src="${path }/resources/dist/js/demo.js"></script>
              <script>
                $(async () => {

                  /* initialize the external events
                   -----------------------------------------------------------------*/
                  function ini_events(ele) {
                    ele.each(function () {

                      // create an Event Object (https://fullcalendar.io/docs/event-object)
                      // it doesn't need to have a start or end
                      var eventObject = {
                        title: $.trim($(this).text()) // use the element's text as the event title
                      }

                      // store the Event Object in the DOM element so we can get to it later
                      $(this).data('eventObject', eventObject)

                      // make the event draggable using jQuery UI
                      $(this).draggable({
                        zIndex: 1070,
                        revert: true, // will cause the event to go back to its
                        revertDuration: 0  //  original position after the drag
                      })

                    })
                  }

                  ini_events($('#external-events div.external-event'))

                  /* initialize the calendar
                   -----------------------------------------------------------------*/
                  //Date for the calendar events (dummy data)
                  var date = new Date()
                  var d = date.getDate(),
                    m = date.getMonth(),
                    y = date.getFullYear()

                  var Calendar = FullCalendar.Calendar;
                  var Draggable = FullCalendar.Draggable;

                  // var containerEl = document.getElementById('external-events');
                  // var checkbox = document.getElementById('drop-remove');
                  var calendarEl = document.getElementById('calendar');

                  // initialize the external events
                  // -----------------------------------------------------------------

                  // new Draggable(containerEl, {
                  //   itemSelector: '.external-event',
                  //   eventData: function(eventEl) {
                  //     return {
                  //       title: eventEl.innerText,
                  //       backgroundColor: window.getComputedStyle( eventEl ,null).getPropertyValue('background-color'),
                  //       borderColor: window.getComputedStyle( eventEl ,null).getPropertyValue('background-color'),
                  //       textColor: window.getComputedStyle( eventEl ,null).getPropertyValue('color'),
                  //     };
                  //   }
                  // });

                  console.log('hello')

                  const response = await fetch('http://localhost:8080/')
                  // const jsonData = await response.text()

                  // {
                  //   restrant: {
                  //     name: 'Hajon'
                  //   },
                  //   reservation{
                  //     count: 3,
                  //     datetime: '2023-04-12 09:12:00',
                  //   }
                  // }
                  const text = await response.text()

                  console.log(text)

                  const data = text.split(';')
                  const dateStr = data[2].split('-')
                  // const dateInt = dateStr.map(d => parseInt(d))
                  const dateInt = []
                  for (let i = 0; i < 3; i++) {
                    let intValue = parseInt(dateStr[i])
                    dateInt.push(intValue)
                  }

                  var eventData = [
                    {
                      title: data[0] + `(${data[1]}ëª)`,
                      start: new Date(dateInt[0], dateInt[1] - 1, dateInt[2]),
                      backgroundColor: '#f56954', //red
                      borderColor: '#f56954', //red
                      allDay: true
                    },
                  ]

                  var calendar = new Calendar(calendarEl, {
                    headerToolbar: {
                      left: 'prev,next today',
                      center: 'title',
                      right: 'dayGridMonth,timeGridWeek,timeGridDay'
                    },
                    themeSystem: 'bootstrap',
                    events: eventData,
                    //Random default events
                    events: [
                      {
                        title: 'All Day Event',
                        start: new Date(y, m, 1),
                        backgroundColor: '#f56954', //red
                        borderColor: '#f56954', //red
                        allDay: true
                      },
                      {
                        title: 'Long Event',
                        start: new Date(y, m, d - 5),
                        end: new Date(y, m, d - 2),
                        backgroundColor: '#f39c12', //yellow
                        borderColor: '#f39c12' //yellow
                      },
                      {
                        title: 'Meeting',
                        start: new Date(y, m, d, 10, 30),
                        allDay: false,
                        backgroundColor: '#0073b7', //Blue
                        borderColor: '#0073b7' //Blue
                      },
                      {
                        title: 'Lunch',
                        start: new Date(y, m, d, 12, 0),
                        end: new Date(y, m, d, 14, 0),
                        allDay: false,
                        backgroundColor: '#00c0ef', //Info (aqua)
                        borderColor: '#00c0ef' //Info (aqua)
                      },
                      {
                        title: 'Birthday Party',
                        start: new Date(y, m, d + 1, 19, 0),
                        end: new Date(y, m, d + 1, 22, 30),
                        allDay: false,
                        backgroundColor: '#00a65a', //Success (green)
                        borderColor: '#00a65a' //Success (green)
                      },
                      {
                        title: 'Click for Google',
                        start: new Date(y, m, 28),
                        end: new Date(y, m, 29),
                        url: 'https://www.google.com/',
                        backgroundColor: '#3c8dbc', //Primary (light-blue)
                        borderColor: '#3c8dbc' //Primary (light-blue)
                      }
                    ],
                    editable: true,
                    droppable: true, // this allows things to be dropped onto the calendar !!!
                    drop: function (info) {
                      // is the "remove after drop" checkbox checked?
                      // if (checkbox.checked) {
                      //   // if so, remove the element from the "Draggable Events" list
                      //   info.draggedEl.parentNode.removeChild(info.draggedEl);
                      // }
                    }
                  });

                  calendar.render();
                  // $('#calendar').fullCalendar()

                  /* ADDING EVENTS */
                  var currColor = '#3c8dbc' //Red by default
                  // Color chooser button
                  $('#color-chooser > li > a').click(function (e) {
                    e.preventDefault()
                    // Save color
                    currColor = $(this).css('color')
                    // Add color effect to button
                    $('#add-new-event').css({
                      'background-color': currColor,
                      'border-color': currColor
                    })
                  })
                  $('#add-new-event').click(function (e) {
                    e.preventDefault()
                    // Get value and make sure it is not null
                    var val = $('#new-event').val()
                    if (val.length == 0) {
                      return
                    }

                    // Create events
                    var event = $('<div />')
                    event.css({
                      'background-color': currColor,
                      'border-color': currColor,
                      'color': '#fff'
                    }).addClass('external-event')
                    event.text(val)
                    $('#external-events').prepend(event)

                    // Add draggable funtionality
                    ini_events(event)

                    // Remove event from text input
                    $('#new-event').val('')
                  })
                })
              </script>
          </body>

          </html>