<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="color.jspf" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	//String myColor ="green";
%>
<body bgcolor=<%=col4 %>>
	<h1>main.jsp</h1>
	
	
	<table border="1" width="600" height="600">
	<tr>
		<td colspan="2">
		<h1>top - header : 로고이미지,메뉴,검색창,...</h1>
		<jsp:include page="top.jsp"></jsp:include>
	</td>
	</tr>
	
	<tr>
	<td>
		<h1>Left - sub Menu: 보조메뉴, 검색 결과 참고</h1>
	</td>

	</tr>
	
	<tr>
	<td>
		<h1>Main : 본문</h1>
	</td>
	</tr>
	<tr>
	<td colspan="2" height="100">
	 <h1>Bottom - footer : 회사정보,...</h1>
	 </td>
	 </tr>	
	 
	 
	</table>	
</body>
</html>