<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건의사항 상세보기</title>
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
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
	<jsp:include page="../common/nav.jsp"></jsp:include>
	<section style="width:100%; height:900px;">
		<div style="height:100px;"></div>
		<div align="center">
			<h2 class="h2" style="font-weight:bold; font-family: 'Sunflower', sans-serif;">건의사항 상세보기</h2>
			<div style="width: 350px; border-bottom: 2px solid lightgray;"></div>
		</div>
		<br><br>
		<article>
			<div class="container" style="font-family:'Sunflower', sans-serif;">
				<div class="col-md-2"></div>
				<div class="col-md-8 vcenter">
					<label class="col-md-2 text-center vcenter" style="font-size: 1.5em;">제목</label><input type="text" value="${sList.suggestionTitle }" class="col-md-8 form-control align-self-center" readonly style="width : 564px;">
				</div><br><br>
				<div class="col-md-2"></div>
			</div>
			<div class="container" style="font-family: 'Sunflower', sans-serif;">
				<div class="col-md-2"></div>
				<div class="col-md-8 vcenter">
				<label class="col-md-2 text-center vcenter" style="font-size: 1.5em;">내용</label><textarea class="col-md-6 form-control" cols="5" rows="10" style="margin: 0px; width: 564px; height: 300px;resize: none;" readonly>${sList.suggestionContent }</textarea>
				</div>
				<div class="col-md-1"></div>
				</div>
				<br><br>
				
				<!-- 답변 있을 경우  -->
				<c:if test="${answer.answerTitle ne null }">
				<div class="container" style="font-family:'Sunflower', sans-serif;">
				<div class="col-md-2"></div>
				<div class="col-md-8 vcenter">
					<label class="col-md-2 text-center vcenter" style="font-size: 1.5em;">답변</label><input type="text" value="${answer.answerTitle}" class="col-md-8 form-control align-self-center" readonly style="width : 564px;">
				</div>
				<div class="col-md-2"></div>
				</div>
				<div class="container" style="font-family: 'Sunflower', sans-serif;">
				<div class="col-md-2"></div>
				<div class="col-md-8 vcenter">
				<label class="col-md-2 text-center vcenter" style="font-size: 1.5em;"></label><textarea class="col-md-6 form-control" cols="5" rows="10" style="margin: 0px; width: 564px; height: 120px; resize: none;" readonly>${answer.answerContent}</textarea>
				</div>
				<div class="col-md-1"></div>
				</div>
				<br><br>
				</c:if>
				<!-- 답변 없을 경우  -->
				<c:if test="${answer.answerTitle eq null }">
				<div class="container" style="font-family:'Sunflower', sans-serif;">
				<div class="col-md-2"></div>
				<div class="col-md-8 vcenter">
					<label class="col-md-2 text-center vcenter" style="font-size: 1.5em;"></label><input type="text" value="빠른 시일 내에 답변드리겠습니다!!" class="col-md-8 form-control align-self-center" readonly style="width : 564px;">
				</div>
				</div>
				<br><br>
				</c:if>
				<!-- 여기서부터는 버튼 url 등등임  -->
				<div class="container" style="font-family: 'Sunflower', sans-serif;"></div>
            	<div class="col-md-2"></div>
            	<div class="col-md-5" style="margin-left:100px;">
            	<div class="col-md-4"></div>
            	
            	<!-- 관리자도 아니고 작성자도 아닐때(목록만) -->
            	<c:if test="${sList.memberId ne loginUser.memberId && loginUser.memberId ne 'admin'}">
            	<c:url var="sugList" value="selectList.do"></c:url>
				<button class="col-md-2 btn btn-default" style="height: 40px; font-family: 'Sunflower', sans-serif; font-weight:bold; margin-left:190px;" onclick="back();">목록으로</button>
				<div class="col-md-1"></div>
				</c:if>
				
				<c:if test="${sList.memberId eq loginUser.memberId || 'admin' eq loginUser.memberId }">
            	<c:url var="sugList" value="selectList.do"></c:url>
				<button class="col-md-2 btn btn-default" style="height: 40px; font-family: 'Sunflower', sans-serif; font-weight:bold;" onclick="back();">목록으로</button>
				<div class="col-md-1"></div>
				</c:if>
				
				<c:url var="sugUpdate" value="sugUpdateView.do"><c:param name="suggestionKey" value="${sList.suggestionKey }"></c:param></c:url>
				<c:if test="${sList.memberId eq loginUser.memberId || 'admin' eq loginUser.memberId}">
				<button class="col-md-2 btn btn-default" style="height: 40px; font-family: 'Sunflower', sans-serif; font-weight:bold;" onclick="return sugUpdate();">수정</button></c:if>
				<div class="col-md-1"></div>
				
				<c:url var="sugDelete" value="sugDelete.do"><c:param name="suggestionKey" value="${sList.suggestionKey }"></c:param></c:url>
				<c:if test="${sList.memberId eq loginUser.memberId || 'admin' eq loginUser.memberId}">
				<button class="col-md-2 btn btn-danger" style="height: 40px; font-family: 'Sunflower', sans-serif; font-weight:bold;" onclick= "return sugDelete();">삭제</button></c:if>
				</div>
				<br><br><br>
				
				<div class="col-md-2"></div>
				<div class="col-md-5" style="margin-left:100px;">
            	<div class="col-md-4"></div>
				<c:url var="insertAnswer" value="insertAnswerView.do">
    			<c:param name="suggestionKey" value="${sList.suggestionKey }"></c:param></c:url>
				<c:if test="${'admin' eq loginUser.memberId }">
				<button id="answerinsertbtn" class="col-md-2 btn btn-default" style="height: 40px; font-family: 'Sunflower', sans-serif; font-weight:bold;">답변 등록</button></c:if>
				<div class="col-md-1"></div>
				
				<c:url var="updateAnswer" value="updateAnswerView.do">
    			<c:param name="suggestionKey" value="${sList.suggestionKey }"></c:param></c:url>
				<c:if test="${'admin' eq loginUser.memberId }">
				<button id="answerupdatebtn" class="col-md-2 btn btn-default" style="height: 40px; font-family: 'Sunflower', sans-serif; font-weight:bold;">답변 수정</button></c:if>
				<div class="col-md-1"></div>
				
				<c:url var="deleteAnswer" value="deleteAnswer.do">
    			<c:param name="suggestionKey" value="${sList.suggestionKey }"></c:param></c:url>
				<c:if test="${'admin' eq loginUser.memberId }">
				<button id="answerdeletebtn" class="col-md-2 btn btn-danger" style="height: 40px; font-family: 'Sunflower', sans-serif; font-weight:bold;" onclick="return answerDelete();">답변 삭제</button></c:if>
				<div class="col-md-1"></div>
				</div>
				<div class="col-md-2"></div>
               </article>
	</section><br><br><br>
    <!--footer-->
	<jsp:include page="../../../WEB-INF/views/common/footer.jsp"/>
	<script>
	function back(){
		location.href='${sugList}';
	}
	
	function sugUpdate(){
		location.href='${sugUpdate}';
	}
		
	function sugDelete(){
		var question = confirm("게시글을 삭제하시겠어요?");
		if(question){
			location.href='${sugDelete}';
			return true;
		}else{
			return false;
		}
	}
	
	function answerDelete(){
		var question = confirm("답변을 삭제하시겠어요?");
		if(question){
			location.href='${deleteAnswer}';
			return true;
		}else{
			return false;
		}
	}
	</script>
	
	<script>
		$(document).ready(function () {
		    $('#answerinsertbtn').click(function() {
		    var check = '<c:out value="${answer.answerTitle}"/>';
		    if(check != "") {
				alert('답변 수정이나 답변 삭제 후 이용해주세요');
				location.href='selectOne.do?suggestionKey=${answer.suggestionKey}';
		    }else {
		    	location.href='${insertAnswer}';
		    }
		    });
		});
		
		$(document).ready(function () {
		    $('#answerupdatebtn').click(function() {
		    var check = '<c:out value="${answer.answerTitle}"/>';
		    if(check == "") {
				alert('답변 등록 먼저 진행 후 시도해주세요');
				location.href='selectOne.do?suggestionKey=${sList.suggestionKey}';
		    }else {
		    	location.href='${updateAnswer}';
		    }
		    });
		});
		
		$(document).ready(function () {
		    $('#answerdeletebtn').click(function() {
		    var check = '<c:out value="${answer.answerTitle}"/>';
		    if(check == "") {
				alert('답변 등록 먼저 진행 후 시도해주세요');
				location.href='selectOne.do?suggestionKey=${sList.suggestionKey}';
		    }else {
		    	location.href='${deleteAnswer}';
		    }
		    });
		});
	</script>
</body>
</html>