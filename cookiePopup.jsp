<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript">
	// 페이지 로드(실행)될때 팝업창 실행
	
	window.onload = pageload();
	
	function pageLoad(){
		// 페이지 로드시 팝업을 보여줄지, 아닐지 판단
		
		// 쿠키정보를 가져오기(js)
		var notShowPop = getCookieValue();
	
		if(notShowPop != "true"){
			//팝업열기
		}
		window.open("popUp.jsp","pop","width=400,hight=500","top=200","left=200");	
	} //pageLoad()
	
	function getCookieValue(){
		// 쿠키정보를 가져오기
		
		var result = "false"; // 쿠키 기본값
		
		if(document.cookie != ""){
			//console.log(document.cookie);
			//alert(document.cookie);
			var cookie = document.cookie.split(";");
			
			for(i=0;i<cookie.length;i++){
				var element = cookie[i].split("=");
				var value = element[0]; // 쿠키이름(key)
				
				value = value.replace(/^\s*/,''); // 정규표현식으로 공백제거
				
				if(value == "notShowPop"){
					result = element[1]; // 해당 쿠키값을 저장
				}// if
				
			}//for
		}//if
		return result;
	}//getCookieValue
	
	function deleteCookie(){
		// 쿠키정보 삭제 (쿠키 유효기간 제거)
		document.cookie="notShowPop="+"flase"+";path=/; expires=-1";
		
	} // deleteCookoe
	
	
	
	
	
	</script>


</head>
<body>
	<h1>cookiePopup.jsp</h1>
	<h2> 쿠키(헤더) </h2>
	
	<input type="button" value="쿠키삭제" onclick="deleteCookie()">
	
</body>
</html>