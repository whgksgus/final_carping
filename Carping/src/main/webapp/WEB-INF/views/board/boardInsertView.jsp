<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 글 작성</title>
<style>
</style>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" type='text/css' href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
</head>
<body>
	<jsp:include page="../common/nav.jsp"></jsp:include>
	<section style="margin-top: 40px; ">
		<h3 style="font-family: 'Sunflower', sans-serif; margin-left: 100px;">글 작성</h3>
		<br><br>
		<form action="BoardInsert.do" method="post">
			<input type="hidden" name="memberId" value="${loginUser.memberId }">
		<article>
			
			<div class="container" style="font-family: 'Sunflower', sans-serif;">
				<div class="col-md-2"></div>
				<div class="col-md-8 vcenter">
				<label class="col-md-2 text-center vcenter" style="font-size: 1.5em;">제목</label><input type="text" name="boardTitle"class="col-md-8 form-control align-self-center" style="width : 50%;">
				
				<div class="col-md-2" style="margin-top: 10px;">
					
				</div>

			</div>
			<div class="col-md-2"></div>
			</div> 
			<br>
			<div class="container" style="font-family: 'Sunflower', sans-serif;">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<label class="col-md-2 text-center vcenter" style="font-size: 1.5em;">내용</label><textarea name="boardContent" class="col-md-6 form-control" cols="5" rows="10" style="margin: 0px; width: 564px; height: 325px; resize: none;"></textarea>
				</div>
				<div class="col-md-2"></div>
			</div>
			<br>
			<br>
			<div class="container" style="font-family: 'Sunflower', sans-serif; ">
				<div class="col-md-2"></div>
				<div class="col-md-8" style="margin-left: -30px;">
					<div class="col-md-4"></div>
					<button class="col-md-2 btn btn-default" style="height: 40px;" onclick="back();">목록으로</button>
					<div class="col-md-2"></div>
					<button type="submit" class=" col-md-2 btn btn-info" style="height: 40px;">글쓰기</button>
				</div>
				<div class="col-md-2"></div>
			</div>
			
		</article>
		</form>
	</section>
	<script>
		function back(){
			location.href="foodZoneReviewListView.do?foodZoneKey="+${foodZoneKey};
		}
	</script>
</body>
</html>