<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Carping 회원가입</title>
<!-- 상단 아이콘 -->
<link rel="shortcut icon" type="image/x-icon" href="resources/images/carpingLogo.jpg">
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
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" type='text/css' href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap" rel="stylesheet">
<script>
function daumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
        	document.getElementById('jibunAddress').value = data.jibunAddress;
        }
    }).open();
};
</script>

<style>
.bannerLogin {
	background: url(../../../resources/images/fallStreet2.jpg) no-repeat 0px 0px;
	background-size: cover;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	-ms-background-size: cover;
	min-height: 950px;
	position: relative;
}
span.guide {
		display:none;
		font-size : 15px;
		top : 12px;
		right : 10px;
		margin-left: 20px;
		font-weight: bold;
	}
	
span.guide2 {
		display:none;
		font-size : 15px;
		top : 12px;
		right : 10px;
		margin-left: 20px;
		font-weight: bold;
	}
	
span.ok{color:#FFFFFF}
span.error{color:red}
</style>

</head>
<body>
	<div class="bannerLogin" id="home" style="color: #FFFFFF;">
		<jsp:include page="../../../WEB-INF/views/common/nav.jsp"/>
		<div class="loginBox">
			<div class="loginBox3" align="center">
			<h2 class="h2" style="font-family: 'Sunflower', sans-serif; font-weight:bold;" align="center">Carping 관리자 등록</h2>
							<div style="width: 350px; border-bottom: 2px solid #FFFFFF;"></div>
							<br>
			<form action="adminRegister.do" method="post">
				<table class="enrollTable">
					<tr>
						<td style="font-family: 'Sunflower', sans-serif; font-weight:bold; font-weight:bold;">아이디 </td>
						<td style="width:320px;">
							<input class="form-control" style="margin-left: 20px; width:300px;" type="text" name="memberId" id="memberId" required>
						</td>
						<td style="width:160px;">
							<span style="font-family: 'Sunflower', sans-serif; font-weight:bold; margin-left: 20px;" class="guide ok">사용 가능합니다.</span>
							<span style="font-family: 'Sunflower', sans-serif; font-weight:bold; margin-left: 20px;" class="guide error">사용할 수 없습니다.</span>
							<input type="hidden" id="idDuplicateCheck" value="0">
						</td>
					</tr>
					<tr>
						<td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">비밀번호 </td>
						<td style="width:320px;"><input class="form-control" style="width:300px; margin-left: 20px;" type="password" name="memberPwd" id="password" required></td>
					</tr>
					<tr>
						<td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">비밀번호 확인</td>
						<td style="width:320px;"><input class="form-control" style="width:300px; margin-left: 20px;" type="password" id="passwordChk" required></td>
						<td style="width:160px;">
							<span style="font-family: 'Sunflower', sans-serif; font-weight:bold; margin-left: 20px;" class="guide2 ok">일치합니다.</span>
							<span style="font-family: 'Sunflower', sans-serif; font-weight:bold; margin-left: 20px;" class="guide2 error">일치하지 않습니다.</span>
							<input type="hidden" id="pwCheck" value="0">
						</td>
					</tr>
					<tr>
						<td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">이름</td>
						<td style="width:320px;"><input class="form-control" style="width:300px; margin-left: 20px;" type="text" name="memberName" required></td>
					</tr>
					<tr>
						<td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">전화번호</td>
						<td style="width:320px;"><input class="form-control" style="width:300px; margin-left: 20px;" type="text" name="phone" maxlength="13" placeholder="000-0000-0000식으로 입력해주세요." required></td>
					</tr>
					<tr>
						<td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">이메일</td>
						<td style="width:320px;"><input class="form-control" style="width:300px; margin-left: 20px;" type="text" name="email" required></td>
					</tr>
					<tr>
						<td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">주소</td>
						<td style="width:320px;">
							<input type="text" id="jibunAddress" name="jibunAddress" class="form-control" style="width:300px; margin-left: 20px;" required>
						</td>
						<td style="width:160px;"><button class="btnLogin" style="font-family: 'Sunflower', sans-serif; font-weight:bold; float:left; margin-left: 20px; width:70px;" type="button" onclick="daumPostcode()">검색</button></td>
					</tr>
					<tr>
						<td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">상세주소</td>
						<td style="width:320px;">
							<input type="text" id="detailAddress" name="detailAddress" class="form-control" style="width:300px; margin-left: 20px;" required>
						</td>
					</tr>
					<tr>
						<td colspan="3" align="center">
							<button style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="btnLogin" onclick="return validate();">등록하기</button>
							<!-- <input type="submit" value="가입하기"> -->
							<button style="font-family: 'Sunflower', sans-serif; font-weight:bold; margin-left:10px;" class="btnLogin" type="button" onclick="location.href='home.do';">메인으로</button>
						</td>
					</tr>
					
				</table>
			</form>
			</div>
		</div>
		 <!--footer-->
	<jsp:include page="../../../WEB-INF/views/common/footer.jsp"/>
	</div>
	<script type="text/javascript">
	function validate() {
		if($("#idDuplicateCheck").val() == 0) {
			alert("사용 가능한 아이디를 입력해주세요.");
			$("#memberId").focus();
			return false;
		}else {
			if($("#pwCheck").val() == 0){
				alert("비밀번호가 일치하지 않습니다.");
				$("#password").focus();
				return false;
			}else {
				return true;
			}
		};
		
	}
	
	// 아이디 중복성 검사 (Ajax)
	$("#memberId").on("blur", function() {
		var memberId = $(this).val();
		
		if(memberId.length < 4) {
			$(".guide").hide();
			$("#idDuplicateCheck").val(0);
			alert("4글자 미만입니다.");
			return;
		}
		
		$.ajax({
			url : "idDupCheck.do",
			data : { "memberId" : memberId },
			success : function(result) {
				if(result == "true") {
					$(".guide.error").hide();
					$(".guide.ok").show();
					$("#idDuplicateCheck").val(1);
				}else if(result == "false") {
					$(".guide.ok").hide();
					$(".guide.error").show();
					$("#idDuplicateCheck").val(0);
				}
			},
		});
	});	
	
	// 비밀번호 일치 검사
	$("#passwordChk").on("blur", function() {
		var password = $("#password").val();
		var passwordChk = $(this).val();
		
		if(password === passwordChk) {
			$(".guide2.error").hide();
			$(".guide2.ok").show()
			$("#pwCheck").val(1);
		}else{
			$(".guide2.error").show();
			$(".guide2.ok").hide()
			$("#pwCheck").val(0);
		}
		
	});
	
	// 비밀번호 길이
	$("#password").on("blur", function() {
		var password = $("#password").val();
		
		if(password.length < 6) {
			alert("비밀번호는 6글자 이상으로 해주세요.");
			$("#password").focus();
			return;
		}
	});
	</script>
</body>
</html>