<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건의사항 상세보기</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" type='text/css' href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
	<jsp:include page="../common/nav.jsp"></jsp:include>
	<section style="margin-top: 40px;">
		<h3 style="font-family: 'Sunflower', sans-serif; margin-left: 100px;">건의사항 상세보기</h3>
		<br><br><br>
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
					<label class="col-md-2 text-center vcenter" style="font-size: 1.5em;"></label><input type="text" value="${answer.answerTitle}" class="col-md-8 form-control align-self-center" readonly style="width : 564px;">
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
            	<c:url var="sugList" value="selectList.do"></c:url>
				<button class="col-md-2 btn btn-default" style="height: 40px;" onclick="back();">목록으로</button>
				<div class="col-md-1"></div>
				
				<c:url var="sugUpdate" value="sugUpdateView.do"><c:param name="suggestionKey" value="${sList.suggestionKey }"></c:param></c:url>
				<c:if test="${sList.memberId eq loginUser.memberId || 'admin' eq loginUser.memberId}">
				<button class="col-md-2 btn btn-default" style="height: 40px;" onclick="return sugUpdate();">수정</button></c:if>
				<div class="col-md-1"></div>
				
				<c:url var="sugDelete" value="sugDelete.do"><c:param name="suggestionKey" value="${sList.suggestionKey }"></c:param></c:url>
				<c:if test="${sList.memberId eq loginUser.memberId || 'admin' eq loginUser.memberId}">
				<button class="col-md-2 btn btn-danger" style="height: 40px;" onclick= "return sugDelete();">삭제</button></c:if>
				</div>
				<br><br><br>
				
				<div class="col-md-2"></div>
				<div class="col-md-5" style="margin-left:100px;">
            	<div class="col-md-4"></div>
				<c:url var="insertAnswer" value="insertAnswerView.do">
    			<c:param name="suggestionKey" value="${sList.suggestionKey }"></c:param></c:url>
				<c:if test="${'admin' eq loginUser.memberId }">
				<button class="col-md-2 btn btn-default" style="height: 40px;" onclick="return answerInsert();">답변 등록</button></c:if>
				<div class="col-md-1"></div>
				
				<c:url var="insertAnswer" value="insertAnswerView.do">
    			<c:param name="suggestionKey" value="${sList.suggestionKey }"></c:param></c:url>
				<c:if test="${'admin' eq loginUser.memberId }">
				<button class="col-md-2 btn btn-default" style="height: 40px;" onclick="return answerInsert();">답변 수정</button></c:if>
				<div class="col-md-1"></div>
				
				<c:url var="deleteAnswer" value="deleteAnswer.do">
    			<c:param name="suggestionKey" value="${sList.suggestionKey }"></c:param></c:url>
				<c:if test="${'admin' eq loginUser.memberId }">
				<button class="col-md-2 btn btn-danger" style="height: 40px;" onclick="return answerDelete();">답변 삭제</button></c:if>
				<div class="col-md-1"></div>
				</div>
				<div class="col-md-2"></div>
               </article>
	
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
	
	/* function answerInsert(){
			var test = ${answer.answerContent};
			if (test != "") {
				alert('답변 삭제 먼저 진행 후 시도해주세요');
				location.href='${sugList}';
			}else {
				location.href='${insertAnswer}';		
			}
		} */
		
		function answerInsert(){
			location.href='${insertAnswer}';		
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
		
	</script>
	<br><br><br>
</body>
</html>