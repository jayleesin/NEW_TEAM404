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
            <h1>글수정</h1>
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
              <h3 class="card-title">Board Modify Page</h3>

              <!-- <div class="card-tools">
                <a href="#" class="btn btn-tool" title="Previous"><i class="fas fa-chevron-left"></i></a>
                <a href="#" class="btn btn-tool" title="Next"><i class="fas fa-chevron-right"></i></a>
              </div> -->
            </div>
            <!-- /.card-header -->
            <form role="form" action="modify" method="post">
            <div class="card-body p-0">
               		<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'> 
					<input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'> 
				 	<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'> 
 					<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>

					<div class="form-group">
						<label>board_no</label> <input class="form-control" name='board_no' value='<c:out value="${board.board_no }"/>' readonly="readonly">
					</div>

					<div class="form-group">
						<label>Title</label> <input class="form-control" name='title' value='<c:out value="${board.title }"/>'>
					</div>

					<div class="form-group">
						<label>Text area</label>
						<textarea class="form-control" rows="10" name='content'><c:out value="${board.content}" /></textarea>
					</div>

					<div class="form-group">
						<label>userId</label> <input class="form-control" name='userId' value='<c:out value="${board.userId}"/>' readonly="readonly">
					</div>

					<div class="form-group">
						<label>RegDate</label> <input class="form-control" name='regDate' value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${board.regDate}" />' readonly="readonly">
					</div>

					<div class="form-group">
						<label>Update Date</label> <input class="form-control" name='updateDate' value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${board.updateDate}" />' readonly="readonly">
					</div>
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

              </ul>
            </div>
            <!-- /.card-footer -->
            <div class="card-footer">
		 			<button type="submit" data-oper='list' class="btn btn-default"><i class="fas fa-reply"></i>Return List</button>
		              <div class="float-right">
		              <button type="submit" data-oper='modify' class="btn btn-default"><i class="fas fa-print"></i> Modify</button>
		              <button type="submit" data-oper='remove' class="btn btn-default"><i class="far fa-trash-alt"></i> Remove</button>
		              </div>
		         </div>
            <!-- /.card-footer -->
            </form>
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

		var formObj = $("form");

		$('button').on("click", function(e) {

			e.preventDefault();

			var operation = $(this).data("oper");

			console.log(operation);

			if (operation === 'remove') {
				formObj.attr("action", "remove");
				
			} else if (operation === 'list') {
				formObj.attr("action", "list").attr("method", "get");
				
				var pageNumTag = $("input[name='pageNum']").clone();
			    var amountTag = $("input[name='amount']").clone();
			    var keywordTag = $("input[name='keyword']").clone();
			    var typeTag = $("input[name='type']").clone();      
			      
			    formObj.empty();
			      
			    formObj.append(pageNumTag);
			    formObj.append(amountTag);
			    formObj.append(keywordTag);
			    formObj.append(typeTag);
			}
			formObj.submit();
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
