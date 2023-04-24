<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${path }/resources/css/login.css">
<link rel="stylesheet" href="${path }/resources/css/reset.css">
<script src="${path }/resources/plugins/jquery/jquery.min.js"></script>
<title>TasteForming</title>
</head>

<body>
	<header class="header"> <a href="tasteforming/main"> <img
		src="${path }/resources/img/TasteFormingLogo.png" alt="">
	</a> </header>

	<main class="main-layout">
	<div class="title">로그인</div>
	<div class="sub-title">TasteForming 에 오신 것을 환영합니다.</div>
	<form method='post' action="/login">
		<input type="text" class="input-text" placeholder="아이디"
			name='username' id="userid"> 
			<span class="duplicate-username-message"></span>
		<input type="password" class="input-text" placeholder="비밀번호" name='password' id="userpw">
			

		<div style="padding: 24px 0;">
			<div class="fl">
				<label class="checkbox" onclick="check()" for="ckb_auto"><input
					id="ckb_auto" type="checkbox" name='remember-me'><i
					class="check-icon"></i> <span class="fs-13 fw-b">로그인상태 유지</span></label>
					<a href="" class="find_pwd">비밀번호 찾기</a>
			</div>
		</div>

		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
		<button type="submit" class="login-btn" id="sign-up-btn">로그인</button>
	</form>
	<hr>

	<button type="button" class="register-btn"
		onclick="window.location.href='customRegister'">회원가입</button>
	</main>

	<script>
		function check() {
			var checkbox = document.getElementById("ckb_auto");
			checkbox.checked = !checkbox.checked; // 체크박스 선택 상태 반전

			var checkIcon = document.querySelector(".check-icon");
			if (checkbox.checked) {
				checkIcon.style.backgroundImage = "url(https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/common/ic-signup-chk-on.png)";
			} else {
				checkIcon.style.backgroundImage = "url(https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/common/ic-signup-chk-off.png)";
			}
		};
		
		
		$(document).ready(function() {
			$("#sign-up-btn").on("click", function(e) {

				/* 폼 유효성 검사 */
				if ($("#userid").val() === "") {
					alert("아이디를 입력해주세요.");
					$("#userid").focus();
					return false;
				} else if ($("#userpw").val() === "") {
					alert("패스워드를 입력해주세요.");
					$("#userpw").focus();
					return false;
				}
				e.preventDefault();
				$("form").submit();
			});
		});
		
		
		
	</script>
	<%@ include file="./includes/footer.jsp"%>

</body>

</html>
