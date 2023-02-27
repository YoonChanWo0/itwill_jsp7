<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>cookieSet.jsp</h1>
	
	<h2>서버</h2>
	
	<%
		//쿠키값 생성
		// => 쿠폰 생성만, 클라이언트의 메모리, HDD 저장x
		Cookie cookie = new Cookie("name", "itwill");
	
		// 유효기간 설정
		cookie.setMaxAge(600); // 600초 => 10분
		
		// 쿠키정보를 저장 + 전달
		response.addCookie(cookie);
	%>
	
	<script type="text/javascript">
		alert("쿠키값 생성!");
		location.href="cookieTest.jsp";
	</script>
</body>
</html>