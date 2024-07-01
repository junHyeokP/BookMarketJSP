<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="cart.*"
    pageEncoding="UTF-8"%>
     <%@ include file = "/common/isLoggedIn.jsp" %>
<%
	
	String idStr = request.getParameter("id");
	String quanStr = request.getParameter("quantity");
	
	if (idStr == null || idStr.isEmpty() || quanStr == null || quanStr.isEmpty()) {
				response.sendRedirect(request.getContextPath() + "/commom/errorPage.jsp?cartUpdateErr=1");
				return;
	} 
	
	CartService cartService = new OracleCartService(new OracleCartDAO());
		
		if (cartService.update(Integer.parseInt(idStr), memberNo, Integer.parseInt(quanStr))) {
				response.sendRedirect(request.getContextPath() + "/cart/main.jsp");
				System.out.println("책 수정 성공");
		} else {
				response.sendRedirect(request.getContextPath() + "/common/errorPage.jsp?cartUpdateErr=2");
				}
	
%>    