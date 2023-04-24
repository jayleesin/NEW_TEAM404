<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../includes/header.jsp"%>
<link rel="stylesheet" href="${path }/resources/css/Search.css">
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=tskz2tj6ms"></script>
	<script src="${path }/resources/plugins/jquery/jquery.min.js"></script>
<!-- Main -->
<c:set value="${restaurant }" var="res"></c:set>
<c:set value="1" var="count"></c:set>
<%-- <c:set value="${beginIndex}" var="beginIndex" />
<c:set value="${endIndex}" var="endIndex" /> --%>
<main class="content">
	<div class="aside"></div>
	<section class="main_section">
		<div class="sort_container">
			<span class="sort_marker"> <img
				src="${path }/resources/Front/img/order.png" alt=""> 정렬
			</span>
			<ul class="sort">
				<li><a href="#">점수순</a></li>
				<li><a href="#">평점순</a></li>
				<li><a href="#">리뷰많은순</a></li>
				<li><a href="#">좋아요많은순</a></li>
				<li><a href="#">거리순</a></li>
			</ul>

			<div class="location">
				<a href="#"> 현 위치 : 위치 없음 </a>
			</div>
		</div>

		<div class="map_header">
			<span>${searchKeyword}</span> <span>맛집(</span><span class="place-count"><c:out value="${res.size()}" /></span><span>곳)</span> 
			</span>

		</div>

		<div id="map"></div>




		<c:forEach items="${restaurant}" var="res" begin="0" end="4">

	
			<div class="list">
				<div class="list_inner">
					<img src="${path}${res.img_path}" alt="">
					<div class="list_inner_info">
						<h1 class="res_title">
							${count }.
							<c:out value="${res.res_Name }"></c:out>
						</h1>
						<div><c:out value="${res.address }"/></div>
						<span><c:out value="${res.menu}"></c:out></span>


					</div>
				</div>
				<p>
					<c:out value="${res.info }"></c:out>
				</p>
				<div class="reply_cnt">
					<span>추천란</span>
				</div>
			</div>
			<c:set var="count" value="${count + 1}" />
		</c:forEach>
	</section>

	<div class="a"></div>
	<button class="kmeaye">
		<img
			src="https://dcicons.s3.ap-northeast-1.amazonaws.com/new/images/web/react_components/indexPage/recom_move_top_default.png"
			alt="">
	</button>

</main>
<script>

var mapOptions = {
		  center: new naver.maps.LatLng(37.5666102, 126.9783881),
		  zoom: 10
		};

		var map = new naver.maps.Map('map', mapOptions);

		var markerOptions = {
		  position: new naver.maps.LatLng(37.5670135, 126.9783740),
		  map: map,
		  icon: {
		    url: './resources/img/marker.png', // 사용자가 제공한 이미지 파일 경로
		    size: new naver.maps.Size(50, 50), // 이미지 크기
		    origin: new naver.maps.Point(0, 0), // 이미지의 원점 위치
		    anchor: new naver.maps.Point(25, 25) // 이미지의 앵커 위치
		  }
		};
		var address

		var marker = new naver.maps.Marker(markerOptions);
</script>
<script src="${path}/resources/js/Search.js"></script>
</body>
<%@ include file="../includes/footer.jsp"%>
</html>