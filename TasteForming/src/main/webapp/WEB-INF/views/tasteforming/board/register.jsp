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
  <title>register board</title>

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

  <!-- /.navbar -->

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>글등록</h1>
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
                <h3 class="card-title">New Board</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
               
               <form role="form" action="insert" method="get">
               <%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> --%>
                <div class="form-group">
                  <input class="form-control" placeholder="Title:" name="title">
    
                <div class="form-group">
                    <textarea class="form-control" rows="10" style="height: 300px" name="content">
                    </textarea>
                </div>

                </div>
                <div class="form-group">
                  <input class="form-control" placeholder="userId:" name="userId">
                </div>
                <!-- 파일업로드 버튼 임시 -->
               <!--  <div class="form-group">
                  <div class="btn btn-default btn-file">
                    <i class="fas fa-paperclip"></i> Photo Upload
                    <input type="file" name="attachment">
                  </div>
                  <p class="help-block">Max. 32MB</p>
                </div>
                -->

              </div>
              <!-- /.card-body -->
              <div class="card-footer">
                <div class="float-right">
                  <button type="reset" class="btn btn-default"><i class="fas fa-pencil-alt"></i> Reset</button>
                  <button type="submit" class="btn btn-primary"><i class="fas fa-pencil-alt"></i> Submit</button>
                </div>
               <button type="submit" data-oper='list' class="btn btn-default"><i class="fas fa-reply"></i>Return List</button>
                <!-- <button data-oper='list' class="btn btn-default" onclick="location.href='/tasteforming/board/list'"><i class="fas fa-reply"></i> Return List</button> -->
                <!-- <button type="reset" class="btn btn-default"><i class="fas fa-times"></i> Reset</button> -->
              </div>
              
               </form>
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

</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {

		var formObj = $("form");

		$('button').on("click", function(e) {

			e.preventDefault();

			var operation = $(this).data("oper");

			console.log(operation);

			 if (operation === 'list') {
				//move to list
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
<script>
       function boardList(){
           location.href = "boardlist"
       }
</script>
<!-- <script>
  $(function () {
    //Add text editor
    $('#compose-textarea').summernote()
  })
</script> -->
<%@include file="../../includes/footer.jsp"%>
