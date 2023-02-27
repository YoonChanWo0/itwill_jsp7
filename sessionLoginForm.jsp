<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>sessionLoginForm.jsp</h1>
	
	<fieldset>
		<legend>ITWILL 로그인</legend>
		<!-- 사용자의 아이디, 비밀번호 정보를 입력.
			 sessionLoginPro.jsp 페이지로 입력받은 정보를 전달
		 -->
		<form action="sessionLoginPro.jsp" method="post">
		아이디 : <input type="text" name="id"><br>
		비밀번호 : <input type="password" name="pw"><br>
		
			<input type="submit" value="로그인">
		</form>
	
	
	
	
	
	
	</fieldset>
</body>
</html>