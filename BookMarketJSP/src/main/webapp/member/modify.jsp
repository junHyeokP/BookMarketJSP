<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="member.*"
	import="member_oracle.*"
    pageEncoding="UTF-8"%>
 <%
 	
 	String noStr = request.getParameter("no");
	String oldpwd = request.getParameter("old_password");
	String newpwd = request.getParameter("new_password");
	String nickname = request.getParameter("nickname");
	
		if (noStr == null) {
			response.sendRedirect("main.jsp");
		}
		else if (oldpwd == null || newpwd == null || nickname == null) {
			response.sendRedirect("detailPage.jsp?no=" + noStr);
		} else {
				MemberService service = new OracleMemberService(new OracleMemberDAO());
				Member member = new Member(null, newpwd, nickname);
				member.setNo(Integer.parseInt(noStr));
				if (service.edit(member, oldpwd)) {
					response.sendRedirect("main.jsp");
				} else {
				response.sendRedirect("modifyPage.jsp?no=" + noStr);
				}
		}
 %>   