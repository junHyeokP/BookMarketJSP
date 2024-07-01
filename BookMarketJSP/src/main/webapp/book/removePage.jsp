<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="Book.*"
	import="book_oracle.*"
    pageEncoding="UTF-8"%>
<%@ include file = "/common/isAdminLogged.jsp" %>    
<%
	String bookIDStr = request.getParameter("bookID");
		if (bookIDStr == null) {
			response.sendRedirect("detailPage.jsp");
			
			} else {
				
				BookService service = new OracleBookService(new OracleBookDAO());
				Book book = service.read(Integer.parseInt(bookIDStr));
				
				
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 정보 삭제 페이지</title>
</head>
<body>
	<h2>책 정보 삭제</h2>
	<% if (book == null) { %>
	<p>도서 정보가 없습니다.</p>
	<% } else { %>
	<ul>
		<li>책 번호 : <%= book.getBookID() %></li>
	 	<li>책 이름 : <%= book.getBookname() %></li>
	 	<li>책 저자 : <%= book.getAuthor() %></li>
	 	<li>책 출판사 : <%= book.getPublisher() %></li>
	 	<li>책 가격 : <%= book.getPrice() %></li>
	</ul>
	<br>
	
	도서 정보를 삭제하시겠습니까?
	<a href = "remove.jsp?bookID=<%= book.getBookID() %>"><button>삭제</button></a>
	<a href = "detailPage.jsp?bookID=<%= book.getBookID() %>"><button>취소</button></a>
	<% } %>
</body>
</html>
<% } %>