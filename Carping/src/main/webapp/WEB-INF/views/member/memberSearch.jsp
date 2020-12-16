<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

</head>
<body>
<div id="ex1" class="modal">
  <span id="id_value"></span>
  <a href="#" rel="modal:close">닫기</a>
</div>
 
<p><a id="modalTag" href="#ex1" rel="modal:open"></a></p>

	<div class="full">
		<div class="container">
			<div class="area_inputs wow fadeIn">
				<div class="sub_title font-weight-bold text-white">
					<h3>아이디/비밀번호 찾기</h3>
					<p>인증된 이메일만 정보 찾기가 가능합니다 :)</p>
				</div>
				<div style="margin-bottom: 10px;"
					class="custom-control custom-radio custom-control-inline">
					<input type="radio" class="custom-control-input" id="search_1"
						name="search_total" onclick="search_check(1)" checked="checked">
					<label class="custom-control-label font-weight-bold text-white"
						for="search_1">아이디 찾기</label>
				</div>
				<div class="custom-control custom-radio custom-control-inline">
					<input type="radio" class="custom-control-input" id="search_2"
						name="search_total" onclick="search_check(2)"> <label
						class="custom-control-label font-weight-bold text-white"
						for="search_2">비밀번호 찾기</label>
				</div>
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
							class="btn btn-primary btn-block">확인</button>
						<a class="btn btn-danger btn-block"
							href="${pageContext.request.contextPath}" onclick="search_check(1)">취소</a>
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
							class="btn btn-primary btn-block">확인</button>
						<a class="btn btn-danger btn-block"
							href="${pageContext.request.contextPath}" onclick="search_check(2)">취소</a>
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
			$.post("/findId.do", {"memberName" : memberName,"phone" : phone}, function(response) {
				console.log(response);
				console.log(response.memberId);
				if (response == null) {
					$('#id_value').text("회원 정보를 확인해주세요!");
					$('#modalTag').get(0).click();
				} else {
					$('#id_value').text(response.memberId);
					$('#modalTag').get(0).click();
				}
            });
		}
		
		// 아이디 이메일 받고 비밀번호 출력하는 ajax
		function pwSearch_click() {
			var memberId = $('#memberId').val();
			var email = $('#email').val();
			$.post("/findPw.do", {"memberId" : memberId,"email" : email}, function(response) {
				console.log(response);
				console.log(response.memberPwd);
				if (response == null) {
					$('#id_value').text("회원 정보를 확인해주세요!");
					$('#modalTag').get(0).click();
				} else {
					$('#id_value').text(response.memberPwd);
					$('#modalTag').get(0).click();
				}
            });
		}
	</script>
</body>
</html>