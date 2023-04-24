<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>NewBoardList</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet"
    href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="${path }/resources/plugins/fontawesome-free/css/all.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="${path }/resources/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${path }/resources/dist/css/adminlte.min.css">
</head>

<body class="hold-transition sidebar-mini">
  <div class="wrapper">
    <nav class="main-header navbar navbar-expand navbar-white navbar-light" style="margin-left: 0;">
      <ul class="navbar-nav">
        <li class="nav-item">

        </li>
        <li class="nav-item d-none d-sm-inline-block">
          <a href="../../index3.html" class="nav-link">Home</a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
          <a href="#" class="nav-link">TEAM_404</a>
        </li>
      </ul>


    </nav>

    <div class="content-wrapper" style="margin-left:0;">
      <!-- Content Header (Page header) -->
      <section class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1>Inbox</h1>
            </div>
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="#">Home</a></li>
                <li class="breadcrumb-item active">Inbox</li>
              </ol>
            </div>
          </div>
        </div><!-- /.container-fluid -->
      </section>

      <!-- Main content -->
      <section class="content">
        <div class="row">
          <div class="col-md-3">
            <a href="compose.html" class="btn btn-primary btn-block mb-3">Compose</a>

            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Folders</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                </div>
              </div>
              <div class="card-body p-0">
                <ul class="nav nav-pills flex-column">
                  <li class="nav-item active">
                    <a href="#" class="nav-link">
                      <i class="fas fa-inbox"></i> Inbox
                      
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="#" class="nav-link">
                      <i class="far fa-envelope"></i> Sent
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="#" class="nav-link">
                      <i class="far fa-file-alt"></i> Drafts
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="#" class="nav-link">
                      <i class="fas fa-filter"></i> Junk
                      
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="#" class="nav-link">
                      <i class="far fa-trash-alt"></i> Trash
                    </a>
                  </li>
                </ul>
              </div>

            </div>
          </div>
          <!-- /.col -->
          <div class="col-md-9">
            <div class="card card-primary card-outline">
              <div class="card-header">
                <h3 class="card-title">Inbox</h3>

                <div class="card-tools">
                  <div class="input-group input-group-sm">
                    <input type="text" class="form-control" placeholder="Search Mail">
                    <div class="input-group-append">
                      <div class="btn btn-primary">
                        <i class="fas fa-search"></i>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- /.card-tools -->
              </div>
              <!-- /.card-header -->
              <div class="card-body p-0">
                <div class="mailbox-controls">
                  <!-- Check all button -->
                  <button type="button" class="btn btn-default btn-sm checkbox-toggle"><i class="far fa-square"></i>
                  </button>
                  <div class="btn-group">
                    <button type="button" class="btn btn-default btn-sm">
                      <i class="far fa-trash-alt"></i>
                    </button>
                    <button type="button" class="btn btn-default btn-sm">
                      <i class="fas fa-reply"></i>
                    </button>
                    <button type="button" class="btn btn-default btn-sm">
                      <i class="fas fa-share"></i>
                    </button>
                  </div>
                  <!-- /.btn-group -->
                  <button type="button" class="btn btn-default btn-sm">
                    <i class="fas fa-sync-alt"></i>
                  </button>
                  <div class="float-right">
                    1-50/200
                    <div class="btn-group">
                      <button type="button" class="btn btn-default btn-sm">
                        <i class="fas fa-chevron-left"></i>
                      </button>
                      <button type="button" class="btn btn-default btn-sm">
                        <i class="fas fa-chevron-right"></i>
                      </button>
                    </div>
                    <!-- /.btn-group -->
                  </div>
                  <!-- /.float-right -->
                </div>
                <div class="table-responsive mailbox-messages">
                  <table class="table table-hover table-striped">
                    <tbody>

                      <tr>
                        <td>
                          <div class="icheck-primary">
                            <input type="checkbox" value="" id="check15">
                            <label for="check15"></label>
                          </div>
                        </td>
                        <td class="mailbox-star"><a href="#"><i class="fas fa-star text-warning"></i></a></td>
                        <td class="mailbox-name"><a href="read-mail.html">Alexander Pierce</a></td>
                        <td class="mailbox-subject"><b>AdminLTE 3.0 Issue</b> - Trying to find a solution to this
                          problem...
                        </td>
                        <td class="mailbox-attachment"><i class="fas fa-paperclip"></i></td>
                        <td class="mailbox-date">15 days ago</td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
  </div>


  <script src="${path }/resources/plugins/jquery/jquery.min.js"></script>
  <script src="${path }/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${path }/resources/dist/js/adminlte.min.js"></script>
  <script>
    $(function () {
      //Enable check and uncheck all functionality
      $('.checkbox-toggle').click(function () {
        var clicks = $(this).data('clicks')
        if (clicks) {
          //Uncheck all checkboxes
          $('.mailbox-messages input[type=\'checkbox\']').prop('checked', false)
          $('.checkbox-toggle .far.fa-check-square').removeClass('fa-check-square').addClass('fa-square')
        } else {
          //Check all checkboxes
          $('.mailbox-messages input[type=\'checkbox\']').prop('checked', true)
          $('.checkbox-toggle .far.fa-square').removeClass('fa-square').addClass('fa-check-square')
        }
        $(this).data('clicks', !clicks)
      })

      //Handle starring for font awesome
      $('.mailbox-star').click(function (e) {
        e.preventDefault()
        //detect type
        var $this = $(this).find('a > i')
        var fa = $this.hasClass('fa')

        //Switch states
        if (fa) {
          $this.toggleClass('fa-star')
          $this.toggleClass('fa-star-o')
        }
      })
    })
  </script>
</body>

</html>
<%@include file="../../includes/footer.jsp"%>
