<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>main.jsp</h1>
	<!-- 로그인 정보가 있을떄만 메인페이지를 사용가능 -->
	<%
	// 로그인 정보
	String id =(String)session.getAttribute("id"); // String 타입으로 형변환을 해야 사용 가능
	
	if(id == null){
		response.sendRedirect("loginForm.jsp");
	}
	%>
	
	
	로그인 아이디 : <%=session.getAttribute("id") %><br>
	
	<input type="button" value="로그아웃" onclick="location.href='logout.jsp';">
	
	<hr>
	
	<h3><a href="memberInfo.jsp">회원 정보 조회</a>></h3>
	
	<h3><a href="memberUpdate.jsp">회원 정보 수정</a>></h3>
	
</body>
</html>