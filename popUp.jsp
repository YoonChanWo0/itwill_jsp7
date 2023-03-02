<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function popClose(){
		window.close(); // 팝업창 정료
	}
	
	function setPopup(obj){
		if(obj.checked == true){
			// 쿠키 생성
			var expDate = new Date(); // 유효기간으로 표시
			expDate.setMonth(expDate.getMonth()+1); // 현제시간의 월의 정보를 가져다가 +1함, 유효기간을 1달로 지정
			
			document.cookie = "notShowPop="+"true"+";path=/;expires=" +expDare,toGMTString();
			//                "notShowPop=ture/path.expires=20230402"   
			
			window.close();
		}
	}
	
</script>
</head>
<body>
	<h1>popUp.jsp</h1>
	<h2>팝업창 (광고)</h2>
	
	<h2>오늘만 이가격!!</h2>
	<img src="car1.jpg" width="300"><br>
	
	<br>
	<br>
	<br>
	<br>
	
	<input type="checkbox" onclick="setPopup(this);">	오늘 더 이상 팝업창 띄우지 않기 
	<input type="button" value="종료" onclick="popClose();">
	
</body>
</html>