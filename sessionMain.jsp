<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h1>sessionMain.jsp</h1>
	
	<%
		// 로그인 정보가 없을경우 사용x
		// => 로그인페이지 이동
		
		String id = (String)session.getAttribute("id");
	
		if(id == null){
			response.sendRedirect("sessionLoginForm.jsp");
		}
	%>
	
	<h2><%=id %>님 환영합니다!</h2>
	
	<input type= "button" value="로그아웃"
	onclick=" location.href='sessionLogout.jsp' ">
</body>
</html>