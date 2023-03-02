<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>cookiePro.jsp</h1>
	<%
		// 쿠키생성 - 라디오버튼에서 선택한 언어정보
		Cookie cookie 
		= new Cookie("lang",request.getParameter("language"));
		
		// 쿠키 사용 설정(유효기간)
		cookie.setMaxAge(60*60); // 1시간
		
		// 클라이언트쪽으로 쿠키정보 전달
		response.addCookie(cookie);
	%>
	
	<script type="text/javascript">
	alert("언어 쿠키정보 생성!");
	location.href="cookieForm.jsp";
	
	</script>
	
	
</body>
</html>