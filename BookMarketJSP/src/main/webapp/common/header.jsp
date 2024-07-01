<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   	<a href="<%= request.getContextPath()%>/index.jsp"><button>Home</button></a>

	<% if (session.getAttribute("MemberID") != null) {%>
	
	<a href="<%= request.getContextPath()%>/member/logout.jsp"><button>로그아웃</button></a>
	<a href="<%= request.getContextPath()%>/member/detailPage.jsp?no=<%= (Integer)session.getAttribute("MemberNo") %>"><button>my Page</button></a>
	<a href="<%= request.getContextPath()%>/cart/main.jsp"><button>장바구니</button></a>
				
		<% } else if (session.getAttribute("adminID") != null) { %>	
		
			<a href="<%= request.getContextPath()%>/admin/main.jsp"><button>관리자 Home</button></a>
			<a href="<%= request.getContextPath()%>/member/logout.jsp"><button>로그아웃</button></a>
			
			<% } else { %>	
			
				<a href="<%= request.getContextPath()%>/member/loginPage.jsp"><button>로그인</button></a>
				<a href="<%= request.getContextPath()%>/member/joinPage.jsp"><button>회원가입</button></a>
	<% } %>
	
	<h1>온라인 서점</h1>
	<hr>