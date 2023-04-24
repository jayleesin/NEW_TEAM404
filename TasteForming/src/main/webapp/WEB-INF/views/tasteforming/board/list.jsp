<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%-- <%@include file="../../includes/header.jsp"%> --%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>boardlist</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="${path }/resources/plugins/fontawesome-free/css/all.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="${path }/resources/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${path }/resources/dist/css/adminlte.min.css">
<style type="text/css">
  .pageInfo{
      list-style : none;
      display: inline-block;
    margin: 50px 0 0 100px;      
  }
  .pageInfo li{
      float: left;
    font-size: 20px;
    margin-left: 18px;
    padding: 7px;
    font-weight: 500;
  }
 a:link {color:black; text-decoration: none;}
 a:visited {color:black; text-decoration: none;}
 a:hover {color:black; text-decoration: underline;}
.active{
      background-color: #cdd5ec;
  }
</style>
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
 

  <!-- Main Sidebar Container -->

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Board List Page</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Inbox</li>
            </ol>
          </div>
        </div>
      </div><!-- /.contaainer-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
        <!-- /.col -->
        <div class="col-md-9">
          <div class="card card-primary card-outline">
            <div class="card-header">
              <h3 class="card-title">게시판</h3>

<!--               <div class="card-tools">
                <div class="input-group input-group-sm">
                  <input type="text" class="form-control" placeholder="Search Board">
                  <div class="input-group-append">
                    <div class="btn btn-primary">
                      <i class="fas fa-search"></i>
                    </div>
                  </div>
                </div>
              </div> -->
              
              <div class="card-tools">
					<div class="input-group input-group-sm">
						<form id='searchForm' action="list" method='get'>
							<select name='type'>
								<option value="TWC"
									<c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>전체 검색</option>
								<option value=""
									<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
								<option value="T"
									<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
								<option value="C"
									<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
								<option value="W"
									<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>아이디</option>
								<option value="TC"
									<c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목
									or 내용</option>
								<option value="TW"
									<c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목
									or 아이디</option>
								</select> 
							<input type="text" class="form-control" name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>' /> 
							<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>' /> 
							<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>' />
							<button class='btn btn-primary'>Search <i class="fas fa-search"></i> </button>
						</form>
					</div>
				</div>
              <!-- /.card-tools -->
            </div>
            <!-- /.card-header -->
            <div class="card-body p-0">
              
              <div class="table-responsive mailbox-messages">

                <table class="table table-hover table-striped">
                <thead>
                  <tr>
                    <th>number</th>
                    <th>title</th>
                    <th>id</th>
                    <th>regDate</th>
                    <th>updateDate</th>
                  </tr>
                </thead>
                
                  <tbody>
<!--                   <tr>
                    <td>
                      <div class="icheck-primary">
                        <input type="checkbox" value="" id="check1">
                        <label for="check1"></label>
                      </div>
                    </td>
                    <td class="mailbox-star"><a href="#"><i class="fas fa-star text-warning"></i></a></td>
                    <td class="mailbox-name"><a href="read-mail.html">Alexander Pierce</a></td>
                    <td class="mailbox-subject"><b>AdminLTE 3.0 Issue</b> - Trying to find a solution to this problem...
                    </td>
                    <td class="mailbox-attachment"></td>
                    <td class="mailbox-date">5 mins ago</td>
                  </tr> -->
                 
                 <c:forEach items="${list}" var="board">

						<tr>
							<td><c:out value="${board.board_no}" /></td>
							<td><a class='move' href='<c:out value="${board.board_no}"/>'>
									<c:out value="${board.title}" /> </a></td>
							<td><c:out value="${board.userId}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.regDate}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.updateDate}" /></td>
						</tr>
					</c:forEach>
                  </tbody>
                </table>
                <!-- /.table -->
              </div>
              <!-- /.mail-box-messages -->
            </div>
                <button class='btn btn-primary' id ='regBtn' type="button">New Board </button>
             
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
          
          <!-- 페이징처리 부분 -->
          <form id="actionForm" action="/list" method='get'>
           <input type="hidden" name='pageNum' value='${pageMaker.cri.pageNum }'> 
           <input type="hidden" name='amount' value='${pageMaker.cri.amount }'>
           <input type='hidden' name='type' value='<c:out value="${ pageMaker.cri.type }"/>'> 
					<input	type='hidden' name='keyword' value='<c:out value="${ pageMaker.cri.keyword }"/>'>
          </form>
          
           <div class="pageInfo_wrap" >
        		<div class="pageInfo_area">
        			<ul id="pageInfo" class="pageInfo">
        			
        			<!-- 이전페이지 버튼 -->
                	<c:if test="${pageMaker.prev}">
                  	  <li class="pageInfo_btn previous"><a href="${pageMaker.startPage-1}">Previous</a></li>
                	</c:if>
                	
        			<!-- 각 번호 페이지 버튼 -->
               		 <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                  	  <li class="pageInfo_btn" ${pageMaker.cri.pageNum == num ? "active":"" }"><a href="${num}">${num}</a></li>
               		 </c:forEach>
               		 
               		 <!-- 다음페이지 버튼 -->
              		 <c:if test="${pageMaker.next}">
                   		 <li class="pageInfo_btn next"><a href="${pageMaker.endPage + 1 }">Next</a></li>
                	 </c:if>   
        			</ul>
        		</div>
   			</div>
          
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>

<!-- Modal -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myModalLabel">Modal title</h4>
							</div>
							<div class="modal-body">처리가 완료되었습니다.</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
								<button type="button" class="btn btn-primary">Save
									changes</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->
<!-- ./wrapper -->

<!-- jQuery -->
<script src="${path }/resources/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="${path }/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="${path }/resources/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="${path }/resources/dist/js/demo.js"></script>
<!-- Page specific script -->
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
      var fa    = $this.hasClass('fa')

      //Switch states
      if (fa) {
        $this.toggleClass('fa-star')
        $this.toggleClass('fa-star-o')
      }
    })
  })
</script>

<script type="text/javascript">
	$(document).ready(function() {
		var result = '<c:out value="${result}"/>';
		checkModal(result);

		history.replaceState({}, null, null);

		function checkModal(result) {
			if (result === '' || history.state) {
				return;
			}

			if (parseInt(result) > 0) {
				$(".modal-body").html(
						"게시글 " + parseInt(result)
								+ "번이 등록되었습니다.");
			}

			$("#myModal").modal("show");
		}
		$("#regBtn").on("click", function() {
			self.location = "register";
		});
	});
	
	var actionForm = $("#actionForm");

	$(".paginate_button a").on(
			"click",
			function(e) {
				e.preventDefault();
				console.log('click');
				actionForm.find("input[name='pageNum']")
						.val($(this).attr("href"));
				actionForm.submit();
			});
	$(".move").on("click", function(e) {
				e.preventDefault();
				actionForm.append("<input type='hidden' name='board_no' value='" + $(this).attr("href")+ "'>");
				actionForm.attr("action","get");
				actionForm.submit();
			});
	
	 $(".pageInfo a").on("click", function(e){
		 	e.preventDefault();
		 	console.log('click');
		 	actionForm.find("input[name='pageNum']").val($(this).attr("href"));
	        actionForm.attr("action", "list");
	        actionForm.submit();
	  });
	 
	 var searchForm = $("#searchForm");

		$("#searchForm button").on(
				"click",
				function(e) {

					if (!searchForm.find("option:selected").val()) {
						alert("검색종류를 선택하세요");
						return false;
					}

					if (!searchForm.find("input[name='keyword']").val()) {
						alert("키워드를 입력하세요");
						return false;
					}

					searchForm.find("input[name='pageNum']").val("1");
					e.preventDefault();

					searchForm.submit();

				});
</script>X

</body>
</html>


<%@include file="../../includes/footer.jsp"%>