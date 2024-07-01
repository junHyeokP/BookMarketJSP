<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="cart.*"
    pageEncoding="UTF-8"%>
    <%@ include file = "/common/isLoggedIn.jsp" %>
<%
	CartService cartService = new OracleCartService(new OracleCartDAO());
	
	if (cartService.clear(memberNo)) {
			response.sendRedirect(request.getContextPath() + "/cart/main.jsp");
	} else {
			response.sendRedirect(request.getContextPath() + "/common/errorPage.jsp?cartClearErr=1");
	}
%>
	