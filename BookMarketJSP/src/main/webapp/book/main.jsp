<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="Book.*"
    import="book_oracle.*"
    import="java.util.List"
    pageEncoding="UTF-8"%>
    
<%@ include file = "/common/isAdminLogged.jsp" %> 
   
<%!
	BookService service = new OracleBookService(new OracleBookDAO());
	List<Book> bookList = service.listAll();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 관리 메인 페이지</title>
</head>
<body>
 <%@ include file = "/common/header.jsp" %>
		<h1>도서 관리 메인 페이지</h1>
		<a href = "registPage.jsp"><button>도서 등록하기</button></a>	
		<h3>도서 목록 </h3>
		<% if (bookList.size() == 0) { %>
			<p>등록된 책이 존재하지 않습니다.</p>
		<% } else { %>
		
		<table border = 2>
			<tr><th>책 번호</th><th>책 제목</th><th>저자</th><th>출판사</th><th>가격</th>
			<% for (Book book : bookList) { %>
			<tr>
				<td> <%= book.getBookID() %></td>
				<td> <a href = "detailPage.jsp?bookID=<%= book.getBookID() %>"><%= book.getBookname() %></a> </td>
				<td> <%= book.getAuthor() %> </td>
				<td> <%= book.getPublisher() %></td>
				<td> <%= book.getPrice() %> </td>
			</tr>	
			<% } %>
		</table>
	<% } %>
</body>
</html>