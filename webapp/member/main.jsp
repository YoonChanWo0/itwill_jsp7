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
	<h1>main.jsp</h1>
	<!-- 로그인 정보가 있을떄만 메인페이지를 사용가능 -->
	<%
	// 로그인 정보
	
// 	String id =(String)session.getAttribute("id"); // String 타입으로 형변환을 해야 사용 가능
	
// 	if(id == null){
// 		response.sendRedirect("loginForm.jsp");
// 	}
	%>
	<c:set var="id" value="${sessionScope.id }"/>
	
	<%--<c:if test="${id == null }"> --%>
	<%--empty 참조변수 : 객체가 null이거나 컬랙션 사이즈가 0일떄 true를 리턴한다라는 의미 --%>
	<c:if test="${ empty id }">
		<c:redirect url="./MemberLogin.me"/>
	</c:if>
	
	로그인 아이디 : <%=session.getAttribute("id") %><br>
	로그인 아이디(el) : ${sessionScope.id}<br>
	
	<input type="button" value="로그아웃" onclick="location.href='./MemberLogout.me';">
	
	<hr>
	
	<h3><a href="./MemberInfo.me">회원 정보 조회</a>></h3>
	
	<h3><a href="./MemberUpdate.me">회원 정보 수정</a>></h3>
	
	<h3><a href="MemberDelete.me">회원 정보 삭제</a>></h3>
	
	<hr>
	
	<c:if test="${!empty sessionScope.id && id.equals('admin')}">
	<h2>관리자 전용 메뉴</h2>
	
	<h3><a href="./member/memberList.jsp">회원 정보 목록</a></h3>
	</c:if>
	
	<!-- 관리자 전용 계정(admin)만 확인가능한 메뉴 -->
<%-- 	<%
// 	jsp 페이지 -> jsp코드 처음부터 끝까지 모두 실행한 다음에 동작
// 	객체의 정보를 비교할떄는 항상 데이터가 있는지 채크 후 비교
	
// 	if(id != null && id.equals("admin")){} -- 이렇게 사용 가능! 밑에꺼랑 동일함
 	
	if (id != null){
		
	
	if(id.equals("admin")){ %>
	
	<h3><a href="memberList.jsp">회원 정보 목록</a></h3>
	
	<%
			}
		}
	%>  --%>
	
	
</body>
</html>