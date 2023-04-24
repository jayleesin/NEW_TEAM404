<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../includes/header.jsp"%>
<!-- 010-2010-2509 -->
<%
List<RestaurantVO> restaurantList = (List<RestaurantVO>) request.getAttribute("data"); // 모든 식당 정보 가져오기
List<Map<String, String>> imageList = new ArrayList<>(); // 이미지 경로와 식당 이름 저장할 배열
for (RestaurantVO restaurant : restaurantList) {
	Map<String, String> imageMap = new HashMap<>();
	imageMap.put("img_path", restaurant.getImg_path());
	imageMap.put("res_name", restaurant.getRes_Name());
	imageList.add(imageMap);
}
%>
<div class="header_bg">
	<div class="place_modal">


		<a href="" class="modal_button">

		</a>
		<div class="modal">모달창</div>
	</div>
	<p class="res_name"></p>
</div>
<main class="main_box">
	<c:forEach items="${list }" var="entry">
		<div class="box">
			<div class="sub-box">
				<div class="type">
					<p>
						#
						<c:out value="${entry.key }" />
						(${fn:length(entry.value)})
					</p>
				</div>

				<div class="my-slider swiper-container">

					<ul class="swiper-wrapper">

						<!-- 여기입니다. -->
						<c:forEach items="${entry.value }" var="restaurant">
							<li class="swiper-slide"><a class='move'
								href='<c:out value="${restaurant.res_No }"/>'> <img
									src="${path}${restaurant.img_path}" alt="">
									<div class="info_box">
										<p>
											<c:out value="${restaurant.res_Name}" />

										</p>
										<p>
											<c:out value="${fn:split(restaurant.address, ' ')[1]}" />
											|
											<c:out value="${fn:split(restaurant.menu, ',')[0]}" />
										</p>
										<hr>
										<p>
											<c:out value="${restaurant.info }" />
										</p>
									</div>
									<div class="star">
										<img src="${path }/resources/img/star.png" alt="">
										<p>1.1</p>
									</div>
									<p>
										<c:out value="${restaurant.res_Name}" />
									</p>
							</a></li>
						</c:forEach>
					</ul>

					<div class="swiper-button-prev"></div>
					<div class="swiper-button-next"></div>
				</div>
			</div>
		</div>
	</c:forEach>
</main>

<script>
  const images = [
	  <%for (Map<String, String> imageMap : imageList) {%>
	    { img_path: '<%=imageMap.get("img_path")%>', res_name: '<%=imageMap.get("res_name")%>', res_addr: '<%=imageMap.get("res_address")%>' },
	  <%}%>
	];

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
});
	
	var logoutForm = $("#logoutForm");
		$(".customLogout").on("click",function(e){
			e.preventDefault();
			logoutForm.attr("action","/customLogout");
			logoutForm.submit();
});
</script>
<script>
/*   document.querySelector('.search-container').addEventListener('submit', function(event) {
    event.preventDefault(); // submit 이벤트 중지

    const keyword = document.querySelector('[name="addr"]').value; // 지역 입력값 가져오기

    const foodNameInput = document.querySelector('[name="menu"]');
    foodNameInput.value = keyword; // 음식 이름 입력

    const restaurantNameInput = document.querySelector('[name="res_name"]');
    restaurantNameInput.value = keyword; // 식당 이름 입력

    this.submit(); // 검색 form submit
  }); */
</script>

<script src="${path}/resources/js/Main.js"></script>
</body>
<%@ include file="../includes/footer.jsp"%>

</html>