<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 상세보기 페이지</title>
<!-- 상단 아이콘 -->
<link rel="shortcut icon" type="image/x-icon" href="resources/images/carpingLogo.jpg">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
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
		  <img src="../../../resources/foodzoneImage/${fReview.frPhoto}" style="width: 500px; height: 500px; ">
		 </div>
		 
		
		
		
	<jsp:include page="../common/nav.jsp"></jsp:include>
	<section style="width:100%; height:1100px;">
	<div style="height:100px; display:block;"></div>
		<div align="center">
			<h2 class="h2" style="font-family: 'Sunflower', sans-serif; font-weight:bold;">리뷰 상세보기</h2>
			<div style="width: 350px; border-bottom: 2px solid lightgray;"></div>
		</div>
		<br>
		<article>
			<div class="container" style="font-family: 'Sunflower', sans-serif; font-weight:bold;">
				<div class="col-md-2"></div>
				<div class="col-md-8 vcenter">
					<label class="col-md-2 text-center vcenter" style="font-family: 'Sunflower', sans-serif; font-weight:bold;font-size: 1.5em;">제목</label><input type="text" readonly="readonly" value="${fReview.frTitle}" class="col-md-8 form-control align-self-center" style="font-family: 'Sunflower', sans-serif; font-weight:bold;width : 50%;">
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
			<div class="container" style="font-family: 'Sunflower', sans-serif; font-weight:bold;">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<label class="col-md-2 text-center vcenter" style="font-family: 'Sunflower', sans-serif; font-weight:bold;font-size: 1.5em;">내용</label><textarea class="col-md-6 form-control" cols="5" rows="10" style="font-family: 'Sunflower', sans-serif; font-weight:bold;margin: 0px; width: 564px; height: 325px; resize: none;" readonly="readonly">${fReview.frContent}</textarea>
				</div>
				<div class="col-md-2"></div>
			</div>
			<br>
			<div class="container" style="font-family: 'Sunflower', sans-serif; font-weight:bold;">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<label class="col-md-2 text-center vcenter" style="font-family: 'Sunflower', sans-serif; font-weight:bold;font-size: 1.5em;">사진</label>
					
					<c:choose>
						<c:when test="${fReview.frPhoto eq null}">
							<p style="font-family: 'Sunflower', sans-serif; font-weight:bold;">첨부파일이 없습니다.</p>
							
						</c:when>
						<c:otherwise>
							<a id="modalTag" href="#ex1" rel="modal:open"><img src="../../../resources/images/camera.jpg" style="width: 40px; height: 40px;"></a>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="col-md-2"></div>
			</div>
			<br><br>
			<!--   -->
			<div class="container"  style="font-family: 'Sunflower', sans-serif; font-weight:bold;">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<label class="col-md-2 text-center vcenter" style="font-family: 'Sunflower', sans-serif; font-weight:bold;font-size: 1.5em;">댓글</label>
					<table id="frctb" class="col-md-6 table" style="width: 560px;">
						<thead>
							<tr>
								<td colspan="4"><b id="frcCount"></b></td>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table>
				</div>
				<div class="col-md-2"></div>
			</div>
			<br>
			<div class="container" style="font-family: 'Sunflower', sans-serif; font-weight:bold;">
				<div class="col-md-2"></div>
				<div class="col-md-9" style="margin-left: -20px;">
					<label class="col-md-2 text-center vcenter" style="font-family: 'Sunflower', sans-serif; font-weight:bold;font-size: 1.5em;">
						
					</label>
					<table class="col-md-6 table" style="width: 560px;">
						<thead>
							<tr>
								<td>
									<textarea id="content" rows="5" cols="10" style="font-family: 'Sunflower', sans-serif; font-weight:bold;width: 543px; height: 67px; resize: none;"></textarea>
								</td>
								<td>
									<button class="btn btn-default" style="font-family: 'Sunflower', sans-serif; font-weight:bold;width: 70px; height: 70px;" id="submit">등록</button>
								</td>
							</tr>
						</thead>
					</table>
				</div>
				<div class="col-md-1"></div>
			</div>
			<br><br>
			<div class="container" style="font-family: 'Sunflower', sans-serif; font-weight:bold; ">
				<div class="col-md-2"></div>
				<div class="col-md-8" style="margin-left: -30px;">
					<div class="col-md-3"></div>
					<button type="button" class="col-md-2 btn btn-default" style="font-family: 'Sunflower', sans-serif; font-weight:bold;height: 40px;" onclick="back();">목록으로</button>
					<c:if test="${fReview.memberId eq loginUser.memberId}">
						<c:url var="frUpdate" value="foodZoneReviewUpdate.do">
							<c:param name="frKey" value="${fReview.frKey}"></c:param>
							<c:param name="foodZoneKey" value="${foodZoneKey }"></c:param>
						</c:url>
						<c:url var="frDelete" value="foodZoneReviewDelete.do">
							<c:param name="frKey" value="${fReview.frKey}"></c:param>
							<c:param name="foodZoneKey" value="${foodZoneKey}"></c:param>
						</c:url>
						<div class="col-md-1"></div>
						<button class="col-md-2 btn btn-default" style="font-family: 'Sunflower', sans-serif; font-weight:bold;height: 40px;" onclick="return upChk();">수정</button>
						<div class="col-md-1"></div>
						<button class="col-md-2 btn btn-danger" style="font-family: 'Sunflower', sans-serif; font-weight:bold;height: 40px;" onclick= "return chk();">삭제</button>
					</c:if>
				</div>
				<div class="col-md-2"></div>
			</div>
			
			
		</article>
	</section>
	<!--footer-->
	<jsp:include page="../../../WEB-INF/views/common/footer.jsp"/>
	<script>
		$(function(){
			getReplyList();
			setInterval(function(){
				getReplyList();
			}, 3000);
			$("#submit").on("click", function(){
				var frcContent = $("#content").val();
				var frKey = ${fReview.frKey};
				if(frcContent == ""){
					alert('댓글을 입력해주세요')
				}else{
					$.ajax({
						url : "frCommentAdd.do",
						type : "post",
						data : {"frcContent" : frcContent, "frKey" : frKey},
						success : function(data){
							if(data == "success"){
								getReplyList();
								$("#content").val('');
							}else{
								alert("등록 실패");
							}
						}
					});
				}
			});
		})
		
		function getReplyList(){
			
			var frKey = ${fReview.frKey};
			$.ajax({
				url : "frCommentList.do",
				type : "get",
				data : {"frKey" : frKey},
				dataType : "json",
				success : function(data){
					$tableBody = $("#frctb tbody");
					$tableBody.html("<tr><th width='100px;' class='text-center'>작성자</th><th>내용</th><th width='110px;' class='text-center'>작성일자</th><th width='70px;' class='text-center'>삭제</th></tr>");
					var $tr;
					var $frcWriter;
					var $frcContent;
					var $frcRegDate;
					var $frcDelete;
					
					$("#frcCount").text("댓글 "+data.length);
					if(data.length>0){
						for(var i in data){
							var checkId = '${loginUser.memberId}';
							$tr = $("<tr>");
							$frcWriter = $("<td>").text(data[i].frcWriter);
							$frcContent = $("<td>").text(decodeURIComponent(data[i].frcContent).replace(/\+/g, " "));
							$frcRegDate = $("<td>").text(data[i].frcRegDate);
							$memberId = data[i].frcWriter;
							if(checkId == $memberId){
								$frcDelete = $("<td><button style = 'padding : 0px 20px;' class='btn btn-danger' id='frcDelete' onclick='frcDelete("+data[i].frcKey+");'>X</button>");
							}else{
								$frcDelete = $("<td>");
							}
							$tr.append($frcWriter);
							$tr.append($frcContent);
							$tr.append($frcRegDate);
							$tr.append($frcDelete);
							$tableBody.append($tr);
						}
					}else{
						$tr = $("<tr>");
						$frcContent = $("<td colspan='4'>").text("등록된 댓글이 없어요");
						$tr.append($frcContent);
						$tableBody.append($tr);
					}
				}
			})
		}
		function frcDelete(frcKey) {
			var question = confirm("삭제하시겠습니까?");
			if(question){
				$.ajax({
					url : "frCommentDelete.do",
					type : "get",
					data : {"frcKey" : frcKey},
					success : function(data) {
						if (data == "success") {
							alert('삭제되었습니다.');
							getReplyList(); // 댓글리스트를 불러오는 function 추가
							$("#content").val("");
						}else {
							alert("댓글 삭제 실패..");
						}
					}
				});
			}
			
		};
		function back(){
			location.href="foodZoneReviewListView.do?foodZoneKey="+${fReview.foodZoneKey};
		}
		function upChk(){
			location.href="${frUpdate}";
		}
		function chk(){
			var question = confirm("게시글을 삭제하시겠어요?");
			if(question){
				location.href='${frDelete}';
				return true;
			}else{
				return false;
			}
		}
	</script>
</body>
</html>