<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰게시판 - 상세보기</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
	<jsp:include page="../common/nav.jsp"></jsp:include>
	<br>
	<br>

	<div style="margin-left: 100px;">
		<h2 class="h2">리뷰게시판 - 상세보기</h2>
		<div style="width: 350px; border-bottom: 2px solid lightgray;"></div>
	</div>
	<br>
                <div style="font-size:20px; margin: 0px auto; width:60%;">
                	  ${preview.prTitle }
                </div>
                <br>
                <textarea style="font-size:20px; resize:none; margin-left:150px; width: 60%; height: 270px;" readonly>${preview.prContent }
                </textarea>
                <br>
                <c:if test="${preview.prPhoto ne null }">
                <img style="margin-left:150px;" width="500px" height="300px" src="../../../resources/placeImage/${preview.prPhoto }"/>
                </c:if>
                <br>
                
                <div style="margin-left:150px;">
  					별점 : ${preview.prScore }              
                </div>
	<br>
	<br>
	<!-- 댓글 목록 -->
	<table align="center" width="500" border="1" cellspacing="0" id="prctb">
		<thead>
		<tr>
			<td colspan="4"><b id="prcCount"></b></td>
		</tr>
		</thead>
		<tbody></tbody>
	</table>
	<br>
	<!-- 댓글 등록 -->
	<table style="margin: 0 auto;">
	<tr>
			<td>
				<input type="text" id="content">
				<button id="submit">등록하기</button>
			</td>
	<tr>
	</table>
	
	
	<br>
	<div align="center">
	<c:url var="prDelete" value="placeReviewDelete.do">
		<c:param name="prKey" value="${preview.prKey }"></c:param>
		<c:param name="placeKey" value="${placeKey }"></c:param>
	</c:url>
	<c:url var="prUpdate" value="placeReviewUpdateView.do">
		<c:param name="prKey" value="${preview.prKey }"></c:param>
		<c:param name="placeKey" value="${placeKey }"></c:param>
	</c:url>
		<a href="${prUpdate }">수정하기</a>
		<a href="${prDelete }">삭제하기</a>
		<a href="#">목록으로</a>
    </div>
	
	
	<script>
		$(function() {
			getReplyList();
			// ajax polling
			// 타 회원이 댓글들을 작성했을 수도 있으므로 지속적으로 댓글 불러오기
			setInterval(function() {
				 getReplyList();
			}, 3000);
			$("#submit").on("click", function() {
				// 댓글 등록 ajax
				var prcContent = $("#content").val();
				var prKey = ${preview.prKey };
				$.ajax({
					url : "prCommentAdd.do",
					type : "post",
					data : {"prcContent" : prcContent, "prKey" : prKey},
					success : function(data) {
						if (data == "success") {
							getReplyList(); // 댓글리스트를 불러오는 function 추가
							$("#content").val("");
						}else {
							alert("댓글 등록 실패..");
						}
					}
				});
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
					$tableBody.html(""); // tbody에 존재하는 값을 초기화
					var $tr;
					var $prcWriter;
					var $prcContent;
					var $prcRegDate;
					var $prcDelete;
					$("#prcCount").text("댓글 (" + data.length + ")"); // 댓글의 개수 표시
					if (data.length > 0) {;
						for (var i in data) {
							$tr = $("<tr>");
							$prcWriter = $("<td width='100'>").text(data[i].prcWriter);
							$prcContent = $("<td>").text(decodeURIComponent(data[i].prcContent).replace(/\+/g, " "));
							$prcRegDate = $("<td width='100'>").text(data[i].prcRegDate);
							$prcDelete = $("<td><input type='button' id='prcDelete' onclick='prcDelete("+data[i].prcKey+");' value='삭제'>");
							$tr.append($prcWriter);
							$tr.append($prcContent);
							$tr.append($prcRegDate);
							$tr.append($prcDelete);
							$tableBody.append($tr);
						}
					} else {
						$tr = $("<tr>");
						$prcContent = $("<td colspan='3'>").text("등록된 댓글이 없습니다.");
						
						$tr.append($prcContent); // <tr><td colspan='3'>no reply</td></tr>
						$tableBody.append($tr);
					}
				}
			})
			
		}
		
//		$("#prcDelete").on("click", function() {
		function prcDelete(prcKey) {
			$.ajax({
				url : "prCommentDelete.do",
				type : "get",
				data : {"prcKey" : prcKey},
				success : function(data) {
					if (data == "success") {
						getReplyList(); // 댓글리스트를 불러오는 function 추가
						$("#content").val("");
					}else {
						alert("댓글 삭제 실패..");
					}
				}
			});
		};
	</script>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
</body>
</html>