<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- jsp에서 컨트롤러에 보낸 예약 정보를 받아올 쿼리문 -->
<%@ page import="java.sql.*"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set value="${res }" var="res" />
<c:set value="${member}" var="mem" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Tasteforming</title>
<link rel="stylesheet" href="${path}/resources/css/NewDetail.css">
<link rel="stylesheet" href="${path}/resources/css/reset.css">
<!-- jQuery UI CSS 파일 링크 -->
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
</head>


<%-- <%@ include file="../includes/header.jsp"%> --%>



<body class="bg">
	<main class="container-wrap"> <aside class="subleft-cont">
	<div class="mini-map">Mini Map</div>

	</aside> <section class="header-container"> <img
		src="${path }${res.img_path}" alt="" class="food_img">

	<h1 class="detail_resName">
		<c:out value="${res.res_Name }"></c:out>
	</h1>
	<div class="res_menu">
		<c:out value="${res.type }"></c:out>
		|
		<c:out value="${res.menu }"></c:out>
	</div>
	<hr>

	<div class="favor-pic-appra">

		<button type="button" class="favor"
			onclick="openLikeModal('${res.res_No}', '${mem.userId}','${res.likeCnt}')">좋아요</button>
		<button type="button" class="sharebutton" id="shareButton">공유하기</button>
		<button type="button" class="reserveBtn"
			onclick="openReserveModal('${mem.userId}', '${res.res_No}', '${res.res_Name}')">
			예약하기</button>

	</div>

	<!-- 좋아요 모달창 -->
	<form id="likeForm" method="post" action="/tasteforming/likeCnt">
		<input type="hidden" name="memberId" value="${member.userId}">
		<input type="hidden" id="res_No" name="res_No" value="${res.res_No}">
		<input type="hidden" id="likeCnt" name="likeCnt"
			value="${res.likeCnt}">
		<div id="likeModal" class="modal">
			<div class="modal-content">
				<span class="close" onclick="closeModal()">&times;</span> <input
					type="button" onclick="saveLike()" class="btn btn-outline-dark"
					value="예"> <input type="button"
					onclick="closeModal(); return false;" class="btn btn-outline-dark"
					value="아니오">
			</div>
		</div>
	</form>



	<!-- 공유하기 모달 -->
	<div class="modal" id="shareModal">
		<div class="modal-content">
			<span class="close" id="closeShareModal">&times;</span> <label
				for="shareUrl">현재 링크 복사하기:</label> <input type="text" id="shareUrl"
				value="" readonly>
			<button type="button" id="copyButton" class="btn btn-outline-dark">복사하기</button>
		</div>
	</div>

	<!--예약 모달 -->
	<div class="modal" id="reservationModal" tabindex="-1"
		aria-labelledby="reservationModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-fullscreen-sm-down">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="reservationModalLabel">예약 양식</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="닫기"></button>
				</div>


				<!-- 예약 정보를 입력하는 모달 창 -->
				<form action="/tasteforming/insertReserve" method="post" role="form">
					<div class="modal-body">
						<input type="hidden" name="userId" value="${mem.userId }"> <input
							type="hidden" name="res_No" value="${res.res_No }"> <input
							type="hidden" name="res_Name" value="${res.res_Name }">

						<h3>날짜 선택</h3>
						<input type="text" id="datepicker" name="order_Date"
							placeholder="(클릭)날짜를 선택하세요">

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
	<div></div>
	</section>

	<div class="info-container">
		<p>서울특별시 강남구 신사동</p>
		<p>02-792-1476</p>
		<p>수요미식회, 데이트</p>
		<p>깔끔한, 점식식사, 저녘식사, 발렛, 발렛피킹, 배달</p>
		<p>페업신고, 정보수정 제안</p>
	</div>

	<div class="menu-container">
		<h2>영업시간</h2>
		<p>매일 === 오전 11시 - 오후 10시</p>

		<h2>메뉴정보</h2>
		<p>토스트&잼 === 6,000원</p>
		<p>토스트&잼 === 6,000원</p>
		<p>토스트&잼 === 6,000원</p>
	</div>

	<div class="review_box">
		<h3 class="review-title">
			<span><c:out value="${review_cnt}" /></span>건의 방문자 평가
		</h3>
		<hr>
		<form action="/Review/insert" method="post" role="form" class="mb-4"
			id="review-form">
			<textarea name="content" cols="20" rows="10" class="review-content"
				placeholder="맛있는 경험을 같이 공유해봐요!!"></textarea>
			<input type="hidden" name="userId" id="userId" value="${mem.userId}">
			<input type="hidden" name="res_No" value="${res.res_No}">
			<div class="favor-pic-appra">
				<button type="submit" class="reserve">등록하기</button>
			</div>
		</form>


		<c:forEach var="review" items="${reviewList}">
			<div class="reviews">

				<span class="review_no"><c:out value="${review.resview_No}" />
					<span class="username dd"> <c:out value="${review.userId}" />
				</span></span>

				<div class="dates">
					작성일자 :
					<c:out value="${fn:substring(review.regDate, 0, 10)}" />
				</div>

				<div class="content">
					댓글 :
					<c:out value="${review.content}" />
					<td><button type="button" class="btn btn-outline-dark"
							onclick="openModal('${review.resview_No}', '${review.res_No}', '${review.userId}', '${review.content}')"
							style="font-size: 10px; padding: 0.2rem 0.2rem;">수정</button></td>
					<td><button type="button" class="btn btn-outline-dark"
							onclick="deleteReview('${review.resview_No}','${review.res_No}','${review.userId}')"
							style="font-size: 10px; padding: 0.2rem 0.2rem;">삭제</button></td>

				</div>
			</div>
		</c:forEach>

		<!-- 수정, 삭제 모달 -->
		<div id="myModal" class="modal">

			<div class="modal-content">
				<span class="close" onclick="closeModal()">&times;</span>
				<form id="updateReview" action="/Review/update" method="post">
					<div>
						<input type="hidden" name="resview_No" id="resview_No" value="">
						<input type="hidden" name="res_No" id="res_No"
							value="${res.res_No}"> <label for="content">댓글
							내용:</label>
						<textarea id="content" name="content" id="content"></textarea>
						<input type="submit" value="수정" class="btn btn-outline-dark">
					</div>
				</form>
			</div>
		</div>
		<div id="deleteModal" class="modal">
			<div class="modal-content">
				<span class="close" onclick="closeDeleteModal()">&times;</span>
				<form id="deleteReview" action="/Review/delete" method="post">

					<div>
						<input type="hidden" name="resview_No" id="resview_No_delete">
						<input type="hidden" name="res_No" id="res_No_delete" value="">
						<input type="hidden" name="userId" id="userId" value="">
						<p>정말 삭제하시겠습니까?</p>
						<button type="submit" onclick="saveLike()"
							class="btn btn-outline-dark">예</button>
						<button type="button" onclick="closeLikeModal()"
							class="btn btn-outline-dark">아니오</button>

						<!-- userId 파라미터를 전송할 필요가 없으므로 삭제합니다. -->
					</div>
				</form>
			</div>
		</div>
	</div>
	</main>
	<!-- 좋아요 모달 -->
	<script>
		// 모달 닫기
		function closeModal() {
			document.getElementById("likeModal").style.display = "none";
		}

		// 모달 영역 외 클릭 시 모달 닫기
		window.onclick = function(event) {
			var modal = document.getElementById("likeModal");
			if (event.target == modal) {
				closeModal();
			}
		}

		// 좋아요 모달 열기
		function openLikeModal(res_No, userId, likeCnt) {
			// 로그인 여부 확인
			if (userId === "anonymousUser") {
				alert('로그인이 필요합니다.');
				return;
			}

			// 모달에 선택된 음식점 정보를 설정합니다.
			document.getElementById("likeModal").style.display = "block";
			document.getElementById("res_No").value = res_No;
			document.getElementById("likeCnt").value = likeCnt;
			document.getElementsByName("userId")[0].value = userId;
		}

		// 좋아요 정보 저장
		function saveLike() {
			document.getElementById("likeForm").submit();
			closeModal();
		}
	</script>




	<!-- 예약 모달 -->
	<script>
		function openReserveModal(loggedInUserId, resNo, resName) {
			// 로그인 여부 확인
			if (loggedInUserId === "anonymousUser") {
				alert('로그인이 필요합니다.');
				return;
			}
			// 모달 오픈
			$('#reservationModal').modal('show');
			// hidden input 값 설정
			$('input[name="userId"]').val(loggedInUserId);
			$('input[name="res_No"]').val(resNo);
			$('input[name="res_Name"]').val(resName);
		}

		$(document).ready(function() {
			// 예약하기 버튼 클릭 이벤트 처리
			$('.reserveBtn').click(function() {
				var loggedInUserId = '${loggedInUserId}';
				var resNo = $(this).data('res-no');
				var resName = $(this).data('res-name');
				openReserveModal(loggedInUserId, resNo, resName);
			});
		});
	</script>


	<!-- 댓글 등록모달 -->
	<script>
		function validateReview() {
			var reviewContent = document.getElementsByName("content")[0].value
					.trim();
			if (reviewContent === "") {
				alert("댓글을 입력해주세요.");
				return false;
			}

			const loggedInUserId = "${mem.userId}".trim();
			if (loggedInUserId === "" || loggedInUserId === "anonymousUser") {
				alert("로그인이 필요합니다.");
				return false;
			}

			return true;
		}

		var form = document.querySelector("#review-form");
		form.addEventListener("submit", function(event) {
			if (!validateReview()) {
				event.preventDefault();
			}
		});
	</script>



	<!-- 댓글 수정 모달 -->
	<script>
		function openModal(resview_No, res_No, userId, content) {
			// 현재 로그인된 아이디 가져오기
			const loggedInUserId = "${mem.userId}"; // 여기에 실제 현재 로그인된 아이디 값을 넣어주세요.

			// 댓글 작성자의 아이디와 현재 로그인된 아이디가 같은 경우에만 수정 창 열기
			if (userId === loggedInUserId) {
				// 모달창 열기
				document.getElementById('myModal').style.display = 'block';
				// 폼 데이터 채우기
				document.getElementById('res_No').value = res_No;
				document.getElementById('content').value = content;
				document.getElementById('resview_No').value = resview_No;
			} else {
				alert("본인이 작성한 댓글만 수정 가능합니다.");
			}
		}

		function closeModal() {
			// 모달창 닫기
			document.getElementById('myModal').style.display = 'none';
		}
	</script>

	<!-- 댓글 삭제 모달 -->
	<script>
		function deleteReview(resview_No, res_No, userId) {
			// Get logged in user ID from JSP variable
			const loggedInUserId = "${mem.userId}";

			// Check if current user is the same as the comment author
			if (loggedInUserId !== userId) {
				alert("삭제 권한이 없습니다.");
				return;
			}

			// Set form values and show delete modal
			document.getElementById("resview_No_delete").value = resview_No;
			document.getElementById("res_No_delete").value = res_No;
			document.getElementById("userId").value = userId;
			document.getElementById("deleteModal").style.display = "block";
		}

		function deleteReviewAction() {
			// Do something when delete button is clicked
			document.getElementById("deleteReview").submit();
		}

		function closeDeleteModal() {
			// Close delete modal
			document.getElementById("deleteModal").style.display = "none";
		}
	</script>

	<!-- 공유하기 모달창 -->
	<script>
		// 공유하기 모달창 열기
		document
				.getElementById("shareButton")
				.addEventListener(
						"click",
						function() {
							var url = window.location.href; // 현재 페이지의 URL을 가져옴
							document.getElementById("shareUrl").value = url; // 모달창의 input 태그에 URL을 넣어줌
							document.getElementById("shareModal").style.display = "block"; // 모달창을 보이게 함
						});
		// 공유하기 모달창 닫기
		document
				.getElementById("closeShareModal")
				.addEventListener(
						"click",
						function() {
							document.getElementById("shareModal").style.display = "none"; // 모달창을 숨김
						});
		// 복사 버튼 클릭 시 URL 복사
		document.getElementById("copyButton").addEventListener("click",
				function() {
					var urlInput = document.getElementById("shareUrl");
					urlInput.select(); // input 태그의 내용을 선택함
					document.execCommand("copy"); // 복사 명령 실행
					alert("링크가 복사되었습니다.");
				});
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="${path}/resources/js/datepicker.js"></script>
	<script type="text/javascript" src="${path}/resources/js/detail.js"></script>
</body>
<%-- <%@ include file="../includes/footer.jsp"%> --%>
</html>
