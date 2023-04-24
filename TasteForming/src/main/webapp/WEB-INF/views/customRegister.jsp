<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="${path }/resources/plugins/jquery/jquery.min.js"></script>
<link rel="stylesheet" href="${path }/resources/css/Register.css">
<link rel="stylesheet" href="${path }/resources/css/reset.css">
<title>TasteForming</title>
</head>
<body>
<body>
	<header class="header"> <a href="tasteforming/main"> <img
		src="${path }/resources/img/TasteFormingLogo.png" alt="">
	</a> </header>

	<main class="main-layout">
	<div class="title">회원가입</div>
	<div class="sub-title">TasteForming 에 오신 것을 환영합니다.</div>
	<form role="form" method='post' action="/customRegister">
		<input type="text" class="input-text" placeholder="아이디" name="userId"
			id="userId"> <input type="password" class="input-text"
			placeholder="비밀번호" name='userPw' id="userPw"> <input
			type="text" class="input-text" placeholder="이름" name='userName'
			id="userName"> <input type="text" class="input-text"
			placeholder="주소" name='address' id='address'>



		<div style="padding: 12px 0;">
			<div class="fl">
				<label class="checkbox" for="ckb_auto"> <input id="ckb_auto"
					type="checkbox" value="ROLE_USER" name="auth" onclick="check(this)"
					checked> <i class="check-icon"></i> <span
					class="fs-13 fw-b">일반회원</span>
				</label> <label class="checkbox" for="ckb_restaurant"> <input
					id="ckb_restaurant" type="checkbox" value="ROLE_MANAGER"
					name="auth" onclick="check(this)"> <i class="check-icon"></i>
					<span class="fs-13 fw-b">식당회원</span>
				</label>
			</div>
		</div>

		<button type="submit" class="register-btn" id="sign-up-btn">회원가입</button>
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
	</form>
	<hr>


	<button type="button" class="login-btn"
		onclick="window.location.href='customLogin'">로그인</button>
	</main>

	<script>
		function check(checkbox) {
			var checkboxes = document.getElementsByName("auth");
			checkboxes
					.forEach(function(cb) {
						cb.checked = false; // 모든 체크박스를 선택 안 된 상태로 초기화
						var checkIcon = cb.parentNode
								.querySelector(".check-icon");
						checkIcon.style.backgroundImage = "url(https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/common/ic-signup-chk-off.png)";
					});
			checkbox.checked = true; // 선택된 체크박스의 checked 속성을 true로 설정
			var checkIcon = checkbox.parentNode.querySelector(".check-icon");
			checkIcon.style.backgroundImage = "url(https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/common/ic-signup-chk-on.png)";
		}

		$(document).ready(function() {
			$("#sign-up-btn").on("click", function(e) {
				/* 폼 유효성 검사 */
				if ($("#userId").val() === "") {
					alert("아이디를 입력해주세요.");
					$("#userId").focus();
					return false;
				} else if ($("#userPw").val() === "") {
					alert("패스워드를 입력해주세요.");
					$("#userPw").focus();
					return false;
				} else if ($("#userName").val() === "") {
					alert("사용자 명을 입력해주세요.");
					$("#userName").focus();
					return false;
				} else if ($("#address").val() === "") {
					alert("주소를 입력해주세요.");
					$("#address").focus();
					return false;
				}
				e.preventDefault();
				$("form").submit();
				alert("회원가입을 축하드립니다.");
			});
		});
	</script>
	<%@ include file="./includes/footer.jsp"%>
</body>
</html>