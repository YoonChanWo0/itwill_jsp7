<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>insertPro.jsp</h1>
	<%
	// 한글 처리
	request.setCharacterEncoding("UTF-8");
	// 전달정보 저장(액션태그-자바빈)
	// 자바빈 객체 생성
	%>
	<jsp:useBean id="mb" class="com.itwillbs.member.MemberBean"/>
	<jsp:setProperty property="*" name="mb"/>
	
	<%=mb %> <br>
	
	<%
	  // 회원가입 날짜정보 저장 
	  mb.setRegdate(new Date(System.currentTimeMillis()));
	
	%>
	<%=mb %> <br>
	<hr>
	
	<h2>전달받은 정보를 itwill_member 테이블에 저장</h2>
	<%
	// 디비연결정보 (상수) 
	   final String DRIVER = "com.mysql.cj.jdbc.Driver"; 
	   final String DBURL = "jdbc:mysql://localhost:3306/jspdb"; 
	   final String DBID = "root"; 
	   final String DBPW = "1234"; 
		// 1. 드라이버 로드
	    Class.forName(DRIVER);
	    System.out.println("드라이버 로드 성공!");
		// 2. 디비연결
		Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
		System.out.println("DB연결 성공!");
		// 3. sql 작성(insert) & pstmt객체
		String sql = "insert into itwill_member (id,pw,name,gender,age,email,regdate) values(?,?,?,?,?,?,?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		//???
		pstmt.setString(1, mb.getId());
		pstmt.setString(2, mb.getPw());
		pstmt.setString(3, mb.getName());
		pstmt.setString(4, mb.getGender());
		pstmt.setInt(5, mb.getAge());
		pstmt.setString(6, mb.getEmail());
		pstmt.setDate(7, mb.getRegdate());
		
		// 4. sql 실행
		pstmt.executeUpdate();
		
		System.out.println("회원가입 성공!");
	%>
	
	<script type="text/javascript">
		alert("회원가입 성공!");
		location.href="loginForm.jsp";
	</script>
</body>
</html>