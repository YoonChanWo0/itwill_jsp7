<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h1>memberList.jsp</h1>
		<h2> 회원정보 목록페이지(관리자용)</h2>
		
		<c:if test="${empty sessionScope.id || !id.equals('admin') }"> 
			<c:redirect url="./MemberLogin.me"/>
		</c:if>
		<!-- Action에서 받아온 정보(memberList) -->
		<table border="1">
		<tr>
			<td>id</td>
			<td>pw</td>
			<td>name</td>
			<td>gender</td>
			<td>age</td>
			<td>email</td>
			<td>regdate</td>
		
		</tr>
		<!-- rs(데이터) <- DTO <- List -->
		<c:forEach var="dto" items="${requestScope.memberList }">
		<tr>
			<td>${dto.id }</td>
			<td>${dto.pw }</td>
			<td>${dto.name }</td>
			<td>${dto.gender }</td>
			<td>${dto.age }</td>
			<td>${dto.email }</td>
			<td>${dto.regdate }</td>
		</tr>
		</c:forEach>
		
			
		<tr>
			<td>rs.getString("id")</td>
			<td>rs.getString("pw")</td>
			<td>rs.getString("name")</td>
			<td>rs.getString(4)</td>
			<td>rs.getString(5)</td>
			<td>rs.getString("email")</td>
			<td>rs.getString(7)</td>
		</tr>
	
		</table>
		
		<h2><a href="./Main.me">메인 페이지로</a></h2>
		
		
		
</body>
</html>