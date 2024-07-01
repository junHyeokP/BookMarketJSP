<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="member.*"
	import="member_oracle.*"
    pageEncoding="UTF-8"%>
<%
	String userID = request.getParameter("id");
	String userPwd = request.getParameter("password");
	
	if (userID == null || userPwd == null) {
		response.sendRedirect(request.getContextPath() + "/common/errorPage.jsp?loginError=1");
		return;
	} 
	
	if (userID.isEmpty() || userPwd.isEmpty()){
		response.sendRedirect(request.getContextPath() + "/member/loginPage.jsp?loginError=1");
		return;
	}
	
	final String adminID = "admin";
	final String adminPwd = "7736";
	
	if (userID.equals(adminID) && userPwd.equals(adminPwd)) {
		session.setAttribute("adminID", adminID);
		session.setAttribute("adminPwd", adminPwd);
		response.sendRedirect(request.getContextPath() + "/admin/main.jsp");
		
	} else {
	
			MemberService service = new OracleMemberService(new OracleMemberDAO());
			Member member = service.login(userID, userPwd);
	
			if (member != null) {
				//로그인 성공
				session.setAttribute("MemberID", member.getId());
				session.setAttribute("MemberName", member.getNickname());
				session.setAttribute("MemberNo", member.getNo());
				response.sendRedirect(request.getContextPath() + "/index.jsp");
			} else {
				response.sendRedirect(request.getContextPath() + "/member/loginPage.jsp?loginError=1");
	}
}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>6</title>
</head>
<body>
	미구현
</body>
</html>