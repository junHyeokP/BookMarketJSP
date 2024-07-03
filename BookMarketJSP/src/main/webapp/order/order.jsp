<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "member.*"
    import = "member_oracle.*"
    import = "cart.*"
    %>
<%@ include file = "/common/isLoggedIn.jsp" %>    
<%
	
	String mobile = request.getParameter("mobile");
	String email = request.getParameter("email");
	String address = request.getParameter("address");
	
	if (mobile == null || email == null || address == null) {
		response.sendRedirect(request.getContextPath() + "common/errorPage.jsp?orderError=1");
		return;
	}
	if (mobile.isEmpty() || email.isEmpty() || address.isEmpty()) {
		response.sendRedirect("orderPage.jsp");
		return;
	} 
	
	//회원 정보 수정
	if (request.getParameter("modifyMember") != null) {	
		MemberService mservice = new OracleMemberService(new OracleMemberDAO());
		mservice.editAdditionalInfo(memberNo, mobile, email, address);
	}

	// Cart에서 주문 아이템 삭제
	
	CartService cartService = new OracleCartService(new OracleCartDAO());
	cartService.clear(memberNo);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	order.jsp이다
	<%= request.getParameter("mobile") %>
</body>
</html>