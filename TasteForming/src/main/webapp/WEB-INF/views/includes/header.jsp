<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tasteforming.service.MainServiceImpl"%>
<%@page import="com.tasteforming.domain.RestaurantVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ page session="false"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<sec:authorize access="isAuthenticated()">
  Welcome, <sec:authentication property="name" />!
</sec:authorize>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="${path}/resources/css/Main.css" rel="stylesheet" />
<link rel="stylesheet" href="${path }/resources/css/reset.css">

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />

<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>


<title>TasteForming</title>
</head>

<body>
	<%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
  var actionForm = $("#actionForm");

	$(".move").on("click",function(e) {
		e.preventDefault();
		actionForm
				.append("<input type='hidden' name='res_No' value='"
						+ $(this).attr(
								"href")
						+ "'>");
		actionForm.attr("action",
				"/tasteforming/detail");
		actionForm.submit();
});	 --%>

	<header>
		<form action="/customLogout" id="logoutForm" method="post">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		</form>
		<form action="/search" id="actionForm" method='get'></form>
		<div class="container header">
			<a href="main"><img
				src="${path }/resources/img/TasteFormingLogo.png"
				alt="TasteFormingLogo" width="150px"></a>

			<!-- 검색 -->
			<form class="search-container" action="search" method="get">
				<label for="keyword"></label> <input type="text" name="keyword"
					class="search-box" placeholder="지역, 음식 또는 식당명 입력">
			</form>



			<!-- 로그인 -->
			<sec:authorize access="isAuthenticated()">
				<div class="sign">
					<span><sec:authentication property="name" />님  환영합니다.
					</span> <a class="customLogout">로그아웃</a>
				</div>
			</sec:authorize>
			<%-- <sec:authorize access="isAnonymous()"> --%>
			<sec:authorize access="!isAuthenticated()">
				<div class="sign">
					<a href="/customLogin">로그인</a> <a href="/customRegister">회원가입</a>
				</div>
			</sec:authorize>

		</div>

		<nav class="nav">
			<div class="menu_list">
				<sec:authorize access="isAuthenticated()">
					<a href="myPage/myPage">마이페이지</a>
				</sec:authorize>
				
				<sec:authorize access="hasAuthority('ROLE_ADMIN')">
					<a href="admin/adminPage">관리자페이지</a>
				</sec:authorize>
				
				<a href="board/list">게시판</a>
				<a href="contactUs">TEAM_404</a>
			</div>
		</nav>
	</header>