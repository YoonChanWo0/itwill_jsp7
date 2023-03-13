<%@page import="com.itwillbs.member.MemberBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<script type="text/javascript">
	function checkData(){
		
		// 아이디가 입력되어있는지 체크
		if(document.fr.pw.value == ""){
			alert(" 아이디를 입력하시오!");
			document.fr.id.focus();
			return false;
		}
		
	}
	</script>
</head>
<body>
	<h1>memberUpdate.jsp</h1>
	
	<%
		// 로그인 제어
		
		String id =(String)session.getAttribute("id"); // String 타입으로 형변환을 해야 사용 가능
	
		if(id == null){
		response.sendRedirect("loginForm.jsp?oldURL="+request.getRequestURL());
		}
		
		
		// DB에 저장된 정보를 가져와서 화면에 출력(비밀번호 제외)
		
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
	    // ???
	  	pstmt.setString(1, id);
	    //4. sql 실행
	    ResultSet rs = pstmt.executeQuery();
	    
	    MemberBean mb = new MemberBean();
	    // 데이터 처리
	    if(rs.next()){ // 데이터 있을때
			
			// rs 데이터 -> MemberBean 저장
			mb.setId(rs.getString("id"));
			mb.setPw(rs.getString("pw"));
			mb.setName(rs.getString("name"));
			mb.setAge(rs.getInt("age"));
			mb.setGender(rs.getString("gender"));
			mb.setEmail(rs.getString("email"));
			mb.setRegdate(rs.getDate("regdate"));
			
	    }
			if(mb.getGender() == null || mb.getGender().equals("")){
				mb.setGender("남");
			}
			
	    	System.out.println("회원정보 조회 성공!");
	    	System.out.println(mb);
		
			
			
			
	%>
	
	<fieldset>
		<legend>ITWILL 회원정보 수정</legend>
		<!-- action주소가 없으면 자신의 페이지 호출 -->
		<form action="memberUpdatePro.jsp" method="post" name="fr" onsubmit="return checkData();">
		아이디 : <input type="text" name="id" value="<%=mb.getId()%>" readonly><br>
											 <!--input readonly(값만 수정, 정보 전달가능)   
											 		   disabled(태그 사용불가, 정보 전달불가능)-->
		비밀번호 : <input type="password" name="pw"><br>
		이름 : <input type="text" name="name" value="<%=mb.getName()%>" ><br>
		나이 : <input type="text" name="age" value="<%=mb.getAge()%>"><br>
		이메일 : <input type="text" name="email" value="<%=mb.getEmail()%>" readonly><br>
		성별 : <input type="radio" name="gender" value="남">남
			   <input type="radio" name="gender" value="여">여<br>
			   <input type="radio" name="gender" value="남"
			   <%if(mb.getGender().equals("남")){ %>
				checked
				<%} %>
				>남
			   
	
<!-- 				<input type="radio" name="gender" value="여" -->
<%-- 				<%if(mb.getGender().equals("여")){ %> --%>
<!-- 				checked -->
<%-- 				<%} %> --%>
<!-- 				>여 -->
				
				
		<hr>
		<input type="submit" value="수정하기">
		</form>
	
	
	</fieldset>
	
	
	
</body>
</html>