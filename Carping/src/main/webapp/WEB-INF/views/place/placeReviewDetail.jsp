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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" type='text/css'
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
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
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
	<div id="ex1" class="modal" align="center" style="text-align:center; width:500px; height:500px; padding: 0px;">
		  <img src="../../../resources/placeImage/${preview.prPhoto}" style="width: 500px; height: 500px; ">
	</div>
	<jsp:include page="../common/nav.jsp"></jsp:include>
	<section style="width:100%; height:1000px;">
		<div style="height:100px;"></div>
		<div align="center">
			<h2 class="h2" style="font-weight:bold; font-family: 'Sunflower', sans-serif;">리뷰게시판 - 상세보기</h2>
			<div style="width: 350px; border-bottom: 2px solid lightgray;"></div>
		</div>
		<br><br>
		<article>
			<div class="container" style="font-family: 'Sunflower', sans-serif;">
				<div class="col-md-2"></div>
				<div class="col-md-8 vcenter">
					<label class="col-md-2 text-center vcenter" style="font-size: 1.5em;">제목</label><input type="text" readonly="readonly" value="${preview.prTitle }" class="col-md-8 form-control align-self-center" style="width : 50%;">
                <div id='star'>
					<div id="stars">
						<span class='star-rating'>
							<c:choose>
								<c:when test="${preview.prScore == 1}">
									<span style ='width:20%;'>
									</span>
								</c:when>
								<c:when test="${preview.prScore == 2}">
									<span style ='width:40%;'>
									</span>
								</c:when>
								<c:when test="${preview.prScore == 3}">
									<span style ='width:60%;'>
									</span>
								</c:when>
								<c:when test="${preview.prScore == 4}">
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
					<label class="col-md-2 text-center vcenter" style="font-size: 1.5em;">내용</label><textarea class="col-md-6 form-control" cols="5" rows="10" style="margin: 0px; width: 564px; height: 325px; resize: none;" readonly="readonly">${preview.prContent }</textarea>
				</div>
				<div class="col-md-2"></div>
			</div>
                <br>
                <div class="container" style="font-family: 'Sunflower', sans-serif;">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<label class="col-md-2 text-center vcenter" style="font-size: 1.5em;">사진</label>
					
					<c:choose>
						<c:when test="${preview.prPhoto eq null}">
							<p style="font-family: 'Sunflower', sans-serif;">첨부파일이 없습니다.</p>
						</c:when>
						<c:otherwise>
							<a id="modalTag" href="#ex1" rel="modal:open"><img src="../../../resources/images/camera.jpg" style="width: 40px; height: 40px;"></a>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="col-md-2"></div>
			</div>
                <br><br>
                <div class="container"  style="font-family: 'Sunflower', sans-serif;">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<label class="col-md-2 text-center vcenter" style="font-size: 1.5em;">댓글</label>
					<table id="prctb" class="col-md-6 table" style="width: 560px; font-family: 'Sunflower', sans-serif; font-weight:bold;">
						<thead>
							<tr>
								<td colspan="4"><b id="prcCount"></b></td>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table>
				</div>
				<div class="col-md-2"></div>
			</div>
			<br>
			<div class="container" style="font-family: 'Sunflower', sans-serif; ">
				<div class="col-md-2"></div>
				<div class="col-md-9" style="margin-left: -20px;">
					<label class="col-md-2 text-center vcenter" style="font-size: 1.5em;">
						
					</label>
					<table class="col-md-6 table" style="width: 560px;">
						<thead>
							<tr>
								<td>
									<textarea id="content" rows="5" cols="10" style="width: 543px; height: 67px; resize: none;"></textarea>
								</td>
								<td>
									<button class="btn btn-default" style="width: 70px; height: 70px;" id="submit">등록</button>
								</td>
							</tr>
						</thead>
					</table>
				</div>
				<div class="col-md-1"></div>
			</div>
			<div class="container" style="font-family: 'Sunflower', sans-serif; ">
				<div class="col-md-2"></div>
				<div class="col-md-8" style="margin-left: -30px;">
					<div class="col-md-3"></div>
					<button class="col-md-2 btn btn-default" style="height: 40px; font-family: 'Sunflower', sans-serif; font-weight:bold;" onclick="back();">목록으로</button>
					<c:url var="prList" value="placeReviewListView.do">
    						<c:param name="placeKey" value="${placeKey }"></c:param>
    				</c:url>
					<c:if test="${preview.memberId eq loginUser.memberId}">
						<c:url var="prUpdate" value="placeReviewUpdateView.do">
							<c:param name="prKey" value="${preview.prKey }"></c:param>
							<c:param name="placeKey" value="${placeKey }"></c:param>
						</c:url>
						<c:url var="prDelete" value="placeReviewDelete.do">
							<c:param name="prKey" value="${preview.prKey }"></c:param>
							<c:param name="placeKey" value="${placeKey }"></c:param>
						</c:url>
						<div class="col-md-1"></div>
						<button class="col-md-2 btn btn-default" style="height: 40px;font-family: 'Sunflower', sans-serif; font-weight:bold;" onclick="return upChk();">수정</button>
						<div class="col-md-1"></div>
						<button class="col-md-2 btn btn-danger" style="height: 40px; font-family: 'Sunflower', sans-serif; font-weight:bold;" onclick= "return chk();">삭제</button>
					</c:if>
				</div>
				<div class="col-md-2"></div>
			</div>
		<br><br>
		</article>
		<!--footer-->
	<jsp:include page="../../../WEB-INF/views/common/footer.jsp"/>
	</section>
	<script>
		$(function() {
			getReplyList();
			// ajax polling
			// 타 회원이 댓글들을 작성했을 수도 있으므로 지속적으로 댓글 불러오기
			setInterval(function() {
				 getReplyList();
			}, 3000);
			$("#submit").on("click", function() {
				var prcContent = $("#content").val();
				var prKey = ${preview.prKey };
				if(prcContent == "") {
					alert('댓글 내용을 입력해주세요');
				}else {
				$.ajax({
					url : "prCommentAdd.do",
					type : "post",
					data : {"prcContent" : prcContent, "prKey" : prKey},
					success : function(data) {
						if (data == "success") {
							getReplyList(); // 댓글리스트를 불러오는 function 추가
							$("#content").val("");
						}else {
							alert("등록 실패");
						}
					}
				});
				}
			});	
		})
		
		// 댓글 리스트를 불러오는 ajax Function
		function getReplyList() {
			
			var prKey = ${preview.prKey };
			$.ajax({
				url : "prCommentList.do",
				type : "get",
				data : {"prKey" : prKey},
				dataType : "json",
				success : function(data) {
					// db에 있는 데이터를 json형태로 가져와서
					// 댓글 목록 테이블의 tbody에 넣어주어야 함.
					$tableBody = $("#prctb tbody");
					$tableBody.html("<tr><th width='100px;' class='text-center'>작성자</th><th>내용</th><th width='110px;' class='text-center'>작성일자</th><th width='70px;' class='text-center'>삭제</th></tr>");
					var $tr;
					var $prcWriter;
					var $prcContent;
					var $prcRegDate;
					var $prcDelete;
					$("#prcCount").text("댓글 ("+data.length+")");
					if (data.length > 0) {;
						for (var i in data) {
							var checkId = '${loginUser.memberId}';
							$tr = $("<tr>");
							$prcWriter = $("<td width='100'>").text(data[i].prcWriter);
							$prcContent = $("<td>").text(decodeURIComponent(data[i].prcContent).replace(/\+/g, " "));
							$prcRegDate = $("<td width='100'>").text(data[i].prcRegDate);
							$memberId = data[i].prcWriter;
							if(checkId == $memberId) {
							$prcDelete = $("<td><button style = 'padding : 0px 20px;' class='btn btn-danger' id='prcDelete' onclick='prcDelete("+data[i].prcKey+");'>X</button>");
							}else {
								$prcDelete = $prcDelete = $("<td>");
							}
							$tr.append($prcWriter);
							$tr.append($prcContent);
							$tr.append($prcRegDate);
							$tr.append($prcDelete);
							$tableBody.append($tr);
						}
					} else {
						$tr = $("<tr>");
						$prcContent = $("<td colspan='4'>").text("등록된 댓글이 없어요");
						$tr.append($prcContent); // <tr><td colspan='3'>no reply</td></tr>
						$tableBody.append($tr);
					}
				}
			})
			
		}
		
//		$("#prcDelete").on("click", function() {
		function prcDelete(prcKey) {
			var question = confirm("삭제하시겠습니까?");
			if(question) {
			$.ajax({
				url : "prCommentDelete.do",
				type : "get",
				data : {"prcKey" : prcKey},
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
	</script>
	<script>
		
		function back(){
			location.href="${prList}";
		}
		
		function upChk(){
			location.href="${prUpdate}";
		}
		function chk(){
			var question = confirm("게시글을 삭제하시겠어요?");
			if(question){
				location.href='${prDelete}';
				return true;
			}else{
				return false;
			}
		}
		
	</script>
</body>
</html>