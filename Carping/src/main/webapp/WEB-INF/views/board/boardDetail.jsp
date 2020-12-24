<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
<!-- 상단 아이콘 -->
<link rel="shortcut icon" type="image/x-icon" href="resources/images/carpingLogo.jpg">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
<style>
	
</style>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap" rel="stylesheet">

</head>
<body>
	<jsp:include page="../common/nav.jsp"></jsp:include>
		<div style="height: 100px;"></div>
	<section style="width:100%; height:1000px;">
		<div align="center">
			<h2 class="h2" style="font-weight:bold; font-family: 'Sunflower', sans-serif;">자유게시판 상세보기</h2>
			<div style="width: 350px; border-bottom: 2px solid lightgray;"></div>
		</div>
		<br><br>
		<article>
			<div class="container" style="font-family: 'Sunflower', sans-serif;">
				<div class="col-md-2"></div>
				<div class="col-md-8 vcenter">
					<label class="col-md-2 text-center vcenter" style="font-family: 'Sunflower', sans-serif;font-size: 1.5em;">제목</label><input type="text" readonly="readonly" value="${board.boardTitle}" class="col-md-8 form-control align-self-center" style="font-family: 'Sunflower', sans-serif; width : 50%;">
				</div>
				<div class="col-md-2"></div>
			</div>
			<br>
			<div class="container" style="font-family: 'Sunflower', sans-serif;">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<label class="col-md-2 text-center vcenter" style="font-family: 'Sunflower', sans-serif;font-size: 1.5em;">내용</label><textarea class="col-md-6 form-control" cols="5" rows="10" style="font-family: 'Sunflower', sans-serif;margin: 0px; width: 564px; height: 325px; resize: none;" readonly="readonly">${board.boardContent}</textarea>
				</div>
				<div class="col-md-2"></div>
			</div>
	
			<br><br>
			<!--   -->
			<div class="container"  style="font-family: 'Sunflower', sans-serif;">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<label class="col-md-2 text-center vcenter" style="font-family: 'Sunflower', sans-serif; font-size: 1.5em;">댓글</label>
					<table id="boardtb" class="col-md-6 table" style="width: 560px;">
						<thead>
							<tr>
								<td colspan="4"><b id="boardCount"></b></td>
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
									<button class="btn btn-default" style="font-family: 'Sunflower', sans-serif; font-weight:bold; width: 70px; height: 70px;" id="submit">등록</button>
								</td>
							</tr>
						</thead>
					</table>
				</div>
				<div class="col-md-1"></div>
			</div>
			<br>
			<div class="container" style="font-family: 'Sunflower', sans-serif; ">
				<div class="col-md-2"></div>
				<div class="col-md-8" style="margin-left: -30px;">
					<div class="col-md-3"></div>
					<button type="button" class="col-md-2 btn btn-default" style="font-family: 'Sunflower', sans-serif; font-weight: bold; height: 40px;" onclick="back();">목록으로</button>
					<c:if test="${board.memberId eq loginUser.memberId}">
						<c:url var="bUpdate" value="boardUpdateForm.do">
							<c:param name="boardKey" value="${board.boardKey}"></c:param>
						</c:url>
						<c:url var="bDelete" value="boardDelete.do">
							<c:param name="boardKey" value="${board.boardKey}"></c:param>
						</c:url>
						<div class="col-md-1"></div>
						<button class="col-md-2 btn btn-default" style="font-family: 'Sunflower', sans-serif;height: 40px;" onclick="return upChk();">수정</button>
						<div class="col-md-1"></div>
						<button class="col-md-2 btn btn-danger" style="font-family: 'Sunflower', sans-serif;height: 40px;" onclick= "return chk();">삭제</button>
					</c:if>
				</div>
				<div class="col-md-2"></div>
			</div>
			<br>
			<br>			
		</article>
		<!--footer-->
	<jsp:include page="../../../WEB-INF/views/common/footer.jsp"/>
	</section>
	<script>
		$(function(){
			getReplyList();
			setInterval(function(){
				getReplyList();
			}, 3000);
			$("#submit").on("click", function(){
				var bContent = $("#content").val();
				var bKey = ${board.boardKey};
				if(bContent == ""){
					alert('댓글을 입력해주세요')
				}else{
					$.ajax({
						url : "brCommentAdd.do",
						type : "post",
						data : {"brContent" : bContent, "boardKey" : bKey},
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
			
			var bKey = ${board.boardKey};
			$.ajax({
				url : "brCommentList.do",
				type : "get",
				data : {"boardKey" : bKey},
				dataType : "json",
				success : function(data){
					$tableBody = $("#boardtb tbody");
					$tableBody.html("<tr><th width='100px;' class='text-center'>작성자</th><th>내용</th><th width='110px;' class='text-center'>작성일자</th><th width='70px;' class='text-center'>삭제</th></tr>");
					var $tr;
					var $brWriter;
					var $brContent;
					var $brRegDate;
					var $brDelete;
					
					$("#boardCount").text("댓글 "+data.length);
					if(data.length>0){
						for(var i in data){
							var checkId = '${loginUser.memberId}';
							$tr = $("<tr>");
							$brWriter = $("<td>").text(data[i].brWriter);
							$brContent = $("<td>").text(decodeURIComponent(data[i].brContent).replace(/\+/g, " "));
							$brRegDate = $("<td>").text(data[i].brRegDate);
							$memberId = data[i].brWriter;
							if(checkId == $memberId){
								$brDelete = $("<td><button style = 'padding : 0px 20px;' class='btn btn-danger' id='brDelete' onclick='brDelete("+data[i].brKey+");'>X</button>");
							}else{
								$brDelete = $("<td>");
							}
							$tr.append($brWriter);
							$tr.append($brContent);
							$tr.append($brRegDate);
							$tr.append($brDelete);
							$tableBody.append($tr);
						}
					}else{
						$tr = $("<tr>");
						$brContent = $("<td colspan='4'>").text("등록된 댓글이 없어요");
						$tr.append($brContent);
						$tableBody.append($tr);
					}
				}
			})
		}
		function brDelete(brKey) {
			var question = confirm("삭제하시겠습니까?");
			if(question){
				$.ajax({
					url : "brCommentDelete.do",
					type : "get",
					data : {"brKey" : brKey},
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
			location.href='BoardInfo.do';
		}
		function upChk(){
			location.href="${bUpdate}";
		}
		function chk(){
			var question = confirm("게시글을 삭제하시겠어요?");
			if(question){
				location.href='${bDelete}';
				return true;
			}else{
				return false;
			}
		}
	</script>
</body>
</html>