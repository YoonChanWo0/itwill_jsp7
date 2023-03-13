<%@page import="com.itwillbs.member.MemberBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>memberInfo.jsp</h1>
	
	<h2>회원가입시 입력한 정보를 화면에 출력</h2>
	
	<%
		// 로그인 세션 제어(로그인 했을때만 사용)
	String id =(String)session.getAttribute("id"); // String 타입으로 형변환을 해야 사용 가능
	
	if(id == null){
		response.sendRedirect("loginForm.jsp?oldURL="+request.getRequestURI()); // 이게 밑에꺼 보다 더 정확하다.
		//response.sendRedirect("loginForm.jsp?oldURL="+request.getRemoteAddr());
		// 전달할 정보? 페이지 주소
		// 파라메터,session,application 정보 전달가능
	}
	
	// 로그인한 회원의 정보를 화면에 출력
	
	// db접근 -> 연결정보 가져오기
	 // 디비연결정보 (상수) 
	    final String DRIVER = "com.mysql.cj.jdbc.Driver"; // final String DRIVER = X X값을 드라이버에 넣음으로써 값을
	    													                    // 바꿀수 없음
	    final String DBURL = "jdbc:mysql://localhost:3306/jspdb"; 
	    final String DBID = "root"; 
	    final String DBPW = "1234"; 
	    
	 // 1. 드라이버 로드
	    Class.forName(DRIVER);
	    System.out.println("드라이버 로드 성공!");
	    // 2. 디비연결
	    Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
		System.out.println("DB연결 성공!");
		// 3. sql 구문(select) & pstmt 객체
	    String sql = "select * from itwill_member where id=?";
	    PreparedStatement pstmt = con.prepareStatement(sql);
	    
	   
	    //???
	    pstmt.setString(1, id);
	   
	    
	    // 4. sql 실행
	    ResultSet rs = pstmt.executeQuery();
	    
	    // MemberBean 객체 생성
	    MemberBean mb = new MemberBean(); // itwill_member의 정보를 한번에 저장하기 위해 만듦
	    
		// 5. 데이터 처리(정보 출력)
		if(rs.next()){ // 데이터 있을때
			
			// rs 데이터 -> MemberBean 저장
			mb.setId(rs.getString("id"));
			mb.setPw(rs.getString("pw"));
			mb.setName(rs.getString("name"));
			mb.setAge(rs.getInt("age"));
			mb.setGender(rs.getString("gender"));
			mb.setEmail(rs.getString("email"));
			mb.setRegdate(rs.getDate("regdate"));
			out.print(rs.getString("id") ); // 화면에 id라는 정보를 볼 수 있음.
			
			%>
			비밀번호 : <%=rs.getString("pw") %><br>
			
		<% 
		     }
	
	    %>
	
	<table border="1">
		<tr>	
			<td>아이디</td>
			<td><%=mb.getId() %></td>
		</tr>
		<tr>	
			<td>비밀번호</td>
			<td><%=mb.getPw() %></td>
		</tr>
		<tr>	
			<td>이름</td>
			<td><%=mb.getName() %></td>
		</tr>
		<tr>	
			<td>이메일</td>
			<td><%=mb.getEmail() %></td>
		</tr>
		<tr>	
			<td>성별</td>
			<td><%=mb.getGender() %></td>
		</tr>
		<tr>	
			<td>회원가입일</td>
			<td><%=mb.getRegdate() %></td>
		</tr>				
	</table>
	
	<h2><a href="main.jsp">메인페이지로 이동.</a></h2>
	
	
	
	
	
	
	
	
</body>
</html>