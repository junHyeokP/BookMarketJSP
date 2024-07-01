<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<%@ include file = "/common/header.jsp" %>
	<h2>로그인</h2>
	<%
		if (request.getParameter("loginError") != null) {
			out.print("잘못된 입력입니다, 다시 시도하세요.");
		}  // if문 블럭에 html 태그를 넣는 방식
	%>	
	
	<form action = "login.jsp" method = "post">
		<input type = "text" name = "id" placeholder = "아이디 입력"> <br>
		<input type = "text" name = "password" placeholder = "비밀번호 입력"> <br>
		<input type = "submit" value = "로그인">
	</form>
	<%@ include file = "/common/footer.jsp" %>
</body>
</html>