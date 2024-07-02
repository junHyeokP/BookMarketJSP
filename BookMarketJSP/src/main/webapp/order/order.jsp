<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "cart.*"
    import = "Book.*"
    import = "book_oracle.*"
    import = "member.*"
    import = "member_oracle.*"
    import = "java.util.List"
    %>
<%@ include file = "/common/isLoggedIn.jsp" %>
<%
	CartService cartService = new OracleCartService(new OracleCartDAO());
	BookService bookService = new OracleBookService(new OracleBookDAO());
	MemberService memberService = new OracleMemberService(new OracleMemberDAO());
	
	List<CartItem> itemList = cartService.listAll(memberNo);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 주문</title>
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
  <%@ include file = "/common/header.jsp" %>
  <h2>주문하기</h2>
  <h3>주문할 도서 목록</h3>
 	 <table border = 2>
			<tr><th>책 번호</th><th>책 제목</th><th>가격</th><th>권수</th></tr>
			<% 
			int numItems = 0, totalPrice = 0, i = 0; 
			 for (CartItem item : itemList) {
					Book book = bookService.read(item.getBookID());
					numItems += item.getQuantity();
					totalPrice += book.getPrice() * item.getQuantity();
					i++;
			 %>
			 <tr>
				<td> <%= i %> </td>
				<td> <%= book.getBookname() %> </td>
				<td> <%= book.getPrice() * item.getQuantity() %> </td>
				<td> <%= item.getQuantity() %></td>
			</tr>	
			 <% } %>
			 
		</table>
		<table border = 3>
			<tr><th>총 가격</th><th>총 권수</th></tr>
			<td> <%= totalPrice %> </td>
			<td> <%= numItems %> </td>
		</table>
		<%
			Member member = memberService.read(memberNo);
		%>
		<h4>배송 정보</h4>
		이름 : <%= member.getNickname() %><br>
		<form action = "order.jsp" method="post">
			전화번호 : <input type = "text" value = "<%= member.getMobile() == null ? "" : member.getMobile() %>" placeholder = "010 - xxxx - xxxx"><br>
			이메일 :  <input type = "text" value = "<%= member.getEmail() == null ? "" : member.getEmail() %>"><br>
		</form>
</body>
</html>