<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file = "/common/isAdminLogged.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 등록 페이지</title>
</head>
<body>
	<h3>도서 등록</h3>
	<%@ include file = "/common/header.jsp" %>
	<form action = "regist.jsp" method = "post">
			<input type = "text" name = "name" 		placeholder = "이름을 입력하세요"> <br>
			<input type = "text" name = "author" 	placeholder = "책 저자의 이름을 입력하세요"> <br>
			<input type = "text" name = "publisher" placeholder = "출판사 이름을 입력하세요"> <br>
			<input type = "text" name = "price" 	placeholder = "가격을 입력하세요"> <br>
			<br>
			<input type ="submit" value = "도서 등록">
			<a href = "main.jsp"><input type = "button" value="취소"></a> 
	</form>
	<%@ include file = "/common/footer.jsp" %>
	<script>
	
	function validateForm() {
		const price = document.querySelector('input[name="price"]').value;
		if (price <= 0) {
			alert("책 가격은 0보다 큰 금액을 입력해야 합니다.")
			return false;
		}
		if (document.querySelector('input[name="price"]').value != 0) {
			alert("도서 재고량은 0보다 커야 합니다.")
			return false;
		}
	}
			const price = function validation.query("price");
	</script>
	
</body>
</html>