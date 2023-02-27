<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>sessionInv.jsp</h1>
	<%
		// 세션정보 초기화 (서버)
		session.invalidate();
	    System.out.println("세션 정보 초기화!");
	
	    response.sendRedirect("sessionTest.jsp");
	%>
	
	<script type="text/javascript">
	alert("세션 정보 초기화!");
	location.href="sessionTest.jsp";
	</script>
	
	
	
	
	
</body>
</html>