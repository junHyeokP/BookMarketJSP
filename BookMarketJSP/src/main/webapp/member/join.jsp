<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="member.*"
	import="member_oracle.*"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("password");
	String nickname = request.getParameter("nickname");
	
	if (id == null || pwd == null || nickname == null) { // request parameter 자체가 없는 경우
		response.sendRedirect(request.getContextPath()+ "/common/errorPage.jsp?=joinError=1");
	
	} else if (id.isEmpty() || pwd.isEmpty() || nickname.isEmpty()){ // request parameter는 있는데 값이 빈 경우
		
		response.sendRedirect(request.getContextPath() + "/member/joinPage.jsp?joinError=1");
	
	} else {	
		MemberService service = new OracleMemberService(new OracleMemberDAO());
		Member member = new Member(id, pwd, nickname);
			if (service.regist(member)) {
					response.sendRedirect(request.getContextPath() + "/member/loginPage.jsp");
			} else {
					response.sendRedirect(request.getContextPath() + "/common/errorPage.jsp?joinError=2");
			}
	}
%>