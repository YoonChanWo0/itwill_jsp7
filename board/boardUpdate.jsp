<%@page import="com.itwillbs.board.BoardDAO"%>
<%@page import="com.itwillbs.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>boardUpdate.jsp </h1>
	<h2>게시판 수정하기</h2>
	<%
	  //전달정보 저장 bno, pageNum
	  int bno = Integer.parseInt(request.getParameter("bno"));
	  String pageNum = request.getParameter("pageNum");
	  
	  // BoardDAO 객체 생성
	  BoardDAO dao = new BoardDAO();
	  
	  // bno에 해당하는 글정보 가져오기
	  BoardDTO dto = dao.getBoard(bno);
	
	%>
	<fieldset>
		<form action="boardUpdatePro.jsp?pageNum=<%=pageNum %>" method="post">
<%-- 	    <input type="hidden" name="pageNum" value=<%=pageNum %>> --%>
		
			글쓴이 : <input type="text" name="name" value="<%=dto.getName() %>"><br>
			비밀번호 : <input type="password" name="pass"><br>
			제목 : <input type="text" name="subject" value="<%=dto.getName() %>"><br>
			내용 : <textarea rows="5""cols="35" name="content" ><%=dto.getContent() %></textarea><br>
			<hr>
				<input type="submit" value="글 수정하기">
		</form>
	</fieldset>
</body>
</html>