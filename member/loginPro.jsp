<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
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
	<h1>loginPro.jsp</h1>
	<%
	
	 // 한글 처리
	 request.setCharacterEncoding("UTF-8");
	
	 // 이전의 페이지 주소
	 String oldURL = request.getParameter("oldURL");
	 
	 System.out.println(oldURL);
	 System.out.println(oldURL+000); // 숫자 0을 더했을떄 앞에 oldURL은 String이다.
	 
	 
	
	 //전달정보 저장(id,pw) - 액션태그(자바빈)
	
	%>
	
	<jsp:useBean id="mb" class="com.itwillbs.member.MemberBean"/>
	<jsp:setProperty property="*" name="mb"/>
	
	<%
		// 디비 접근 - 1) 아이디 유무, 2) 비밀번호 비교
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
	    // 회원/비회원인지 구문
	    String sql = "select pw from itwill_member where id=?";
	    PreparedStatement pstmt = con.prepareStatement(sql);
	    
	    pstmt.setString(1, mb.getId());
	    //???
	    
	   
	    
	    // 4. sql 실행
	    ResultSet rs = pstmt.executeQuery();
	    // 5. 데이터 처리
	    if(rs.next()){
	    	//회원
	    	if(mb.getPw().equals(rs.getString("pw"))){
	    		// 회원, 비밀번호 동일 => 로그인 성공
	    		// 회훤의 아이디 정보를 SESSION에 저장 // 로그인 정보 유지 위해서
	    		session.setAttribute("id",mb.getId());
	    		// 이전페이지가 없을떄 main 페이지로 이동
	    		
	    		if(oldURL.equals("null")){
	    		response.sendRedirect("main.jsp");
	    		}
	    		else{
	    		// 이전페이지가 있을떄 main 페이지로 이동
	    		response.sendRedirect(oldURL);
	    		}
	    	}
	    	
	    else{
	    	// 회원, 비밀번호 다름
	    	// alert(오류메시지 출력)
	    	// 페이지 뒤로가기
	    	%>
	    	<script type="text/javascript">
	    	alert("비밀번호 오류!");
	    	history.back();
	    	</script>
	    	<% 
	    }
	    }else{
	    	// 비회원
	    	// alert(오류메시지 출력)
	    	// 페이지 뒤로가기
	    	%>
	    	<script type="text/javascript">
	    	var tmp = confirm("회원정보가 없음(비회원)! 회원가입 페이지로 이동하시겠습니까?");
	    	
	    	alert(tmp);
	    	
	
	    	// 확인(true)=> 아이디 x -> 회원가입 페이지
	    	if(tmp){
	    		// 확인(true) => 아이디 x -> 회원가입페이지
	    		location.href='insertForm.jsp';
	    	}else{
	    		// 취소(false)=>아이디 o(오타) -> 로그인 페이지
	    		history.back();
	    	}
	    	
	    	</script>
	    	<%
	    }
	%>
</body>
</html>