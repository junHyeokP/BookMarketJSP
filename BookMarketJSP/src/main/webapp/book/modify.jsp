<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="Book.*"
	import="book_oracle.*"
    pageEncoding="UTF-8"%>
<%@ include file = "/common/isAdminLogged.jsp" %>    
<%
	String bookIdStr = request.getParameter("bookID");
	String name = request.getParameter("bookname");
	String author = request.getParameter("author");
	String publisher = request.getParameter("publisher");
	String priceStr = request.getParameter("price");

	if (bookIdStr == null) {
			response.sendRedirect("main.jsp");
	} 
	else if (name.isBlank() || author.isBlank() || publisher.isBlank() || priceStr.isBlank()) {
		response.sendRedirect("detailPage.jsp?no=" + bookIdStr);
	} else if (name == null || author == null || publisher == null || priceStr == null) {
		response.sendRedirect("detailPage.jsp?no=" + bookIdStr);
	} else {
	
	BookService service = new OracleBookService(new OracleBookDAO());
	Book book = service.read(Integer.parseInt(bookIdStr));
	
	int price = Integer.parseInt(priceStr);
	
	if (book == null) {
		response.sendRedirect("main.jsp");
	} else {
		
			 	book.setBookname(name);
			 	book.setAuthor(author);
			 	book.setPublisher(publisher);
			 	book.setPrice(price);
			 	 if (service.edit(book)) { 
					response.sendRedirect("main.jsp");
						} else {
							response.sendRedirect("modifyPage.jsp");
							}
					}	
			}
%>    
