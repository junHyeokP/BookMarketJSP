<%@ page language="java" contentType="text/html; charset=UTF-8"
	import = "cart.*"
    pageEncoding="UTF-8"%>
    <%@ include file = "/common/isLoggedIn.jsp" %>
<%

	//CartService service = new OracleCartService(new OracleCartDAO());
	//CartService service = new OracleCartService(new HashMapCartDAO());
	CartService service = new OracleCartService(HashMapCartDAO.getInstance());


	String bookIdStr = request.getParameter("bookID");
	
	if (bookIdStr == null || bookIdStr.isEmpty()) {
		response.sendRedirect(request.getContextPath() + "/common/errorPage.jsp?bookIdErr=1");
		return;
	}
	
	if (service.add(new CartItem(memberNo, Integer.parseInt(bookIdStr), 1))) {
		response.sendRedirect(request.getContextPath() + "/cart/main.jsp");
		
	} else {
		response.sendRedirect(request.getContextPath() + "/common/errorPage.jsp?bookIdErr=1");
	}
	
%>   