<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.xdevapi.PreparableStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>writePro.jsp</h1>
	<h2>전달받은 정보를 DB에 저장</h2>
	<%
	 // 한글처리(폼태그 post 방식)
	 request.setCharacterEncoding("UTF-8");
	 // 전달정보(파라미터)가 있다면 저장
	 // => 액션태그+자바빈 전달정보를 저장
	
	%>
	<jsp:useBean id="dto" class="com.itwillbs.board.BoardDTO"/>
	<jsp:setProperty property="*" name="dto"/>
	
	<%=dto %>
	<%
	 // dto - 추가 정보(IP)를 저장
	 dto.setIp(request.getRemoteAddr());
	
	 // DB연결 정보
	 final String DRIVER = "com.mysql.cj.jdbc.Driver";
	 final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
	 final String DBID = "root";
	 final String DBPW = "1234";
	  // 1.드라이버 로드
	  Class.forName(DRIVER);
	  System.out.println("드라이버 로드 성공");
	  // 2.디비연결
	  Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
	  System.out.println("DB연결 성공");
	  // 3.sql작성 & pstmt 객체
	  // bno 계산
	  String sql = "select max(bno) from itwill_board";
	  PreparedStatement pstmt = con.prepareStatement(sql);
	  
	  // 4.sql 실행
	  ResultSet rs = pstmt.executeQuery();
	  
	  //5. 데이터 처리 (글번호 최대값 +1)
	  int bno = 0;
	  if(rs.next()){
		  bno = rs.getInt(1)+1;// 괄호안에 1은 인덱스를 나타낸다
		  //bno = rs.getInt("max(bno)")+1;// 위에꺼랑 같은 말, rs.next = true로 출력됨
		  // 데이터가 sql null 인경우 0을 리턴
		  // 내장함수 호출시 가능한 컬럼명보단, 인덱스 접근이 유리하다.
	  }else{
		  bno = 1;
	  }
	  
	  System.out.println("bno :"+bno);
	  
	  // 정보 저장( 글쓰기 )
	  //3. sql(insert) - pstmt
	  sql = "insert into itwill_board (bno,name,pass,subject,content,readcount,re_ref,re_lev,re_seq,date,ip,file) values (?,?,?,?,?,?,?,?,?,now(),?,?)";
	  pstmt = con.prepareStatement(sql);
	  
	  pstmt.setInt(1, bno);
	  pstmt.setString(2, dto.getName());
	  pstmt.setString(3, dto.getPass());
	  pstmt.setString(4, dto.getSubject());
	  pstmt.setString(5, dto.getContent());
	  
	  pstmt.setInt(6, 0); // 모든글의 조회수는 0 초기화
	  pstmt.setInt(7, bno); // re_ref 그룹번호 - 일반글번호 == 그룹번호
	  pstmt.setInt(8, 0);// re_lev 레벨값 - 일반글 0
	  pstmt.setInt(9, 0);// re_seq 순서값 - 일반글 0
	  
	  pstmt.setString(10, dto.getIp());
	  pstmt.setString(11, dto.getFile());
	  
	  //4.sql
	  pstmt.executeUpdate();
	  
	  System.out.println("글쓰기 완료");
	%>
	
	<%=dto %>
</body>
</html>