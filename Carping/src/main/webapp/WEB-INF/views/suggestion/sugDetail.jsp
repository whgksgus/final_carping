<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건의사항 - 상세보기</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
	<jsp:include page="../common/nav.jsp"></jsp:include>
	<br>
	<br>

	<div style="margin-left: 100px;">
		<h2 class="h2">건의사항 - 상세보기</h2>
		<div style="width: 350px; border-bottom: 2px solid lightgray;"></div>
	</div>
	<br>
                <div style="font-size:20px; margin: 0px auto; width:60%;">
                	  ${sList.suggestionTitle }
                </div>
                <br>
                <textarea style="font-size:20px; resize:none; margin-left:150px; width: 60%; height: 270px;" readonly>${sList.suggestionContent }
                </textarea>
                <br>
                
	<div align="center">
	<c:url var="sugUpdate" value="sugUpdateView.do">
		<c:param name="suggestionKey" value="${sList.suggestionKey }"></c:param>
	</c:url>
	<c:url var="sugDelete" value="sugDelete.do">
		<c:param name="suggestionKey" value="${sList.suggestionKey }"></c:param>
	</c:url>
	<c:url var="sugList" value="selectList.do">
    </c:url>
    <c:url var="insertAnswer" value="insertAnswerView.do">
    	<c:param name="suggestionKey" value="${sList.suggestionKey }"></c:param>
    </c:url>
    <c:url var="deleteAnswer" value="deleteAnswer.do">
    	<c:param name="suggestionKey" value="${sList.suggestionKey }"></c:param>
    </c:url>
		<c:if test="${sList.memberId eq loginUser.memberId }"><a href="${sugUpdate }">수정하기</a></c:if>
		<c:if test="${sList.memberId eq loginUser.memberId || 'admin' eq loginUser.memberId}"><a onclick="return Del();" href="${sugDelete }">삭제하기</a></c:if>
		<a href="${sugList }">목록으로</a>
		<!-- 관리자 답변  -->
		<c:if test="${'admin' eq loginUser.memberId }"><a href="${insertAnswer }">답변 등록</a></c:if>
		<c:if test="${'admin' eq loginUser.memberId }"><a href="${deleteAnswer }">답변 삭제</a></c:if>
		
    </div>
	
	
	
	<script>
		function Del() {
			return confirm("건의사항을 삭제하시겠습니까?")
		}
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