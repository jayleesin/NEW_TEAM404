<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kim 데이터 출력</title>
</head>
<body>
<%--     <h1>Kim 데이터 목록</h1>
    <table>
        <tr>
            <th>REVIEW_NO</th>
            <th>BOARD_NO</th>
            <th>REPLY</th>
            <th>REGDATE</th>
            <th>UPDATEDATE</th>
            <th>MEMBER_ID</th>
        </tr>
        <c:forEach var="review" items="${list}">
            <tr>
                <td>${review.reviewNo}</td>
                <td>${review.boardNo}</td>
                <td>${review.reply}</td>
                <td>${review.regDate}</td>
                <td>${review.UPDATEDATE}</td>
                <td>${review.memberId}</td>
            </tr>
        </c:forEach>
    </table> --%>
        <h1>Kim 데이터 입력</h1>
<form action="insert" method="get" role="form">
	<label for="member_Id">아이디</label> 
	<input id="member_Id" name="member_Id"> 
	<label for="password">비번</label>
	<input id="password" name="password"> 
	<label for="role">role</label> 
	<input id="role" name="role"> 
	<label for="name">이름</label> 
	<input id="name" name="name">
	<label for="address">주소</label> 
	<input id="address" name="address">
	<button type="submit">Submit</button>
</form>
</body>
</html>
