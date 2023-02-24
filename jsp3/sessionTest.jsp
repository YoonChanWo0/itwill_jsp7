<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h1>sessionTest.jsp</h1>
		
		<h2> 클라이언트 (고객) </h2>
		
		<%
			// 세션의 정보를 가져오기
			String point = (String)session.getAttribute("point");
		
		   if(point == null){
			   System.out.println(" 서버 안 다녀옴!, 커피안삼 ");
		   }else{
			   System.out.println(" 서버 다녀옴!, 커피삼 ");
		   }
		%>
		
		
		
		<input type="button" value="세션값 생성" 
		       onclick=" location.href='sessionSet.jsp'; "   >
		
		
		
		

</body>
</html>