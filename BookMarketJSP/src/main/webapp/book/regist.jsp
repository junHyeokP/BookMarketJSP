<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="Book.*"
	import="book_oracle.*"
    pageEncoding="UTF-8"%>
<%
	
	String name = request.getParameter("name");
	String author = request.getParameter("author");
	String publisher = request.getParameter("publisher");
	String tempPrice = request.getParameter("price");
	String instockStr = request.getParameter("instock");
	
	 if (name == null || author == null || publisher == null || tempPrice == null || instockStr.isEmpty()) { 
		
		response.sendRedirect("registPage.jsp");
		
	} else if (name.isEmpty() || author.isEmpty() || publisher.isEmpty() || tempPrice.isEmpty() || instockStr.isEmpty()) {
		response.sendRedirect("registPage.jsp");
	}
	else {
		out.print(tempPrice);
		
		int price = Integer.parseInt(tempPrice);
		
		BookService service = new OracleBookService(new OracleBookDAO());
		
		Book book = new Book(name, author, publisher, price, Integer.parseInt(instockStr));
		
		if (service.add(book)) { 
			
			response.sendRedirect("main.jsp");
		
		} else { 
			
			response.sendRedirect("registPage.jsp"); 
			
			 }
			}  %>
