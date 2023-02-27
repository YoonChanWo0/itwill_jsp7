<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>cookieDel.jsp</h1>
	
	<h2>쿠키정보 삭제 (서버)</h2>
	
	<%
	  // 쿠키값 가져오기
	  Cookie[] cookies = request.getCookies();
	
	  if(cookies != null){
		  for(int i=0;i<cookies.length;i++){
			  // 해당쿠키만 검색
			  if(cookies[i].getName().equals("name")){
				 
				  // 쿠키값 삭제
				  cookies[i].setMaxAge(0); // 쿠키 유효기간 만료(삭제)
				  
				  // 클라이언트 변경된 정보를 저장해서 전달
				  response.addCookie(cookies[i]);
			  }
		  }
	  }
	%>
	
	<script type="text/javascript">
	  alert("쿠키값 삭제완료!");
	  location.href="cookieTest.jsp";
	</script>
</body>
</html>