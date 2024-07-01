<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="Book.*"
	import="book_oracle.*"
    pageEncoding="UTF-8"%>
   <%@ include file = "/common/isAdminLogged.jsp" %> 
<% 
	String bookID = request.getParameter("bookID");
	
	if (bookID == null || bookID.isEmpty()) {
		response.sendRedirect(request.getContextPath() + "/common/errorPage.jsp?removeError=1");
			} else {
				BookService service = new OracleBookService(new OracleBookDAO());
				if (service.remove(Integer.parseInt(bookID))) {
					response.sendRedirect("main.jsp");
				} else {
					response.sendRedirect("detailPage.jsp?bookID=" + bookID);
				}
			}
%>