<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h1>scopeForm.jsp</h1>
		<!-- p209 -->

		<%
		  /**
		     영역 객체 (scope) : 일정 범위에서 데이터를 공유하는 객체
		     속성 (attribute) : 영역객체에서 공유되는 데이터
		     
		     
		     영역
		     page : 한페이지 (서블릿-jspService() 메서드 실행되는 동안)
		     request : 클라이언트의 요청이 처리되는 동안 (액션태그 include시)
		     session : 세션이 유지되는 동안(웹 브라우저당 1개)
		     application : 애플리케이션이 실행되는 동안(서버 실행)
		     
		     영역객체
		     page 영역 => pageContext 객체
		     request 영역 => request 객체
		     session 영역 => session 객체
		     application 영역 => application 객체
		     
		     
		     [영역객체].setAttribute("속성명",값);		     
		     [영역객체].getAttribute("속성명");		     
		     [영역객체].removeAttribute("속성명");		     
		  */	
		  session.setAttribute("s", "sessionScope Value!");
		%>
		
		<form action="scopePro.jsp" method="get">
			아이디 : <input type="text" name="id"><br>
			<input type="submit" value="전송">			
		</form>
				
		
		
		
		
		
		
		
		
		
		
		
		
</body>
</html>