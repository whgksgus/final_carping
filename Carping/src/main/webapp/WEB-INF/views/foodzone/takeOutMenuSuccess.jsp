<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테이크아웃 예약 완료!</title>
</head>
<body>
	<jsp:include page="../common/nav.jsp"></jsp:include>
	<h1>예약이 완료되었습니다.</h1>
	
	<button onclick="home();">메인으로 돌아가기</button>
	
	<script>
		function home(){
			location.href='home.do';
		}
		
	</script>
</body>
</html>