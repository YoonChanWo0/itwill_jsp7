<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>cookieForm.jsp</h1>
	<%
	
		// 쿠키정보 가져오기
		Cookie[] cookies = request.getCookies();
		// 쿠키정보에 따른 메세지 출력하기
		String lang = ""; // 쿠키의 언어설정 정보를 저장
		// 쿠키명 - lang
		
		if(cookies != null){
			for(int i=0;i<cookies.length;i++){
				// 쿠키명 - lang인 쿠키정보 찾기
				if(cookies[i].getName().equals("lang")){
					// 쿠키 메세지 출력
					
					if(cookies[i].getValue().equals("kor")){
						out.print("한국어 : 안녕하세요! 쿠키연습입니다!<br>" );
// 						lang = cookies[i].getValue();
					}else{
						out.print("영어 : Hello! Cookieest!<br>" );
// 						lang = cookies[i].getValue();
					}
					lang = cookies[i].getValue();
				}
			}
		}
		
		
	%>
	
	
	
	
	<form action="cookiePro.jsp" method="get">
	<input type= "radio" name = "language" value="kor" 
	<%if(lang.equals("kor")) {%>
	checked="checked"
	<%} %>
	>한국어
	<input type= "radio" name = "language" value="eng" checked>영어
	<input type="submit" value="언어설정">
	</form>
	<!-- 언어 설정
		한국어 : "안녕하세요! 쿠키연습입니다!"
		영어 : "Hello! CookieTest!"
	 -->
</body>
</html>