<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Outdoors Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola web design" />
<script type="applisalonion/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="resources/css/bootstrap.css" rel='stylesheet'
	type='text/css' />
<!-- Custom Theme files -->
<link href="resources/css/iconeffects.css" rel='stylesheet'
	type='text/css' />
<link href="resources/css/style.css" rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="resources/css/swipebox.css">
<script src="resources/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="resources/js/move-top.js"></script>
<script type="text/javascript" src="resources/js/easing.js"></script>
<!--/web-font-->
<link
	href='//fonts.googleapis.com/css?family=PT+Sans:400,400italic,700,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='//fonts.googleapis.com/css?family=Merriweather+Sans:400,300,700'
	rel='stylesheet' type='text/css'>
<!--/script-->

<style>
.bannerLogin {
	background: url(../../../resources/images/background.jpg) no-repeat 0px 0px;
	background-size: cover;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	-ms-background-size: cover;
	min-height: 950px;
	position: relative;
}
</style>

</head>
<body>
	<div class="bannerLogin" id="home">
		<div class="loginBox">
			<div class="loginBox2">
			<form action="myInfoForm.do" method="post">
				<table class="loginTable">
					<tr>
						<td colspan="2">
							<h1 class="h1" align="center">회원정보 수정</h1>
							<br>
						</td>
					</tr>
					<tr><td><input type="hidden" name="memberId" value="${loginUser.memberId }"></td></tr>
					<tr align="center">
						<td colspan="2" style="font-weight:bold;">비밀번호를 입력해주세요.</td>
					</tr>
					<tr>
						<td colspan="2"><input class="form-control" style="width:100%;" type="password" name="memberPwd"></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" id="login-btn" class="btnLogin1" value="확인"></button>
						</td>
					</tr>
				</table>
			</form>
			</div>
		</div>
	</div>
</body>
</html>