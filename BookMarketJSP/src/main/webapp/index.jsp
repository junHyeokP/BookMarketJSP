<%@ page language="java" contentType="text/html; charset=UTF-8"
	import = "Book.*"
	import = "book_oracle.*"
	import = "java.util.List"
    pageEncoding="UTF-8"%>
<%
	BookService service = new OracleBookService(new OracleBookDAO());
	List<Book> bookList = service.listAll(); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reading is kinda boring honestly</title>

<style>
		table {
			border-collapse : collapse;
			text-align : center
		}
		td {
			padding : 5px;
		}
</style>
</head>
<body>
	
	<%@ include file = "common/header.jsp" %>
	
	<h3>도서목록</h3>
		<% if (bookList.size() == 0) { %>
			<p>등록된 책이 존재하지 않습니다.</p>
		<% } else { %>
				<table border = 1>
					<tr><th>책 번호</th><th>책 이름</th><th>저자</th><th>출판사</th><th>가격</th>
						<% for (Book book : bookList) { %>
					<tr>
						<td> <%= book.getBookID() %></td>
						<td> <a href = "<%= request.getContextPath()%>/book/detailPage.jsp?bookID=<%= book.getBookID() %>"> <%= book.getBookname() %></a></td>
						<td> <%= book.getAuthor() %> </td>
						<td> <%= book.getPublisher() %></td>
						<td> <%= String.format("%,d", book.getPrice()) %>원 </td>
					</tr>	
			<% } %>
		</table>
	<% } %>
	
	<%@ include file = "common/footer.jsp" %>
	
</body>
</html>