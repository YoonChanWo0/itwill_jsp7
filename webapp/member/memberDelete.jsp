<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<%
	 	   // 로그인 제어
		    String id = (String) session.getAttribute("id");
		
			if(id == null){
				response.sendRedirect("loginForm.jsp?oldURL="+request.getRequestURL());
			}
		%>

		<h1>memberDelete.jsp</h1>
		<h2> 회원정보 삭제(탈퇴) </h2>
		
		<fieldset>
		    <form action="./MemberDeleteAction.me" method="post">
		      <input type="hidden" name="id" value="<%=id%>">
		      비밀번호 : <input type="text" name="pw"> <br>
		      <input type="submit" value="탈퇴하기">
		    </form>	
		</fieldset>
		
		
		
		

</body>
</html>