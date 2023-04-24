<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ page session="false" %>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${path}/resources/css/Main.css" rel="stylesheet"/> 	
    <link rel="stylesheet" href="${path }/resources/css/reset.css">
    <link href="https://hangeul.pstatic.net/hangeul_static/css/NanumGoRyeoGeurGgor.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />

    <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>


    <title>TasteForming</title>
</head>

<body>
    <header>
        <div class="container header">
            <a href="Main.jsp"><img src="${path}/resources/img/TasteFormingLogo.png" alt="TasteFormingLogo" width="150px"></a>

            <form class="search-container" action="Search">
                <input type="text" name="search" class="search-box" placeholder="지역, 음식 또는 식당명 입력">
            </form>

            <div class="sign">
                <a href="#">로그인</a>
                <a href="#">회원가입</a>
            </div>
        </div>

        <nav class="nav">
            <div class="menu_list">
                <a href="">식당신청</a>
                <a href="">식당관리</a>
                <a href="">마이페이지</a>
            </div>
        </nav>
    </header>

    <div class="header_bg">
        <div class="place_modal">
            <p>당신을 위한 서울 맛집 서비스</p>
            <a href="" class="modal_button">
                <p>다른 지역 선택</p>
            </a>
            <div class="modal">
                모달창
            </div>

        </div>
        <p class="res_name">레스토랑 이름</p>
    </div>



    <main class="main_box">
        <div class="box">
            <div class="sub-box">
                <div class="type">
                    <p>#노포(갯수)</p>
                </div>
                <div class="my-slider swiper-container">
                    <ul class="swiper-wrapper">
                        <li class="swiper-slide">
                            <a href="">
                                <img src="${path }/resources/img/탕수육.jpg" alt="">
                                <div class="info_box">
                                    <p>맛있는 탕수육</p>
                                    <p>주소시 주소동 주소로</p>
                                    <hr>
                                    <p>가게정보 : </p>
                                    <p>평점 : 블라블라</p>
                                </div>
                                <div class="star">
                                    <img src="${path }/resources/img/star.png" alt="">
                                    <p>3.9</p>
                                </div>
                            </a>
                            <p>탕수육</p>
                        </li>
                        <li class="swiper-slide">
                            <a href="">
                                <img src="${path }/resources/img/header_bg.png" alt="">
                                <p>탕수육</p>
                            </a>
                        </li>
                        <li class="swiper-slide">
                            <a href="">
                                <img src="${path }/resources/img/탕수육.jpg" alt="">
                                <p>탕수육</p>
                            </a>
                        </li>
                        <li class="swiper-slide">
                            <a href="">
                                <img src="${path }/resources/img/TasteFormingLogo.png" alt="">
                                <p>탕수육</p>
                            </a>
                        </li>
                        <li class="swiper-slide">
                            <a href="">
                                <img src="${path }/resources/img/탕수육.jpg" alt="">
                            </a>
                            <p>탕수육</p>
                        </li>
                        <li class="swiper-slide">
                            <a href="">
                                <img src="${path }/resources/img/header_bg.png" alt="">
                                <p>탕수육</p>
                            </a>
                        </li>
                        <li class="swiper-slide">
                            <a href="">
                                <img src="${path }/resources/img/탕수육.jpg" alt="">
                                <p>탕수육</p>
                            </a>
                        </li>
                        <li class="swiper-slide">
                            <a href="">
                                <img src="${path }/resources/img/TasteFormingLogo.png" alt="">
                                <p>탕수육</p>
                            </a>
                        </li>

                    </ul>

                    <div class="swiper-button-prev"></div>
                    <div class="swiper-button-next"></div>
                </div>
            </div>
        </div>
    </main>
    
    <footer class="footer">
        <div class="container">
            <p>TasteForming</p>
            <p>Team_name : 404</p>
            <p>Member : 김정우, 정경안, 정혜림, 김현우, 강경모</p>

            <address>Copyright@2023 Team 404</address>
        </div>
    </footer>



<script src="${path}/resources/js/Main.js"></script>
</body>

</html>