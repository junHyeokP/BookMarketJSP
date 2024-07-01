<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="Book.*"
	import="book_oracle.*"
    pageEncoding="UTF-8"%> 
 <%
 	String bookID = request.getParameter("bookID");
 	if (bookID == null || bookID.isEmpty()) {
 		response.sendRedirect(request.getContextPath() + "/common/errorPage.jsp?idError=1");
 	} else {
 	BookService service = new OracleBookService(new OracleBookDAO());
 	Book book = service.read(Integer.parseInt(bookID));
 	
 %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 상세정보 페이지</title>
</head>
<body>
	<%@ include file = "/common/header.jsp" %>
	<h1>책 상세정보</h1>
	<%if (book == null) {%>
		<p>해당 책에 대한 정보가 없습니다.</p>
	<% } else { %>
	 <ul>
	 	<li>책 번호 : <%= book.getBookID() %></li>
	 	<li>책 이름 : <%= book.getBookname() %></li>
	 	<li>책 저자 : <%= book.getAuthor() %></li>
	 	<li>책 출판사 : <%= book.getPublisher() %></li>
	 	<li>책 가격 : <%= book.getPrice() %></li>
	 </ul>
	 <br>
	 
	 <%
	 if (session.getAttribute("adminID") != null) { %>
	
	 <a href = "modifyPage.jsp?bookID=<%= book.getBookID() %>"><button>책 정보 수정</button></a>
	 <a href = "removePage.jsp?bookID=<%= book.getBookID() %>"><button>책 정보 삭제</button></a>
	 	
	 		<% } else if (session.getAttribute("MemberID") != null) { %>
	 		
	 				<a href = "<%= request.getContextPath() %>/cart/add.jsp?bookID=<%= book.getBookID()%>"><button>장바구니 담기</button></a>
	 			<% } %>
	 			
	 		<a href = "<%= request.getContextPath() %>/index.jsp"><button>도서 목록</button></a>
	 <% } %>
	  <%@ include file = "/common/footer.jsp" %>
</body>
</html>
<% } %>