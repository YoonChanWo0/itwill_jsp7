<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h1>scopePro.jsp</h1>
		
	<%
		// 사용자가 입력한 ID정보 출력 
		String id = request.getParameter("id");
	
		// 영역객체에 데이터를 저장
		pageContext.setAttribute("p", "pageScope Value!");
		request.setAttribute("r", "requestScope Value!");
		//session.setAttribute("s", "sessionScope Value!");
		application.setAttribute("a", "applicationScope Value!");
	
	%>	
	아이디 : <%=id %><hr>
	
	pageContext 내장객체 값 : <%=pageContext.getAttribute("p") %><br>
	request 내장객체 값 : <%=request.getAttribute("r") %><br>
	session 내장객체 값 : <%=session.getAttribute("s") %><br>
	application 내장객체 값 : <%=application.getAttribute("a") %><br>
	
	<hr>
	
	<h2> 페이지 이동 </h2>
	
	<h2> HTML - a태그 : 파라메터,session,application </h2>
	<a href="scopeAction.jsp?id=<%=id%>&pw=1234">scopeAction.jsp 페이지로 이동</a>
	
	<h2> JS - location객체 : 파라메터,session,application </h2>
	<script type="text/javascript">
// 		alert("js 페이지 이동!");
<%-- 		location.href="scopeAction.jsp?id=<%=id%>&pw=1234";	 --%>
	</script>
	
	<h2> JSP - response객체 : 파라메터,session,application </h2>
	<%
		// JSP페이지 = HTML + JS + JSP(java)
		//            1) JSP(java)
		//			  2) HTML
		//            3) JS
        // *  JSP,JS 페이지 이동은 둘중에 하나만 사용
	
		System.out.println("JSP 페이지이동 - 시작!");
// 		response.sendRedirect("scopeAction.jsp?id="+id+"&pw=1234");
		System.out.println("JSP 페이지이동 - 끝!");
	%>
	
	
	<h2> 액션태그 - forward : 파라메터,request,session,application </h2>
	<!-- 
	    포워딩 : 1) request 영역의 데이터를 사용가능 
	    		 2) 주소변경 X, 화면 변경 O
	 -->
	<%-- 	<%  pageContext.forward(relativeUrlPath) %>     --%>
	<%
// 			RequestDispatcher dis 
// 			         = request.getRequestDispatcher(path);
// 			dis.forward(request, response);
	%>
	<jsp:forward page="scopeAction.jsp" />
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
</body>
</html>