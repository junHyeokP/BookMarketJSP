<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="Book.*"
	import="book_oracle.*"
    pageEncoding="UTF-8"%>
    
 <%@ include file = "/common/isAdminLogged.jsp" %>   
 
<%	
	String bookID = request.getParameter("bookID");
	if (bookID == null) {
	response.sendRedirect("main.jsp");
	} else {
		BookService service = new OracleBookService(new OracleBookDAO());
		Book book = service.read(Integer.parseInt(bookID));
			if (book == null) {
				response.sendRedirect("main.jsp");
			} else {
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 정보 수정 페이지</title>
</head>
<body>
	<h2>책에서 원하는 정보를 수정하기</h2>
	<form action = "modify.jsp" method = "post">
	<input type = "hidden" name = "bookID" value = "<%= book.getBookID() %>" >
	<input type = "text" name = "bookname" value = <%= book.getBookname() %> placeholder = "책 이름 수정"> <br>
	<input type = "text" name = "author" value = <%= book.getAuthor() %> placeholder = "책 저자 이름 수정"> <br>
	<input type = "text" name = "publisher" value = <%= book.getPublisher() %> placeholder = "출판사 이름 수정"> <br>
	<input type = "text" name = "price" value = <%= book.getPrice() %> placeholder = "책 가격 수정"> <br>
	
	<br>
	<input type = "submit" value = "책 정보 수정">
	<a href = "detailPage.jsp?bookID=<%= book.getBookID() %>"><input type = "button" value = "돌아가기"></a>
	</form>
</body>
</html>
	<% }
	} %>