<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>logout.jsp</h1>
	
	<%
		// 로그아웃 => 세션정보 초기화
		session.invalidate();
	%>
	
	<script type="text/javascript">
		alert('로그아웃 성공!')
		location.href="main.jsp";
	</script>
	
	
	
</body>
</html>