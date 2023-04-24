<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%-- <%@include file="../includes/header.jsp"%> --%>
<c:set var="path" value=""/>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>detail board</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="${path }/resources/plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${path }/resources/dist/css/adminlte.min.css">
  <!-- summernote -->
  <link rel="stylesheet" href="${path }/resources/plugins/summernote/summernote-bs4.min.css">
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>글상세</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Compose</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">

          <!-- /.col -->
<div class="col-md-9">
          <div class="card card-primary card-outline">
            <div class="card-header">
              <h3 class="card-title">Board Read Page</h3>

              <div class="card-tools">
                <a href="#" class="btn btn-tool" title="Previous"><i class="fas fa-chevron-left"></i></a>
                <a href="#" class="btn btn-tool" title="Next"><i class="fas fa-chevron-right"></i></a>
              </div>
            </div>
            <!-- /.card-header -->
            <div class="card-body p-0">
              <div class="mailbox-read-info">
              
					<%-- <label>board_no</label> <input class="form-group" name='board_no'
						value='<c:out value="${board.board_no }"/>' readonly="readonly"> --%>
			  <label>board_no</label><td><c:out value="${board.board_no}" /></td>
			  
			  
			  <%-- <h5><td><c:out value="${board.title}" /></td></h5> --%>
             
             <div class="form-group">
					<label>Title</label> <input class="form-control" name='title'
						value='<c:out value="${board.title }"/>' readonly="readonly">
				</div>
                <!-- <h5>Message Subject Is Placed Here</h5>
                <h6>From: support@adminlte.io
                  <span class="mailbox-read-time float-right">15 Feb. 2015 11:03 PM</span></h6> -->
              </div>
              <!-- /.mailbox-read-info -->
              <!-- <div class="mailbox-controls with-border text-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-default btn-sm" data-container="body" title="Delete">
                    <i class="far fa-trash-alt"></i>
                  </button>
                  <button type="button" class="btn btn-default btn-sm" data-container="body" title="Reply">
                    <i class="fas fa-reply"></i>
                  </button>
                  <button type="button" class="btn btn-default btn-sm" data-container="body" title="Forward">
                    <i class="fas fa-share"></i>
                  </button>
                </div>
                /.btn-group
                <button type="button" class="btn btn-default btn-sm" title="Print">
                  <i class="fas fa-print"></i>
                </button>
              </div> -->
              <!-- /.mailbox-controls -->
              
				
              <div class="mailbox-read-message">
                <textarea class="form-control" rows="3" name='content'
						readonly="readonly"><c:out value="${board.content}" />
            </textarea>
              </div>
              

			<%-- <form id='operForm' action="modify" method="get">
					<input type='hidden' id='bno' name='bno'value='<c:out value="${board.bno}"/>'>
					<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
					<input type='hidden' name='keyword'	value='<c:out value="${cri.keyword}"/>'> 
					<input	type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
				</form> --%>
            </div>
            <!-- /.card-body -->
            <div class="card-footer bg-white">
              <ul class="mailbox-attachments d-flex align-items-stretch clearfix">
                <li>
                  <span class="mailbox-attachment-icon"><i class="far fa-file-pdf"></i></span>

                  <div class="mailbox-attachment-info">
                    <a href="#" class="mailbox-attachment-name"><i class="fas fa-paperclip"></i> Sep2014-report.pdf</a>
                        <span class="mailbox-attachment-size clearfix mt-1">
                          <span>1,245 KB</span>
                          <a href="#" class="btn btn-default btn-sm float-right"><i class="fas fa-cloud-download-alt"></i></a>
                        </span>
                  </div>
                </li>
                <li>
                  <span class="mailbox-attachment-icon"><i class="far fa-file-word"></i></span>

                  <div class="mailbox-attachment-info">
                    <a href="#" class="mailbox-attachment-name"><i class="fas fa-paperclip"></i> App Description.docx</a>
                        <span class="mailbox-attachment-size clearfix mt-1">
                          <span>1,245 KB</span>
                          <a href="#" class="btn btn-default btn-sm float-right"><i class="fas fa-cloud-download-alt"></i></a>
                        </span>
                  </div>
                </li>
                <!-- <li>
                  <span class="mailbox-attachment-icon has-img"><img src="../../dist/img/photo1.png" alt="Attachment"></span>

                  <div class="mailbox-attachment-info">
                    <a href="#" class="mailbox-attachment-name"><i class="fas fa-camera"></i> photo1.png</a>
                        <span class="mailbox-attachment-size clearfix mt-1">
                          <span>2.67 MB</span>
                          <a href="#" class="btn btn-default btn-sm float-right"><i class="fas fa-cloud-download-alt"></i></a>
                        </span>
                  </div>
                </li> -->

              </ul>
            </div>
            <!-- /.card-footer -->
           
            <div class="card-footer">
              <div class="float-right">
              <%-- <button data-oper='modify' class="btn btn-default" onclick="location.href='/tasteforming/board/modify?board_no=<c:out value="${board.board_no}"/>'"> <i class="fas fa-print"></i> Modify</button> --%>
             <button data-oper='modify' class="btn btn-default" > <i class="fas fa-print"></i> Modify</button>
              <!-- <button date-oper='remove' class="btn btn-default"><i class="far fa-trash-alt"></i> Delete</button> -->
              </div>
              <button data-oper='list' class="btn btn-default"><i class="fas fa-reply"></i> Return List</button>
                <!-- <button data-oper='list' class="btn btn-default" onclick="location.href='/tasteforming/board/list'"><i class="fas fa-reply"></i> Return List</button> -->
                 <form id='operForm' action="modify" method="get">
					<input type='hidden' id='board_no' name='board_no'value='<c:out value="${board.board_no}"/>'>
					<input type='hidden' name='pageNum'value='<c:out value="${cri.pageNum}"/>'>
					<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
					<input type='hidden' name='keyword'	value='<c:out value="${cri.keyword}"/>'> 
					<input	type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
				</form>
            </div>
            
            <!-- /.card-footer -->
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

  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="${path }/resources/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="${path }/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="${path }/resources/dist/js/adminlte.min.js"></script>
<!-- Summernote -->
<script src="${path }/resources/plugins/summernote/summernote-bs4.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="${path }/resources/dist/js/demo.js"></script>
<!-- Page specific script -->
 
<script type="text/javascript">
$(document).ready(function() {
  
  var operForm = $("#operForm"); 
  
   $("button[data-oper='modify']").on("click", function(e){
    operForm.attr("action","modify").submit();
  });
    
  $("button[data-oper='list']").on("click", function(e){
    operForm.find("#board_no").remove();
    operForm.attr("action","list")
    operForm.submit();
    
  });  
});
</script>
<!-- <script>
  $(function () {
    //Add text editor
    $('#compose-textarea').summernote()
  })
</script> -->
</body>
</html>

<%@include file="../../includes/footer.jsp"%>
