<%@page import="com.itwillbs.board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwillbs.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>boardList.java</h1>
	
	<h2><a href="writeForm.jsp">글쓰기</a></h2>
	
	<%
	  // 전달정보 X 
	  
	  // 게시판 정보(DB)를 출력
	  
	  // BoardDAO 생성
	  BoardDAO dao = new BoardDAO();
	
	 //***********************************
	 // 페이징 처리 
	
	  // 전체 글의 개수
	  int count = dao.getBoardCount();
	 
	  // 한 페이지에 출력할 글의 개수
	  int pageSize = 2;
	  
	  // 현 페이지 정보가 몇페이지 인지 체크
	  String pageNum = request.getParameter("pageNum"); // 리스트페이지로 올떄 pageNum이라는 파라메터를 가지고 저장하겠다 라는 의미
	  if(pageNum == null){
		  pageNum = "1";
	  }
	  
	  // 시작행 번호 계산 // 1  11 21 31 ....
	  int currentPage = Integer.parseInt(pageNum);
	  int startRow = (currentPage - 1)*pageSize + 1;
	  // 끝행 번호 계산 // 10 20 30 40...
	  int endRow = currentPage * pageSize;
	  
	  
	  
	  // ************************************************
	  // DB에서 게시판글 정보를 전부 가져오기
// 	 ArrayList boardList =  dao.getBoardList();
	  
	  // 게시판글 일부만 가져오기 (페이징 처리)
	  ArrayList boardList =  dao.getBoardList(startRow,pageSize);
	%>
	
	<%=boardList %>
	
	<table border="1">
		<tr>
		<td>번호</td>
		<td>제목</td>
		<td>작성자</td>
		<td>작성일</td>
		<td>조회수</td>
		<td>IP</td>
		</tr>
		<%for(int i=0;i<boardList.size();i++){
		// ArratList -> DTO -> 변수
		BoardDTO dto =(BoardDTO)boardList.get(i);
		%>
		<tr>
		<td><%=dto.getBno() %></td>
		<td>
			<a href="boardContent.jsp?bno=<%=dto.getBno()%>&pageNum=<%=pageNum%>"><%=dto.getSubject() %></a>
		</td>
		<td><%=dto.getName() %></td>
		<td><%=dto.getDate() %></td>
		<td><%=dto.getReadcount() %></td>
		<td><%=dto.getIp() %></td>
		</tr>
		<%} %>
	</table>
	
	<hr>
	
	<%
	  /********************************************************************/
	  // 페이징 처리2
	  
	   if(count != 0){
		   // 전체 페이지수 계산
		   // 전체 : 50, 페이지당 10씩 출력 => 5개
		   // 전체 : 56, 페이지당 10씩 출력 => 6개
		   int pageCount = count/pageSize + (count%pageSize==0? 0:1); // 0이 아니면 1
		   
		   // 한 화면에 보여줄 페이지 번호의 개수
		   int pageBlock = 2;
		   
		   // 시작페이지 번호 1~10 => 1 11~20 => 11
		   int startPage = ((currentPage-1)/pageBlock)*pageBlock + 1;
		   // 끝페이지 번호 1~10 => 10, 11~20 => 20
		   int endPage = startPage+pageBlock-1;
		   if(endPage > pageCount){
			   endPage = pageCount;
		   }
		   
		   
		   // [이전] 
		   if(startPage > pageBlock){
			   %>
			   	 <a href="boardList.jsp?pageNum=<%=startPage-pageBlock%>">[이전]</a>
			   <% 
		   }
				   
		   // 1,2,3.....,10
		   for(int i=startPage;i<=endPage;i++){
			   %>
			   
			   <a href="boardList.jsp?pageNum=<%=i%>">[<%=i  %>]</a> 
			   <% 
		   }
		   // [다음]
		   if(endPage < pageCount){
			  %>
			  	<a href ="boardList.jsp?pageNum=<%=startPage+pageBlock%>">[다음]</a>
			  <% 
		   }
		   	   
	   }
	
	
	  /********************************************************************/
	%>
</body>
</html>