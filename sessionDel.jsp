
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>session.Del</h1>
	<%
		// 세션정보 삭제 (서버)
		// => session 영역에서 공유되는 데이터를 삭제
		
		// point 세샨정보 삭제
		session.removeAttribute("point");
		
		System.out.println("포인트정보 삭제!");
	%>
	
	<script type="text/javascript">
	 alert("세션값 삭제 완료!")
	 location.href="sessionTest.jsp";
	 </script>
</body>
</html>