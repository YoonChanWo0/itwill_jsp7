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
<h1>boardDeletePro.jsp</h1>
	<%
	  // 한글처리
	  request.setCharacterEncoding("UTF-8");
	  // 전달정보 저장(bno,pass,pageNum)
	  String pageNum = request.getParameter("pageNum");
	  
// 	  int bno = Integer.parseInt(request.getParameter("bno"));
// 	  String pass = request.getParameter("pass");
	  
	  // 전달정보 저장(수정할 글의 정보-글쓴이,비밀번호,제목,내용)
	  // => 객체(액션태그-자바빈)
	  %>
	  <jsp:useBean id="dto" class="com.itwillbs.board.BoardDTO"/>
	  <jsp:setProperty property="*" name="dto"/>
	  pageNum : <%=pageNum %><hr>
	  수정할 정보 : <%=dto %><hr>
	  
	  <% 
	  
	  // BoardDAO - 정보 수정 메서드 : updateBoard(dto);
	  
	  BoardDAO dao = new BoardDAO();  
	  int result = dao.deleteBoard	(dto);
	  
	  // result 상태에 따라서 페이지 이동
	  
	  if(result == 1){
		  %>
		  	<script type="text/javascript">
		  	alert("삭제 완료");
		  	location.href="boardList.jsp?pageNum=<%=pageNum%>";
		  	</script>
		  
		  <% 
		  
	  }else if(result == 0){
		  %>
		  	<script type="text/javascript">
		  	alert("비밀번호 오류");
		  	history.back();
		  	</script>
		  
		  <% 
	  }else{ // result == -1
		  %>
		  	<script type="text/javascript">
		  	alert("글정보(번호) 오류");
		  	history.back();
		  	</script>
		  
		  <%  
	  }
	  
	%>
</body>
</html>