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
  <title>Tasteforming</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet"
    href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="${path }/resources/plugins/fontawesome-free/css/all.min.css">
  <!-- fullCalendar -->
  <link rel="stylesheet" href="${path }/resources/plugins/fullcalendar/main.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${path }/resources/dist/css/adminlte.min.css">

</head>

<body class="hold-transition sidebar-mini">
  <div class="wrapper">
    <!-- Navbar -->
    
    <!-- /.navbar -->

<!-- Menu -->
    <aside class="main-sidebar sidebar-dark-primary elevation-4">
      <!-- Brand Logo -->
      <a href="../../tasteforming/main" class="brand-link">
        <img src="${path }\resources\img\TasteFormingLogo.png" alt="TasteFormingLogo" class="brand-image img-circle elevation-3"
          style="margin-left:-0.8rem; background-color: #fff">
        <span class="brand-text font-weight-light">Tasteforming</span>
      </a>

      <!-- Sidebar -->
      <div class="sidebar">
        <!-- Sidebar user panel (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
          <div class="image">
            <img src="../dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
          </div>
          <div class="info">
            <a href="/tasteforming/admin/adminPage" class="d-block">adminPage</a>
          </div>
        </div>

        <!-- SidebarSearch Form -->
        <div class="form-inline">
          <div class="input-group" data-widget="sidebar-search">
            <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
            <div class="input-group-append">
              <button class="btn btn-sidebar">
                <i class="fas fa-search fa-fw"></i>
              </button>
            </div>
          </div>
        </div>

        <!-- Sidebar Menu -->
       <nav class="mt-2">
          <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
            <!-- Add icons to the links using the .nav-icon class
                       with font-awesome or any other icon font library -->
            <li class="nav-item menu-is-opening menu-open">

              <ul class="nav nav-treeview" style="display: block;">
                <li class="nav-item">
                  <a href="UserManagement" class="nav-link">
                    <i class="far fa-circle nav-icon"></i>
                    <p>유저관리</p>
                  </a>
                </li>
                <li class="nav-item">
                  <a href="ResManagement" class="nav-link">
                    <i class="far fa-circle nav-icon"></i>
                    <p>식당관리</p>
                  </a>
                </li>
                <li class="nav-item">
                  <a href="BoardManagement" class="nav-link">
                    <i class="far fa-circle nav-icon"></i>
                    <p>게시글관리</p>
                  </a>
                </li>
                <li class="nav-item">
                  <a href="ReplyManagement" class="nav-link">
                    <i class="far fa-circle nav-icon"></i>
                    <p>댓글관리</p>
                  </a>
                </li>
                <li class="nav-item">
                  <a href="ReserveManagement" class="nav-link">
                    <i class="far fa-circle nav-icon"></i>
                    <p>예약관리</p>
                  </a>
                </li>
              </ul>
            </li>

          </ul>



        </nav>
      </div>
    </aside>
<!-- Menu end -->


    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <section class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1>Calendar</h1>
            </div>
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="#">Home</a></li>
                <li class="breadcrumb-item active">Calendar</li>
              </ol>
            </div>
          </div>
        </div><!-- /.container-fluid -->
      </section>

      <!-- Main content -->
      <section class="content">
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-3">
              <div class="sticky-top mb-3">
                <div class="card">


                  <!-- the events -->
                  <div id="external-events">



                    </label>
                  </div>
                </div>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->

          </div>
        </div>
        <!-- /.col -->
        <div class="col-md-9" style="min-width: 100%;">
          <div class="card card-primary">
            <div class="card-body p-0">
              <!-- THE CALENDAR -->
              <div id="calendar"></div>
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
        </div>
        <!-- /.col -->
    </div>
    <!-- /.row -->
  </div><!-- /.container-fluid -->
  </section>
  <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <footer class="main-footer">
    <div class="float-right d-none d-sm-block">
      <b>Version</b> 3.2.0
    </div>
    <strong>Copyright &copy; 2014-2021 <a href="https://adminlte.io">AdminLTE.io</a>.</strong> All rights reserved.
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
  </div>
  <!-- ./wrapper -->

  <!-- jQuery -->
  <script src="${path }/resources/plugins/jquery/jquery.min.js"></script>
  <!-- Bootstrap -->
  <script src="${path }/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- jQuery UI -->
  <script src="${path }/resources/plugins/jquery-ui/jquery-ui.min.js"></script>
  <!-- AdminLTE App -->
  <script src="${path }/resources/dist/js/adminlte.min.js"></script>
  <!-- fullCalendar 2.2.5 -->
  <script src="${path }/resources/plugins/moment/moment.min.js"></script>
  <script src="${path }/resources/plugins/fullcalendar/main.js"></script>
  <!-- AdminLTE for demo purposes -->

  <!-- Page specific script -->
  <script>
    $(function () {

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

      var containerEl = document.getElementById('external-events');
      var checkbox = document.getElementById('drop-remove');
      var calendarEl = document.getElementById('calendar');

      // initialize the external events
      // -----------------------------------------------------------------

      new Draggable(containerEl, {
        itemSelector: '.external-event',
        eventData: function (eventEl) {
          return {
            title: eventEl.innerText,
            backgroundColor: window.getComputedStyle(eventEl, null).getPropertyValue('background-color'),
            borderColor: window.getComputedStyle(eventEl, null).getPropertyValue('background-color'),
            textColor: window.getComputedStyle(eventEl, null).getPropertyValue('color'),
          };
        }
      });

      var calendar = new Calendar(calendarEl, {
        headerToolbar: {
          left: 'prev,next today',
          center: 'title',
          right: 'dayGridMonth,timeGridWeek,timeGridDay'
        },
        themeSystem: 'bootstrap',
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
          if (checkbox.checked) {
            // if so, remove the element from the "Draggable Events" list
            info.draggedEl.parentNode.removeChild(info.draggedEl);
          }
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