<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기</title>
<!-- 상단 아이콘 -->
<link rel="shortcut icon" type="image/x-icon" href="resources/images/carpingLogo.jpg">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap"
	rel="stylesheet">

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
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>



<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" type='text/css' href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<style>
.full{
background: url(../../../resources/images/background.jpg) no-repeat 0px 0px;
	background-size: cover;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	-ms-background-size: cover;
	min-height: 950px;
	position: relative;
}

.findBox{
	width: 500px;
	height: 400px;
	background-color: rgba(12, 12, 12, 0.4);
	
}

</style>
</head>
<body>
<!-- modal -->
<div id="ex1" class="modal" align="center" style="text-align:center; width:400px; height:200px;">
  <h3 id="titleH1" class="h3"></h3>
  <br>
  <span id="id_value1"></span>
  <br>
  <span id="id_value2"></span>
  <br>
  <a style="margin-left:-10px; text-decoration:none; position:absolute; bottom: 10px;" href="#" rel="modal:close">닫기</a>
</div>
 
<p><a id="modalTag" href="#ex1" rel="modal:open"></a></p>


	<div class="full" id="home">
	<div class="loginBox">
			<div class="findBox">
		<div class="container" style="width:500px;color: #FFFFFF;">
			<div class="area_inputs wow fadeIn"> 
				<div class="sub_title font-weight-bold text-white" style="margin-top: 50px;	margin-left:50px;width: 400px;color: #FFFFFF;" align="center">
					<h3>아이디/비밀번호 찾기</h3>
					<br>
					<br>
				</div>
				<div align="center" style="width:50%; float:left;"
					class="custom-control custom-radio custom-control-inline">
					<input type="radio" class="custom-control-input" id="search_1"
						name="search_total" onclick="search_check(1)" checked="checked">
					<label class="custom-control-label font-weight-bold text-white"
						for="search_1">아이디 찾기</label>
				</div>
				<div align="center" class="custom-control custom-radio custom-control-inline" style="width:50%; float:left;">
					<input type="radio" class="custom-control-input" id="search_2"
						name="search_total" onclick="search_check(2)"> <label
						class="custom-control-label font-weight-bold text-white"
						for="search_2">비밀번호 찾기</label>
				</div>
				<br>
				<br>
				<div id="searchI">
					<div class="form-group">
						<label class="font-weight-bold text-white" for="inputName_1">이름</label>
						<div>
							<input type="text" class="form-control" id="memberName"
								name="memberName" placeholder="ex) 관리자">
						</div>
					</div>
					<div class="form-group">
						<label class="font-weight-bold text-white" for="inputPhone_1">휴대폰번호</label>
						<div>
							<input type="text" class="form-control" id="phone" name="phone" maxlength="13"
								placeholder="ex) 010-7777-9999">
						</div>
					</div>
					<div class="form-group">
						<button id="searchBtn" type="button" onclick="idSearch_click()"
							class="btn btn-primary btn-block" style="width:45%; margin-left:2%; float:left;">확인</button>
						<button class="btn btn-danger btn-block"
							onclick="location.href='login.do';" style=" width:45%; margin-left:6%; float:left;">취소</button>
					</div>
				</div>
				<div id="searchP" style="display: none;">
					<div class="form-group">
						<label class="font-weight-bold text-white" for="memberId">아이디</label>
						<div>
							<input type="text" class="form-control" id="memberId"
								name="memberId" placeholder="ex) godmisu">
						</div>
					</div>
					<div class="form-group">
						<label class="font-weight-bold text-white" for="email">이메일</label>
						<div>
							<input type="email" class="form-control" id="email"
								name="email" placeholder="ex) E-mail@gmail.com">
						</div>
					</div>
					<div class="form-group">
						<button id="searchBtn2" type="button" onclick="pwSearch_click()"
							class="btn btn-primary btn-block" style="width:45%; margin-left:2%; float:left;">확인</button>
						<button class="btn btn-danger btn-block" style=" width:45%; margin-left:6%; float:left;"
							onclick="location.href='login.do';">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
	<script type="text/javascript">
		//체크 버튼에 따라 아이디/비밀번호 기능이 달라진다
		function search_check(num) {
			if (num == '1') {
				document.getElementById("searchP").style.display = "none";
				document.getElementById("searchI").style.display = "";
			} else {
				document.getElementById("searchI").style.display = "none";
				document.getElementById("searchP").style.display = "";
			}
		}
		
		// 이름 전화번호 받고 아이디 출력하는 ajax
		function idSearch_click() {
			var memberName = $('#memberName').val();
			var phone = $('#phone').val();
			if(memberName != ''){
				$.post("/findId.do", {"memberName" : memberName,"phone" : phone}, function(response) {
					if (response == null) {
						$('#titleH1').text(memberName+"님의  아이디는");
						$('#id_value1').text("존재하지 않습니다.");
						$('#id_value2').text("입력 정보를 다시 확인해주세요.");
						$('#modalTag').get(0).click();
					} else {
						$('#titleH1').text(memberName+"님의  아이디는");
						$('#id_value1').text("["+response.memberId+"] 입니다.");
						$('#id_value2').text("해당 아이디로 로그인해주세요.");
						$('#modalTag').get(0).click();
					}
	            });
			}else{
				alert('값을 입력해주세요.');
			}
		}
		
		// 아이디 이메일 받고 비밀번호 출력하는 ajax
		function pwSearch_click() {
			var memberId = $('#memberId').val();
			var email = $('#email').val();
			if(memberId != ''){
				$.post("/findPw.do", {"memberId" : memberId,"email" : email}, function(response) {
					console.log(response);
					if (response == null) {
						$('#titleH1').text(memberId+"님의  비밀번호는");
						$('#id_value1').text("존재하지 않습니다.");
						$('#id_value2').text("입력 정보를 다시 확인해주세요.");
						$('#modalTag').get(0).click();
					} else {
						$('#titleH1').text(memberId+"님의  비밀번호는");
						$('#id_value1').text("["+email+"]로 보냈으니");
						$('#id_value2').text("해당 이메일을 통해 확인하시기 바랍니다.");
						$('#modalTag').get(0).click();
					}
	            });
			}else{
				alert('값을 입력해주세요.');
			}
		}
	</script>
</body>
</html>