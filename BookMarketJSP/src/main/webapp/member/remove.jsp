<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="member.*"
	import="member_oracle.*"
    pageEncoding="UTF-8"%>
<%
	String noStr = request.getParameter("no");
		if (noStr == null) {
				response.sendRedirect("main.jsp");
		} else {
				MemberService service = new OracleMemberService(new OracleMemberDAO());
				if (service.remove(Integer.parseInt(noStr))) {
						response.sendRedirect("main.jsp");
				} else {
						response.sendRedirect("detailPage.jsp?no=" + noStr);
				}
		}
%>    
