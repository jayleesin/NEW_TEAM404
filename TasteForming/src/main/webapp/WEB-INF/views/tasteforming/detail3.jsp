<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- jsp에서 컨트롤러에 보낸 예약 정보를 받아올 쿼리문 -->
<%@ page import="java.sql.*"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="res" value="${res }" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Restaurant</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap demo</title>
<link rel="stylesheet" href="${path}/resources/css/slide.css">
<link rel="stylesheet" href="/resources/css/detail.css">
<link rel="stylesheet" href="${path}/resources/css/detail.css">
<link rel="stylesheet" href="${path}/resources/js/datepicker.js">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<!-- 달력 링크-->
<!-- jQuery UI CSS 파일 링크 -->
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- 헤더 부분 작성할것 -->
<h1>헤더 부분</h1>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
</head>
<c:set value="${res }" var="res" />
<c:set value="${member }" var="mem" />
<body>
	<div class="container text-center">
		<div class="left">
			<!--좌측 부분 비율성정-->
			<!-- Post content-->
			<section class="contex-box"> <!-- Post header-->
			<div class="main-info">
				<!-- Post title-->
				<h1 class="fw-bolder mb-1">메인 상세페이지</h1>
			</div>


			<!-- 식당 좋아요, 공유하기 버튼 -->
			<div class="d-flex justify-content-start mt-2">
			
				<button type="Likebutton" class="btn btn-outline-dark">식당
					좋아요</button>
				<button type="sharebutton" class="btn btn-outline-dark">공유하기</button>
				<div class="ms-auto">

					<!-- 모달 트리거 버튼 -->
					<button type="button" class="btn btn-outline-dark"
						data-bs-toggle="modal" data-bs-target="#reservationModal">
						예약하기</button>

					<!--예약 모달 -->
					<div class="modal fade" id="reservationModal" tabindex="-1"
						aria-labelledby="reservationModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-fullscreen-sm-down">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="reservationModalLabel">예약 양식</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="닫기"></button>
								</div>




								<!-- 예약 정보를 입력하는 모달 창 -->
								<form action="insertReserve" method="post" role="form">
									<div class="modal-body">
										<input type="hidden" name="userId" value="${mem.userId }">
										<input type="hidden" name="res_No" value="${res.res_No }">
										<input type="hidden" name="res_Name" value="${res.res_Name }">

										<h3>날짜 선택</h3>
										<input type="text" id="datepicker" name="order_Date" value="1">

										<h3>인원 수 선택</h3>
										<select id="numOfPeople" name="head_Cnt">
											<option value="1" ${param.head_cnt == 1 ? "selected" : ""}>1명</option>
											<option value="2" ${param.head_cnt == 2 ? "selected" : ""}>2명</option>
											<option value="3" ${param.head_cnt == 3 ? "selected" : ""}>3명</option>
											<option value="4" ${param.head_cnt == 4 ? "selected" : ""}>4명</option>
											<option value="5" ${param.head_cnt == 5 ? "selected" : ""}>5명</option>
											<option value="6" ${param.head_cnt == 6 ? "selected" : ""}>6명</option>
											<option value="7" ${param.head_cnt == 7 ? "selected" : ""}>7명</option>
											<option value="8" ${param.head_cnt == 8 ? "selected" : ""}>8명</option>

										</select>

										<h3>시간 선택</h3>
										<input type="time" id="timepicker" name="hour" value="1">
										<br> <br>
									</div>
									<div class="modal-footer">
										<button type="submit" class="btn btn-primary"
											data-bs-dismiss="modal" id="reserveBtn">예약</button>
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">닫기</button>
									</div>
								</form>

							</div>
						</div>
					</div>
					<!-- Reservation completion modal -->
					<div class="modal fade" id="reservationCompleteModal" tabindex="-1"
						aria-labelledby="reservationCompleteModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="reservationCompleteModalLabel">예약
										완료</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="닫기"></button>
								</div>
								<div class="modal-body">
									<p>예약이 완료되었습니다.</p>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">닫기</button>
								</div>
							</div>
						</div>
					</div>
			</section>
			<table>
				<!-- 			<tr>
					<th>RES_NO</th>
					<br>
					<th>RES_NAME</th>
					<th>CREATE_DATE</th>
					<th>ADDRESSS</th>
					<th>INFO</th>
					<th>MEMBER_ID</th>
					<th>MENU</th>
					<th>TYPE</th>
				</tr> -->
				<div class="res_detail"
					style="font-size: 20px; font-weight: bold; font-family: Arial, sans-serif;">
					<c:out value="${res.address }"></c:out>
					<br>
					<c:out value="${res.res_Name }"></c:out>
					<br>
					<c:out value="${res.info }"></c:out>
					<br>
					<c:out value="${res.menu }"></c:out>
					<br>
					<c:out value="${res.type }"></c:out>
					<br>
				</div>
			</table>

			<!--댓글 부분-->
			<section class="mb-5">
			<div class="content bg-light">
				<div class="content-body">
					<!-- Comment form-->
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<form action="/Review/insert" method="post" role="form"
						class="mb-4">
						<textarea class="form-control" rows="3" name="content"
							placeholder="맛있는 경험을 같이 공유해봐요!!"></textarea>
						<input type="hidden" name="userId" value="${mem.userId}">
						<input type="hidden" name="res_No" value="${res.res_No }">
						<!-- 등록/수정 버튼 -->
						<div class="d-flex justify-content-end">
							<button type="submit" class="btn btn-outline-dark">등록하기</button>
						</div>
					</form>
					<h1>댓글 목록</h1>
					<table class="my-table"
						style="text-align: left; border-collapse: separate; border-spacing: 20px; font-size: 17px">
						<tr style="font-size: 17px">
							<th>작성자</th>
							<th>댓글 내용</th>
							<th>작성일</th>
							<th>수정</th>
							<th>삭제</th>
						</tr>
						<c:forEach var="review" items="${reviewList}">
							<tr>
								<td><c:out value="${review.userId}" /></td>
								<td><c:out value="${review.content}" /><br></td>
								<td><c:out value="${fn:substring(review.regDate, 0, 10)}" /><br></td>
								<td><button type="button" class="btn btn-outline-dark"
										onclick="openModal('${review.res_No}', '${review.userId}')">수정</button></td>
								<td><button type="button" class="btn btn-outline-dark"
										onclick="deleteReview('${review.res_No}')">삭제</button></td>
							</tr>
						</c:forEach>
					</table>

					<div id="myModal" class="modal">
						<div class="modal-content">
							<span class="close" onclick="closeModal()">&times;</span>
							<form id="updateReview" action="/Review/update" method="post">
								<div>
									<input type="hidden" name="res_No" id="res_No" value="">
									<label for="content">댓글 내용:</label>
									<textarea id="content" name="content"></textarea>
								</div>
								<input type="submit" value="수정" class="btn btn-outline-dark">
							</form>
						</div>
					</div>
					<div id="deleteModal" class="modal">
						<div class="modal-content">
							<span class="close" onclick="closeDeleteModal()">&times;</span>
							<div>
								<p>정말 삭제하시겠습니까?</p>
								<button type="button" onclick="deleteReviewAction()"
									class="btn btn-outline-dark">예</button>
								<button type="button" onclick="closeDeleteModal()"
									class="btn btn-outline-dark">아니오</button>
								<input type="hidden" name="res_No" id="delete_res_No" value="">
								<!-- userId 파라미터를 전송할 필요가 없으므로 삭제합니다. -->
							</div>
						</div>
					</div>
					<script>
						function deleteReview(res_No) {
							document.getElementById("delete_res_No").value = res_No;
							document.getElementById("deleteModal").style.display = "block";
						}
						function deleteReviewAction() {
							var res_No = document
									.getElementById("delete_res_No").value;
							window.location.href = "/Review/delete?res_No="
									+ res_No;
						}
						function closeDeleteModal() {
							document.getElementById("deleteModal").style.display = "none";
						}
					</script>

				</div>
			</div>
			</section>
		</div>
		<!--우측 콘솔-->
		<div class="right">
			<!--지도 부분-->
			>
			<div class="map border-light mb-3" style="max-width: 18rem;">
				<div class="map-header">MAP</div>
				<div class="map-body">
					<div class="mini-map">


						<input id="hdn_lat" type="hidden" value="37.53601"> <input
							id="hdn_lng" type="hidden" value="126.97225">
						<div id="map"
							style="width: 150px; height: 150px; margin-top: 20px;"></div>
						<a href="" class="delisor-search"> <strong>'식당 이름'</strong><br>
							맛집 더 검색해보기
						</a>
					</div>
				</div>
			</div>
		</div>
		<!-- 모달을 처리하기 위한 자바스크립트 코드 -->
		<link href="${path}/resources/js/modal.js" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script>
			// 모달 보여주는 함수
			function showModal() {
				$('#reservationModal').modal('show');
			}

			// 모달 숨기는 함수
			function hideModal() {
				$('#reservationModal').modal('hide');
			}

			// 예약 버튼 클릭 시 예약 완료 메시지 보여주기
			$('#reserveBtn').on('click', function() {
				// 선택한 날짜, 인원 수, 시간 가져오기
				var order_date = $('#datepicker').val();
				var head_cnt = $('#numOfPeople').val();
				var hour = $('#timepicker').val();

				// 예약 완료 모달을 보여줌
				$('#reservationCompleteModal').modal('show');

				// 모달 숨기기
				setTimeout(function() {
					hideModal();
				}, 1500); // 1.5초 후 모달 닫기
			});

			// 날짜 선택기 초기화
			$(function() {
				$("#datepicker").datepicker();
			});
		</script>
		<script>
			function openModal(resNo, content) {
				// 모달창 열기
				document.getElementById('myModal').style.display = 'block';

				// 폼 데이터 채우기
				document.getElementById('res_No').value = resNo;
				document.getElementById('content').value = content;
			}

			function closeModal() {
				// 모달창 닫기
				document.getElementById('myModal').style.display = 'none';
			}
		</script>
		<!-- 댓글에 모달 스크립트 -->

		<!-- jQuery 및 jQuery UI 스크립트 파일 링크 -->
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</body>
</html>

