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
                	  ${areview.arTitle }
                </div>
                <br>
                <textarea style="font-size:20px; resize:none; margin-left:150px; width: 60%; height: 270px;" readonly>${areview.arContent }
                </textarea>
                <br>
                <c:if test="${areview.arPhoto ne null }">
                <img style="margin-left:150px;" width="500px" height="300px" src="../../../resources/areaImage/${areview.arPhoto }"/>
                </c:if>
                <br>
                
                <div style="margin-left:150px;">
  					별점 : ${areview.arScore }              
                </div>
	<br>
	<br>
	<!-- 댓글 목록 -->
	<table align="center" width="500" border="1" cellspacing="0" id="arctb">
		<thead>
		<tr>
			<td colspan="4"><b id="arcCount"></b></td>
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
	<c:url var="arDelete" value="areaReviewDelete.do">
		<c:param name="arKey" value="${areview.arKey }"></c:param>
		<c:param name="areaKey" value="${areaKey }"></c:param>
	</c:url>
	<c:url var="arUpdate" value="areaReviewUpdateView.do">
		<c:param name="arKey" value="${areview.arKey }"></c:param>
		<c:param name="alaceKey" value="${areaKey }"></c:param>
	</c:url>
	<c:url var="arList" value="areaReviewListView.do">
    	<c:param name="areaKey" value="${areaKey }"></c:param>
    </c:url>
		<c:if test="${areview.memberId eq loginUser.memberId }"><a href="${arUpdate }">수정하기</a></c:if>
		<c:if test="${areview.memberId eq loginUser.memberId }"><a onclick="return Del();" href="${arDelete }">삭제하기</a></c:if>
		<a href="${arList }">목록으로</a>
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
				/* if(confirm("댓글을 등록하시겠습니까?")) */
				// 댓글 등록 ajax
				var arcContent = $("#content").val();
				var arKey = ${areview.arKey };
				$.ajax({
					url : "arCommentAdd.do",
					type : "post",
					data : {"arcContent" : arcContent, "arKey" : arKey},
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
			
			var prKey = ${areview.arKey };
			$.ajax({
				url : "arCommentList.do",
				type : "get",
				data : {"arKey" : arKey},
				dataType : "json",
				success : function(data) {
					// db에 있는 데이터를 json형태로 가져와서
					// 댓글 목록 테이블의 tbody에 넣어주어야 함.
					$tableBody = $("#arctb tbody");
						$tableBody.html("<th>작성자</th><th>내용</th><th>작성일자</th><th>삭제</th></tr>"); // tbody에 존재하는 값을 초기화
					var $tr;
					var $arcWriter;
					var $arcContent;
					var $arcRegDate;
					var $arcDelete;
					$("#arcCount").text("댓글 (" + data.length + ")"); // 댓글의 개수 표시
					if (data.length > 0) {;
						for (var i in data) {
							var checkId = '${loginUser.memberId}';
							$tr = $("<tr>");
							$arcWriter = $("<td width='100'>").text(data[i].arcWriter);
							$arcContent = $("<td>").text(decodeURIComponent(data[i].arcContent).replace(/\+/g, " "));
							$arcRegDate = $("<td width='100'>").text(data[i].arcRegDate);
							$memberId = data[i].arcWriter;
							if(checkId == $memberId) {
							$arcDelete = $("<td width='48'><input type='button' id='arcDelete' onclick='arcDelete("+data[i].arcKey+");' value='삭제'>");
							}else {
								$prcDelete = $("<td width='48'>");
							}
							$tr.append($arcWriter);
							$tr.append($arcContent);
							$tr.append($arcRegDate);
							$tr.append($arcDelete);
							$tableBody.append($tr);
						}
					} else {
						$tr = $("<tr>");
						$arcContent = $("<td colspan='4'>").text("등록된 댓글이 없습니다.");
						
						$tr.append($arcContent); // <tr><td colspan='3'>no reply</td></tr>
						$tableBody.append($tr);
					}
				}
			})
			
		}
		
//		$("#prcDelete").on("click", function() {
		function arcDelete(arcKey) {
			$.ajax({
				url : "arCommentDelete.do",
				type : "get",
				data : {"arcKey" : arcKey},
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
	<script>
		function Del() {
			return confirm("리뷰를 삭제하시겠습니까?")
		}
		
		function Submit() {
			var sb = document.getElementById('submit');
			
			sb.onclick = function() {
				if(content == "") {
					alert('내용을 입력해주세요');
				}
			}
		}
		
		/* function CommentAdd() {
			return confirm("댓글을 등록하시겠습니까?")
		} 
		
		function DeleteAdd() {
			return confirm("댓글을 삭제하시겠습니까?")
		}
		
		function CommentAdd(){
			var question = confirm('댓글을 등록하시겠습니까?');
			if(question){
				return true;
				}
			}else{
				return false;
         } */
		
	</script>
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