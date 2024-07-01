<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  if (session.getAttribute("MemberID") != null) {
	  
	session.removeAttribute("MemberID");
	session.removeAttribute("MemberName");
	session.removeAttribute("MemberNo");
	
	  } else if (session.getAttribute("adminID") != null) {
		  
		  session.removeAttribute("adminID");
		  session.removeAttribute("adminPwd");
		  
  		}
	response.sendRedirect(request.getContextPath() + "/index.jsp");
%>
