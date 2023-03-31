<%@page import="com.itwillbs.board.BoardDTO"%>
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
	<h1>boardContent.jsp</h1>
	
	<h2>글 본문(내용) 보기</h2>
	
	<%
	 // 전달받은 정보 bno 저장
	 int bno = Integer.parseInt(request.getParameter("bno"));
	
	 // 페이징처리 3 - 기존의 페이지 정보를 저장
	 String pageNum = request.getParameter("pageNum");
	 
	 // => 전달받은 데이터는 DB에 사용되는 형태로 형변환
		   	 
	 
	 // BoardDAO객체
	 BoardDAO dao = new BoardDAO();
	 
	 // DB - 조회수 1증가
	 dao.updateReadcount(bno);
	 
	 // DB-bno에 해당하는 글정보를 가져오기
	 BoardDTO dto = dao.getBoard(bno);
	 
	 // 화면 출력
	
	%>
		<%=dto %>
		
		<hr>
		
		<table border="1">
		 <tr>
		     <td>글번호</td>
		     <td><%=dto.getBno() %></td>
		     <td>조회수</td>
		     <td><%=dto.getReadcount() %></td>
		   </tr>
		   <tr>
		     <td>작성자</td>
		     <td><%=dto.getName() %></td>
		     <td>작성일</td>
		     <td><%=dto.getDate() %></td>
		   </tr>
		   <tr>
		      <td>글 제목</td>
		      <td colspan="3"><%=dto.getSubject() %></td>
		   </tr>
		   <tr>
		      <td>첨부파일</td>
		      <td colspan="3"><%=dto.getFile() %></td>
		   </tr>
		   <tr>
		      <td>글 내용</td>
		      <td colspan="3"><%=dto.getContent() %></td>
		   </tr>
		   <tr>
		      <td colspan="4">
		  <input type="button" value="수정하기" onclick="location.href='boardUpdate.jsp?bno=<%=dto.getBno()%>&pageNum=<%=pageNum%>';">
		  <input type="button" value="삭제하기" onclick="location.href='boardDelete.jsp';">
		  <input type="button" value="답글달기">
		  <input type="button" value="목록으로" onclick="location.href='boardList.jsp?pageNum=<%=pageNum%>';">
		  </td>
		 </tr>
		
		</table>
		
		
		
		
		
</body>
</html>