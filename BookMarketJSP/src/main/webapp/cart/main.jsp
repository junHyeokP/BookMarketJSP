<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="cart.*"
    import="Book.*"
    import="book_oracle.*"
    import="java.util.List"
    pageEncoding="UTF-8"%>
     <%@ include file = "/common/isLoggedIn.jsp" %>
<%
	// CartService cartService = new OracleCartService(new ListCartDAO());
	CartService cartService = new OracleCartService(new OracleCartDAO());
	List<CartItem> itemList = cartService.listAll(memberNo);	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<style>
	input[type="number"] {
		width : 2.5em;
	}
	form {
		display : inline;
	}
	table {
		border-collapse : collapsed;
		
	}
	td {
		text-align : center;
		padding : 5px;
	}
</style>
</head>
<body>
<%@ include file = "/common/header.jsp" %>
<h3>장바구니</h3>
<% if (itemList.size() == 0) { %>
		장바구니가 비어있습니다.
<% } else { 
			BookService bookService = new OracleBookService(new OracleBookDAO());
%>
	<table border = 2>
		<tr><th>책 아이디</th><th>제목</th><th>저자</th><th>출판사</th><th>가격</th><th>수량</th></tr>
		<%  
			int totalBookNum = 0, totalPrice = 0;
			
			for (CartItem item : itemList) { 
				Book book = bookService.read(item.getBookID()); 
				totalBookNum += item.getQuantity(); 
				totalPrice += book.getPrice() * item.getQuantity();
			%>
			
		<tr><td><%= item.getBookID() %></td><td><%= book.getBookname() %></td><td><%= book.getAuthor() %></td>
		<td><%= book.getPublisher() %></td><td><%= String.format("%,d", book.getPrice()) %>원</td>
		<td>
			<form action="update.jsp" method = "post" onsubmit="return isValidForm()">
						<input type = "hidden" name = "id" value="<%= item.getId() %>">
						<input type = "number" name="quantity" value="<%= item.getQuantity() %>">
						<input type = "submit" value = "수정">
			</form>
					<button onclick="askConfirmRemove(<%= item.getId() %>)">삭제</button>
			</td>
		</tr>
		
		<% } %>
	</table>
	<br>
	<p>총 상품가격 : <%= String.format("%,d", totalPrice) %>원 (총 <%= totalBookNum %>권)</p>
	
			<button onclick="askConfirmOrder()">주문하기</button>
			<button onclick="askConfirmClear()">장바구니 비우기</button>
	
<% } %>

<%@ include file = "/common/footer.jsp" %>
<script>
	function askConfirmOrder() {
		if(confirm("장바구니의 모든 도서를 주문합니다.")) {
			location = "<%= request.getContextPath() %>/order/orderPage.jsp"
		}
	}
	
	function askConfirmClear() {
		if(confirm("장바구니의 모든 도서를 삭제합니다.")) {
			location = "<%= request.getContextPath()%>/cart/clear.jsp"
		}
	}
	
	function askConfirmRemove(cartId) {
		if(confirm(cartId + "번 도서를 삭제하시겠습니까?")) {
			location = "<%= request.getContextPath() %>/cart/remove.jsp?id=" + cartId;
		}
	}
	
</script>

</body>
</html>