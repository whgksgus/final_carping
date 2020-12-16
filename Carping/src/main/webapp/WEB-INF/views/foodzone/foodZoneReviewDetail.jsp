<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 상세보기 페이지</title>
<style>
	.star-rating { width:205px; } 
.star-rating,.star-rating span { display:inline-block; height:39px; overflow:hidden; background:url(../../../resources/images/star.png)no-repeat; } 
.star-rating span{ background-position:left bottom; line-height:0; vertical-align:top;}
#star{
	width : 100%;
	display: table-cell;
	vertical-align: middle;
}
#star div{
	float: left;
}

</style>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" type='text/css' href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
</head>
<body>
<!-- 아이디 찾기 modal -->
		<div id="ex1" class="modal" align="center" style="text-align:center; width:500px; height:500px; padding: 0px;">
		  <img src="../../../resources/images/b1.jpg" style="width: 500px; height: 500px; ">
		 </div>
		 
		
		
		
	<jsp:include page="../common/nav.jsp"></jsp:include>
	<section style="margin-top: 40px; ">
		<h3 style="font-family: 'Sunflower', sans-serif; margin-left: 100px;">${foodZone.foodZoneName } 리뷰 상세보기</h3>
		<br><br>
		<article>
			<div class="container" style="font-family: 'Sunflower', sans-serif;">
				<div class="col-md-2"></div>
				<div class="col-md-8 vcenter">
					<label class="col-md-2 text-center vcenter" style="font-size: 1.5em;">제목</label><input type="text" readonly="readonly" value="${fReview.frTitle}" class="col-md-8 form-control align-self-center" style="width : 50%;">
					<div id='star'>
					<div id="stars">
						<span class='star-rating'>
							<c:choose>
								<c:when test="${fReview.frScore == 1}">
									<span style ='width:20%;'>
									</span>
								</c:when>
								<c:when test="${fReview.frScore == 2}">
									<span style ='width:40%;'>
									</span>
								</c:when>
								<c:when test="${fReview.frScore == 3}">
									<span style ='width:60%;'>
									</span>
								</c:when>
								<c:when test="${fReview.frScore == 4}">
									<span style ='width:80%;'>
									</span>
								</c:when>
								<c:otherwise>
									<span style ='width:100%;'>
									</span>
								</c:otherwise>
							</c:choose>
							
						</span>
					</div>
				</div>
					</div>
				<div class="col-md-2"></div>
			</div>
			<div class="container" style="font-family: 'Sunflower', sans-serif;">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<label class="col-md-2 text-center vcenter" style="font-size: 1.5em;">내용</label><textarea class="col-md-6 form-control" cols="5" rows="10" style="margin: 0px; width: 564px; height: 325px; resize: none;">
					
					</textarea>
				</div>
				<div class="col-md-2"></div>
			</div>
			<div class="container">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<p>첨부파일</p><p><a id="modalTag" href="#ex1" rel="modal:open">${fReview.frPhoto}</a></p>
				</div>
				<div class="col-md-2"></div>
			</div>
		</article>
	</section>
</body>
</html>