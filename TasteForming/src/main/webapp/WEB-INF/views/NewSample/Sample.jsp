<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/NewSample/register" method="get" role="form">
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