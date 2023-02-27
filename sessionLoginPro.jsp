<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>sessionLoginPro</h1>
	
	<%!
		// 멤버변수 선언 - 회원정보
		String DBID = "itwill";
		String DBPW = "1234";
		
		//로그인 처리 로직
		// 1) 사용자가 입력한 ID, 디비에 저장한 ID 같은지 비교
        // 2-1) 같을때
		//      회원이다.
		// 3) 회원일때, 입력한 비밀번호, 디비에 저장한 비밀번호 같은지 비교
		// 4-1) 같을때
		//      아이디, 비밀번호 같음 => 본인 => 로그인 성공!
		//      로그인 정보를 모든페이지에 공유
		//      (sessionMain.jsp 페이지 이동)
		// 4-2) 다를때
		//      아이디만 같고, 비밀번호는 다름 => 본인x
		//      로그인 페이지로 이동
        // 2-2) 다를때 
		//      비회원이다.
		//      (로그인페이지로이동)
	%>
	
	
	
	
	
	
	
	
	<%
		// 한글 처리
		request.setCharacterEncoding("UTF-8");
		// 전달된 정보 저장
 		String id = request.getParameter("id"); // 파라미터는 String 타입이라서 따로 형변환을 하지 않는다.
 		String pw = request.getParameter("pw");
		
		System.out.println("입력한 ID : " +id);
		System.out.println("입력한 PW : " +pw);
		
		// 문자열의 값을 비교 == (주소비교) equals() (값비교)
		// 문자열.equals(비교대상문자열) / t,f
		
		
		if(id.equals(DBID)){
			 if(pw.equals(DBPW)){
				 //아이디,비밀번호 같음
				 session.setAttribute("id" , id);
				 response.sendRedirect("sessionMain.jsp");
			 }
			 else{
			 //아이디만 같음
			%>
			<script type="text/javascript">
			alert("비밀번호 오류!");
<!-- 			 history.back(); -->
			history. back();
			</script>
			<% }
		         }
		else{
			
			%>
			<script type="text/javascript">
			alert("회원정보가 없습니다!");
<!-- 			 history.back(); -->
			location.href="sessionLoginForm.jsp";
			</script>
			<% 
		
		}
	%>
</body>
</html>