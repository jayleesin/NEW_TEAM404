<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ page session="false"%>
<c:set value="1" var="count" />
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>AdminPage</title>

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="${path }/resources/plugins/fontawesome-free/css/all.min.css">
<!-- jsGrid -->
<link rel="stylesheet"
	href="${path }/resources/plugins/jsgrid/jsgrid.min.css">
<link rel="stylesheet"
	href="${path }/resources/plugins/jsgrid/jsgrid-theme.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="${path }/resources/dist/css/adminlte.min.css">
</head>

<body class="hold-transition sidebar-mini">

	<div class="wrapper">
		<!-- Navbar -->
		<nav
			class="main-header navbar navbar-expand navbar-white navbar-light">
			<!-- Left navbar links -->
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" data-widget="pushmenu"
					href="#" role="button"><i class="fas fa-bars"></i></a></li>
				<li class="nav-item d-none d-sm-inline-block"><a
					href="../../index3.html" class="nav-link">Home</a></li>
				<li class="nav-item d-none d-sm-inline-block"><a href="#"
					class="nav-link">Contact</a></li>
			</ul>

			<!-- Right navbar links -->
			<ul class="navbar-nav ml-auto">
				<!-- Navbar Search -->
				<li class="nav-item"><a class="nav-link"
					data-widget="navbar-search" href="#" role="button"> <i
						class="fas fa-search"></i>
				</a>
					<div class="navbar-search-block">
						<form class="form-inline">
							<div class="input-group input-group-sm">
								<input class="form-control form-control-navbar" type="search"
									placeholder="Search" aria-label="Search">
								<div class="input-group-append">
									<button class="btn btn-navbar" type="submit">
										<i class="fas fa-search"></i>
									</button>
									<button class="btn btn-navbar" type="button"
										data-widget="navbar-search">
										<i class="fas fa-times"></i>
									</button>
								</div>
							</div>
						</form>
					</div></li>

				<!-- Messages Dropdown Menu -->
				<li class="nav-item dropdown"><a class="nav-link"
					data-toggle="dropdown" href="#"> <i class="far fa-comments"></i>
						<span class="badge badge-danger navbar-badge">3</span>
				</a>
					<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
						<a href="#" class="dropdown-item"> <!-- Message Start -->
							<div class="media">
								<img src="../../dist/img/user1-128x128.jpg" alt="User Avatar"
									class="img-size-50 mr-3 img-circle">
								<div class="media-body">
									<h3 class="dropdown-item-title">
										Brad Diesel <span class="float-right text-sm text-danger"><i
											class="fas fa-star"></i></span>
									</h3>
									<p class="text-sm">Call me whenever you can...</p>
									<p class="text-sm text-muted">
										<i class="far fa-clock mr-1"></i> 4 Hours Ago
									</p>
								</div>
							</div> <!-- Message End -->
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item"> <!-- Message Start -->
							<div class="media">
								<img src="../../dist/img/user8-128x128.jpg" alt="User Avatar"
									class="img-size-50 img-circle mr-3">
								<div class="media-body">
									<h3 class="dropdown-item-title">
										John Pierce <span class="float-right text-sm text-muted"><i
											class="fas fa-star"></i></span>
									</h3>
									<p class="text-sm">I got your message bro</p>
									<p class="text-sm text-muted">
										<i class="far fa-clock mr-1"></i> 4 Hours Ago
									</p>
								</div>
							</div> <!-- Message End -->
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item"> <!-- Message Start -->
							<div class="media">
								<img src="../../dist/img/user3-128x128.jpg" alt="User Avatar"
									class="img-size-50 img-circle mr-3">
								<div class="media-body">
									<h3 class="dropdown-item-title">
										Nora Silvester <span class="float-right text-sm text-warning"><i
											class="fas fa-star"></i></span>
									</h3>
									<p class="text-sm">The subject goes here</p>
									<p class="text-sm text-muted">
										<i class="far fa-clock mr-1"></i> 4 Hours Ago
									</p>
								</div>
							</div> <!-- Message End -->
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item dropdown-footer">See All
							Messages</a>
					</div></li>
				<!-- Notifications Dropdown Menu -->
				<li class="nav-item dropdown"><a class="nav-link"
					data-toggle="dropdown" href="#"> <i class="far fa-bell"></i> <span
						class="badge badge-warning navbar-badge">15</span>
				</a>
					<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
						<span class="dropdown-item dropdown-header">15
							Notifications</span>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item"> <i
							class="fas fa-envelope mr-2"></i> 4 new messages <span
							class="float-right text-muted text-sm">3 mins</span>
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item"> <i
							class="fas fa-users mr-2"></i> 8 friend requests <span
							class="float-right text-muted text-sm">12 hours</span>
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item"> <i class="fas fa-file mr-2"></i>
							3 new reports <span class="float-right text-muted text-sm">2
								days</span>
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item dropdown-footer">See All
							Notifications</a>
					</div></li>
				<li class="nav-item"><a class="nav-link"
					data-widget="fullscreen" href="#" role="button"> <i
						class="fas fa-expand-arrows-alt"></i>
				</a></li>
				<li class="nav-item"><a class="nav-link"
					data-widget="control-sidebar" data-slide="true" href="#"
					role="button"> <i class="fas fa-th-large"></i>
				</a></li>
			</ul>
		</nav>
		<!-- /.navbar -->

		<!-- Main Sidebar Container -->
		<!-- Menu -->
		<aside class="main-sidebar sidebar-dark-primary elevation-4">
			<!-- Brand Logo -->
			<a href="../../tasteforming/main" class="brand-link"> <img
				src="${path }\resources\img\TasteFormingLogo.png"
				alt="TasteFormingLogo" class="brand-image img-circle elevation-3"
				style="margin-left: -0.8rem; background-color: #fff"> <span
				class="brand-text font-weight-light">Tasteforming</span>
			</a>

			<!-- Sidebar -->
			<div class="sidebar">
				<!-- Sidebar user panel (optional) -->
				<div class="user-panel mt-3 pb-3 mb-3 d-flex">
					<div class="image">
						<img src="../dist/img/user2-160x160.jpg"
							class="img-circle elevation-2" alt="User Image">
					</div>
					<div class="info">
						<a href="#" class="d-block">adminPage</a>
					</div>
				</div>

				<!-- SidebarSearch Form -->
				<form action="/userSearch" method="get">
					<div class="form-inline">
						<div class="input-group" data-widget="sidebar-search">
							<input class="form-control form-control-sidebar" type="search"
								placeholder="Search" aria-label="Search">
							<div class="input-group-append">
								<button class="btn btn-sidebar">
									<i class="fas fa-search fa-fw"></i>
								</button>
							</div>
						</div>
					</div>
				</form>
				<!-- Sidebar Menu -->
				<nav class="mt-2">
					<ul class="nav nav-pills nav-sidebar flex-column"
						data-widget="treeview" role="menu" data-accordion="false">
						<!-- Add icons to the links using the .nav-icon class
                       with font-awesome or any other icon font library -->
						<li class="nav-item menu-is-opening menu-open">

							<ul class="nav nav-treeview" style="display: block;">
								<li class="nav-item"><a href="UserManagement"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>유저관리</p>
								</a></li>
								<li class="nav-item"><a href="ResManagement"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>식당관리</p>
								</a></li>
								<li class="nav-item"><a href="BoardManagement"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>게시글관리</p>
								</a></li>
								<li class="nav-item"><a href="ReplyManagement"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>댓글관리</p>
								</a></li>
								<li class="nav-item"><a href="ReserveManagement"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>예약관리</p>
								</a></li>
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
							<h1>유저관리</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item active">유저관리</li>
							</ol>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="card">
					<div class="card-header">
						<h3 class="card-title">유저데이터</h3>
					</div>
					<!-- /.card-header -->
					<div class="card-body">
						<div id="jsGrid1" class="jsgrid"
							style="position: relative; height: 100%; width: 100%;">
							<div class="jsgrid-grid-header jsgrid-header-scrollbar">
								<table class="jsgrid-table">

									<!-- table header -->
									<tr class="jsgrid-header-row">

										<th class="jsgrid-header-cell jsgrid-header-sortable"
											style="width: 100px;">UserId</th>
										<th
											class="jsgrid-header-cell jsgrid-align-right jsgrid-header-sortable"
											style="width: 50px;">UserName</th>
										<th
											class="jsgrid-header-cell jsgrid-align-right jsgrid-header-sortable"
											style="width: 70px;">Role</th>
										<th class="jsgrid-header-cell jsgrid-header-sortable"
											style="width: 130px;">Address</th>
										<th
											class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
											style="width: 50px;">RegDate</th>
										<th
											class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
											style="width: 50px;">UpdateDate</th>
										<th
											class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
											style="width: 50px;">Enabled</th>
										<th
											class="jsgrid-header-cell jsgrid-control-field jsgrid-align-center"
											style="width: 50px;"><input
											class="jsgrid-button jsgrid-mode-button jsgrid-search-mode-button"
											type="button" title=""></th>
									</tr>
									<!-- table header -->
								</table>
							</div>



							<div class="jsgrid-grid-body">
								<table class="jsgrid-table">
									<tbody>


										<!-- table body edit -->
										<c:forEach items="${member }" var="mem" varStatus="loop">

											<tr class="jsgrid-edit-row"
												id="edit-row-${loop.index}" style="display: none;">
												<td class="jsgrid-cell" style="width: 100px;"><input
													type="text" value="${mem.userId }" readonly></td>
												<td class="jsgrid-cell" style="width: 50px;"><input
													type="text" value="${mem.userName }" readonly></td>
												<td class="jsgrid-cell jsgrid-align-center"
													style="width: 70px;"><select name="auth">
														<option value="ROLE_USER"
															${mem.auth == 'ROLE_USER' ? 'selected' : ''}>ROLE_USER</option>
														<option value="ROLE_MEMBER"
															${mem.auth == 'ROLE_MEMBER' ? 'selected' : ''}>ROLE_MEMBER</option>
														<option value="ROLE_ADMIN"
															${mem.auth == 'ROLE_ADMIN' ? 'selected' : ''}>ROLE_ADMIN</option>
												</select></td>


												<td class="jsgrid-cell" style="width: 130px;"><input
													type="text" value="${mem.address }" readonly></td>
												<td class="jsgrid-cell" style="width: 50px;"><input
													type="date" value="${mem.regDate }" readonly></td>
												<td class="jsgrid-cell" style="width: 50px;"><input
													type="date" value="${mem.updateDate }" readonly></td>
												<td class="jsgrid-cell jsgrid-align-center"
													style="width: 50px;"><input type="checkbox"
													${mem.enabled == 1 ? "" : "checked"}></td>

												<td
													class="jsgrid-cell jsgrid-control-field jsgrid-align-center"
													style="width: 50px;"><input
													class="jsgrid-button jsgrid-update-button" type="button"
													title="Update"><input
													class="jsgrid-button jsgrid-cancel-edit-button"
													type="button" title="Cancel edit" onclick="cancelRow(${loop.index})"></td>
											</tr>



											<!-- table body -->
											<tr
												class="${loop.index % 2 == 0 ? 'jsgrid-row' : 'jsgrid-alt-row'}"
												id="data-row-${loop.index}">

												<td class="jsgrid-cell" style="width: 100px;"><c:out
														value="${mem.userId }" /></td>
												<td class="jsgrid-cell jsgrid-align-center"
													style="width: 50px;"><c:out value="${mem.userName }" /></td>
												<td class="jsgrid-cell jsgrid-align-center"
													style="width: 70px;"><c:out value="${mem.auth }" /></td>
												<td class="jsgrid-cell jsgrid-align-right" style="width: 130px;"><c:out
														value="${mem.address }" /></td>


												<td class="jsgrid-cell jsgrid-align-center"
													style="width: 50px;"><c:out value="${mem.regDate }" /></td>
												<td class="jsgrid-cell jsgrid-align-center"
													style="width: 50px;"><c:out value="${mem.updateDate }" /></td>
												<td class="jsgrid-cell jsgrid-align-center"
													style="width: 50px;"><c:out value="${mem.enabled }" /></td>
												<td
													class="jsgrid-cell jsgrid-control-field jsgrid-align-center"
													style="width: 50px;"><input
													class="jsgrid-button jsgrid-edit-button" type="button"
													title="Edit" onclick="showEditRow(${loop.index})">
													<input class="jsgrid-button jsgrid-delete-button"
													type="button" title="Delete"></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<!-- <div class="jsgrid-modal jsgrid-insert-mode">
									<div class="jsgrid-modal-dialog">
										<div class="jsgrid-modal-header">
											<button type="button" class="close jsgrid-modal-close"
												data-dismiss="modal" aria-hidden="true">&times;</button>
											<h4 class="jsgrid-modal-title">Modal title</h4>
										</div>
										<div class="jsgrid-modal-body">처리가 완료되었습니다.</div>
										<div class="jsgrid-modal-footer">
											<button type="button"
												class="btn btn-default jsgrid-modal-close"
												data-dismiss="modal">Close</button>
											<button type="button" class="btn btn-primary">Save
												changes</button>
										</div>
									</div>
								</div> -->
							</div>

							<form action="/tasteforming/admin/UserManagement" id="actionForm"
								method='get'>
								<input type="hidden" name='pageNum'
									value='${pageMaker.cri.pageNum }'> <input type="hidden"
									name='amount' value='${pageMaker.cri.amount }'>
							</form>

							<div class="jsgrid-pager-container">
								<div class="jsgrid-pager">
									Pages: <span class="jsgrid-pager-nav-button First"> <a
										href="?pageNum=1&amount=${pageMaker.cri.amount }">First</a>
									</span>

									<c:if test="${pageMaker.prev}">
										<span class="jsgrid-pager-nav-button Prev"> <c:choose>
												<c:when test="${pageMaker.cri.pageNum <= 10}">
													<a href="?pageNum=1&amount=${pageMaker.cri.amount}">Prev</a>
												</c:when>
												<c:otherwise>
													<a
														href="?pageNum=${pageMaker.cri.pageNum-10}&amount=${pageMaker.cri.amount}">Prev</a>
												</c:otherwise>
											</c:choose>
										</span>
									</c:if>


									<c:forEach var="num" begin="${pageMaker.startPage}"
										end="${pageMaker.endPage}">
										<span
											class="jsgrid-pager-page ${pageMaker.cri.pageNum == num ? "jsgrid-pager-current-page" : ""}">
											<a href="${num}">${num}</a>
										</span>
									</c:forEach>



									<c:if test="${pageMaker.next}">
										<span class="jsgrid-pager-nav-button Next"> <c:choose>
												<c:when
													test="${pageMaker.cri.pageNum+10 >= pageMaker.total }">
													<a
														href="?pageNum=${pageMaker.total}&amount=${pageMaker.cri.amount}">Next</a>
												</c:when>
												<c:otherwise>
													<a
														href="?pageNum=${pageMaker.cri.pageNum+10}&amount=${pageMaker.cri.amount}">Next</a>
												</c:otherwise>
											</c:choose>
										</span>
									</c:if>

									<span class="jsgrid-pager-nav-button Last"> <a
										href="?pageNum=${pageMaker.total}&amount=${pageMaker.cri.amount}">Last</a>
									</span> &nbsp;&nbsp;
									<c:out value="${pageMaker.cri.pageNum}" />
									of
									<c:out value="${pageMaker.total}" />

								</div>
							</div>

							<div class="jsgrid-load-shader"
								style="display: none; position: absolute; inset: 0px; z-index: 1000;">
							</div>
							<div class="jsgrid-load-panel"
								style="display: none; position: absolute; top: 50%; left: 50%; z-index: 1000;">
								Please, wait...</div>
						</div>
					</div>
					<!-- /.card-body -->
				</div>
				<!-- /.card -->
			</section>
			<!-- /.content -->
		</div>

		<!-- Modal -->

		<!-- end Modal -->

		<footer class="main-footer">
			<div class="float-right d-none d-sm-block">
				<b>Version</b> 3.2.0
			</div>
			<strong>Copyright &copy; 2014-2021 <a
				href="https://adminlte.io">AdminLTE.io</a>.
			</strong> All rights reserved.
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
	<!-- Bootstrap 4 -->
	<script
		src="${path }/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- jsGrid -->
	<script src="${path }/resources/plugins/jsgrid/demos/db.js"></script>
	<script src="${path }/resources/plugins/jsgrid/jsgrid.min.js"></script>
	<!-- AdminLTE App -->
	<script src="${path }/resources/dist/js/adminlte.min.js"></script>
	<script src="${path}\resources\js\user.js"></script>
	<script>
		var elements = document
				.querySelectorAll(".jsgrid-row, .jsgrid-alt-row");

		for (var i = 0; i < elements.length; i++) {
			elements[i].addEventListener("mouseover", function() {
				this.classList.add("jsgrid-selected-row");
			});

			elements[i].addEventListener("mouseout", function() {
				this.classList.remove("jsgrid-selected-row");
			});
		}

		var actionForm = $("#actionForm");

		$(".jsgrid-pager-page a").on("click", function(e) {
			e.preventDefault();
			console.log('click');
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});

		$(".jsgrid-grid-body").on("click", ".jsgrid-row, .jsgrid-alt-row",
				function() {
					var modal = $(".jsgrid-modal");
					modal.find(".jsgrid-modal-title").text("Modal title");
					modal.modal("show");
				});

		
		
		$(document).on("click", ".jsgrid-update-button", function() {
		    // 현재 row의 정보 가져오기
		    var row = $(this).closest("tr");
		    var userId = row.find("td:eq(0) input").val();
		    var userName = row.find("td:eq(1) input").val();
		    var auth = row.find("td:eq(2) select").val();
		    var address = row.find("td:eq(3) input").val();
		    var regDate = row.find("td:eq(4) input").val();
		    var updateDate = row.find("td:eq(5) input").val();
		    var enabled = row.find("td:eq(6) input").is(":checked") ? 0 : 1;

		    // form 태그 생성
		    var form = $("<form>").attr({
		        "action": "updateUser",
		        "method": "get",
		        "role": "form"
		    });

		    // input 태그 추가
		    $("<input>").attr({
		        "type": "hidden",
		        "name": "userId",
		        "value": userId
		    }).appendTo(form);
		    $("<input>").attr({
		        "type": "hidden",
		        "name": "enabled",
		        "value": enabled
		    }).appendTo(form);

		    // form 태그 실행
		    $(document.body).append(form);
		    form.submit();
		});
		

		$(document).on("click", ".jsgrid-delete-button", function() {
			var userId = $("#data-row-${loop.index} td:first-child").text();

		    var form = $("<form>").attr({
		        "action": "deleteUser",
		        "method": "get",
		        "role": "form"
		    });

		    $("<input>").attr({
		        "type": "hidden",
		        "name": "userId",
		        "value": userId
		    }).appendTo(form);

		    $(document.body).append(form);
		    form.submit();
		});
			

		
		$(document).on("click", ".jsgrid-delete-button", function () {
			var userId = this.closest('tr').querySelector('td:first-child').innerText;

		    var form = $("<form>").attr({
		        "action": "deleteUser",
		        "method": "get",
		        "role": "form"
		    });

		    $("<input>").attr({
		        "type": "hidden",
		        "name": "userId",
		        "value": userId
		    }).appendTo(form);

		    $(document.body).append(form);
		    form.submit();
		});
	</script>
</body>

</html>