<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정하기 </title>
<style>
</style>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap" rel="stylesheet">

</head>
<body>
	<jsp:include page="../common/nav.jsp"></jsp:include>
	<section style="margin-top: 40px; ">
		<h3 style="font-family: 'Sunflower', sans-serif; margin-left: 100px;">리뷰 수정</h3>
		<br><br>
		<form action="boardUpdate.do" method="post" name="buForm">
			<input type="hidden" name="memberId" value="${loginUser.memberId }">
			<input type="hidden" name="boardKey" value="${board.boardKey }">
			
			
		<article>
			<div class="container" style="font-family: 'Sunflower', sans-serif;">
				<div class="col-md-2"></div>
				<div class="col-md-8 vcenter">
				<label class="col-md-2 text-center vcenter" style="font-size: 1.5em;">제목</label><input type="text" name="boardTitle"class="col-md-8 form-control align-self-center" value="${board.boardTitle}" style="width : 50%;">
				
				<div class="col-md-2" style="margin-top: 10px;">
				</div>

			</div>
			<div class="col-md-2"></div>
			</div> 
			<div class="container" style="font-family: 'Sunflower', sans-serif;">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<label class="col-md-2 text-center vcenter" style="font-size: 1.5em;">내용</label><textarea name="boardContent" class="col-md-6 form-control" cols="5" rows="10" style="margin: 0px; width: 564px; height: 325px; resize: none;">${fReview.frContent }</textarea>
				</div>
				<div class="col-md-2"></div>
			</div>
			<br><br>
			<div class="container" style="font-family: 'Sunflower', sans-serif; ">
				<div class="col-md-2"></div>
				<div class="col-md-8" style="margin-left: -30px;">
					<div class="col-md-4"></div>
					<button type="button" class="col-md-2 btn btn-default" style="height: 40px;" onclick="back();">목록으로</button>
					<div class="col-md-2"></div>
					<button type="submit" class=" col-md-2 btn btn-info" style="height: 40px;" onclick="return chk();">수정하기</button>
				</div>
				<div class="col-md-2"></div>
			</div>
			
		</article>
		</form>
	</section>
	<script>
		function back(){
			location.href='BoardInfo.do';
		}
		function chk(){
			var form = document.buForm;
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