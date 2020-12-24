<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 글 작성</title>
<!-- 상단 아이콘 -->
<link rel="shortcut icon" type="image/x-icon" href="resources/images/carpingLogo.jpg">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" type='text/css' href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
</head>
<body>
	<jsp:include page="../common/nav.jsp"></jsp:include>
		<div style="height: 100px;"></div>
	<section style="width:100%; height:800px;">
		<div align="center">
			<h2 class="h2" style="font-weight:bold; font-family: 'Sunflower', sans-serif;">자유게시판 작성</h2>
			<div style="width: 350px; border-bottom: 2px solid lightgray;"></div>
		</div>
		<br><br>
		<form action="BoardInsert.do" method="post" name="boardForm">
			<input type="hidden" name="memberId" value="${loginUser.memberId }">
		<article>
			
			<div class="container" style="font-family: 'Sunflower', sans-serif;">
				<div class="col-md-2"></div>
				<div class="col-md-8 vcenter">
				<label class="col-md-2 text-center vcenter" style="font-family: 'Sunflower', sans-serif; font-weight:bold; font-size: 1.5em;">제목</label><input type="text" name="boardTitle"class="col-md-8 form-control align-self-center" style="font-family: 'Sunflower', sans-serif; font-weight:bold; width : 50%;">
				
				<div class="col-md-2" style="margin-top: 10px;">
					
				</div>

			</div>
			<div class="col-md-2"></div>
			</div> 
			<br>
			<div class="container" style="font-family: 'Sunflower', sans-serif;">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<label class="col-md-2 text-center vcenter" style="font-family: 'Sunflower', sans-serif; font-weight:bold; font-size: 1.5em;">내용</label><textarea name="boardContent" class="col-md-6 form-control" cols="5" rows="10" style="margin: 0px; width: 564px; height: 325px; resize: none;"></textarea>
				</div>
				<div class="col-md-2"></div>
			</div>
			<br>
			<br>
			<div class="container" style="font-family: 'Sunflower', sans-serif; ">
				<div class="col-md-2"></div>
				<div class="col-md-8" style="margin-left: -30px;">
					<div class="col-md-4"></div>
					<button type="button" class="col-md-2 btn btn-default" style="font-family: 'Sunflower', sans-serif; font-weight:bold; height: 40px;" onclick="back();">목록으로</button>
					<div class="col-md-2"></div>
					<button type="submit" class=" col-md-2 btn btn-info" style="font-family: 'Sunflower', sans-serif; font-weight:bold; height: 40px;" onclick="return chk();">글쓰기</button>
				</div>
				<div class="col-md-2"></div>
			</div>
			<br>
			<br>
		</article>
		</form>
	</section>
		<!--footer-->
	<jsp:include page="../../../WEB-INF/views/common/footer.jsp"/>
	<script>
		function back(){
			location.href="BoardInfo.do";
		}
		function chk(){
			var form = document.boardForm;
			if(!form.boardTitle.value){
				alert('제목을 입력해주세요.');
				return false;
			}
			if(!form.boardContent.value){
				alert('내용을 입력해주세요.');
				return false;
			}
			
			return true;
		}
	</script>
</body>
</html>