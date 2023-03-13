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
		if(document.fr.id.value == ""){
			alert(" 아이디를 입력하시오!");
			document.fr.id.focus();
			return false;
		}
		
	}
	</script>
</head>
<body>
	<h1>insertForm.jsp</h1>
	<!-- itwill_member 테이블에 저장될 정보를 입력 -->
	
	<fieldset>
		<legend>ITWILL 회원가입</legend>
		<!-- action주소가 없으면 자신의 페이지 호출 -->
		<form action="insertPro.jsp" method="post" name="fr" onsubmit="return checkData();">
		아이디 : <input type="text" name="id"><br>
		비밀번호 : <input type="password" name="pw"><br>
		이름 : <input type="text" name="name"><br>
		나이 : <input type="text" name="age"><br>
		이메일 : <input type="text" name="email"><br>
		성별 : <input type="radio" name="gender" value="남">남
			   <input type="radio" name="gender" value="여">여<br>
		
		<hr>
		<input type="submit" value="회원가입">
		</form>
	
	
	</fieldset>
	
	
	
</body>
</html>