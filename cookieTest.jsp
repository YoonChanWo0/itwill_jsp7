<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>cookieTest.jsp</h1>
	<%
		// 쿠키 : 서버와 클라이언트의 상태를 저장하는 정보
		//		  상태정보를 클라이언트의 HDD에 저장
	
		// 이름, 값, 유효기간, 도메인, 경로 ... 형태로 구성됨
		// 쿠키이름(알파벳,숫자 조합)
		
		// 쿠키 생성 (쿠폰생성) - 서블릿 API(필요한 기능을 한곳에 모아놓은것)
		
		// Cookie cookie = new Cookie(이름,값);
			
		%>
		
		
		<%
			// 생성된 쿠키값 (정보) 가져오기
			
			Cookie[] cookies = request.getCookies();
		
		// 배열에 들어있는 이름이 내가만든 쿠키인지 체크
		
		if(cookies != null){
			for(int i=0;i<cookies.length;i++){
				if(cookies[i].getName().equals("name")){
					// 내가만든 쿠키가 있다.
					out.print("내가만든 쿠키명 :"+cookies[i].getName()+"<br>");
					out.print("내가만든 쿠키값 :"+cookies[i].getValue()+"<br>");
				}
			}
		}
		
		
		
		%>
		
		
		
		
		
		
		<h2>클라이언트</h2>
		
		<input type="button" value="쿠키값 생성"
		 onclick="location.href='cookieSet.jsp'"> <br>
		
		<input type="button" value="쿠키값 삭제"
		 onclick="location.href='cookieDel.jsp'"> <br>
		
		
		
		
		
		
	
</body>
</html>