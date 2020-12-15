<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰게시판 - 명소 검색</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
	<jsp:include page="../common/nav.jsp"></jsp:include>
	<br>
	<br>

	<div style="margin-left: 100px;">
		<h2 class="h2">리뷰게시판 - 명소 검색</h2>
		<div style="width: 350px; border-bottom: 2px solid lightgray;"></div>
	</div>
	<br>
	<form id="form" action="placeReviewSearch.do" method="get">
	<div style="text-align:center;">
		<select id="searchCondition" name="searchCondition">
			<option value="장소명" <c:if test="${search.searchCondition == '장소명'}">selected</c:if>>장소명</option>
			<option value="주소" <c:if test="${search.searchCondition == '주소'}">selected</c:if>>주소</option>
		</select>&nbsp;&nbsp;
		<input type="text" id="searchValue" name="searchValue" size="50;" value="${search.searchValue }" required/>&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="submit" value="검색" id="search"/>
	</div>
	</form>

	<br>
	<br>
	
	<!-- 검색 결과 출력  -->
	<form action="placeReviewListView.do" method="get">
	<table align="center" border="1" width="700">
		<tr text-align="center">
			<th width="300">장소명</th>
			<th width="300">주소</th>
			<th>선택</th>
		</tr>
		<c:forEach items="${pList }" var="list">
		<tr>
			<td>${list.placeName }</td>
			<td>${list.placeAddress }</td>
			<td><input type="radio" name="placeKey" value="${list.placeKey }" required/></td>
		</tr>
		</c:forEach>
	</table>
	<br>
	
	<c:if test="${pList ne null || !empty pList }">
	<div align="center">
				<!-- 이전 -->
				<c:if test="${pi.currentPage <= 1 }">
					[이전]&nbsp;
				</c:if>
				<c:if test="${pi.currentPage > 1 }">
					<c:url var="before" value="placeReviewSearch.do">
						<c:param name="searchCondition" value="${search.searchCondition }"></c:param>
						<c:param name="searchValue" value="${search.searchValue }"></c:param>
						<c:param name="page" value="${pi.currentPage - 1 }"></c:param>
					</c:url>
					<a href="${before }">[이전]</a>&nbsp;
				</c:if>
				<!-- 페이지  -->
				<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
					<c:if test="${pi.currentPage == p }">
             	  	   <b style="color:blue">${p }</b>&nbsp;
            	  	</c:if>
            	  	<c:if test="${pi.currentPage != p }">
					<c:url var="pagination" value="placeReviewSearch.do">
						<c:param name="searchCondition" value="${search.searchCondition }"></c:param>
						<c:param name="searchValue" value="${search.searchValue }"></c:param>
						<c:param name="page" value="${p}"></c:param>
					</c:url>
					<a href="${pagination }">${p }</a>&nbsp;
					</c:if>
				</c:forEach>
				<!-- 다음 -->
				<c:if test="${pi.currentPage >= pi.maxPage }">
					[다음]&nbsp;
				</c:if>
				<c:if test="${pi.currentPage < pi.maxPage }">
					<c:url var="after" value="placeReviewSearch.do">
						<c:param name="searchCondition" value="${search.searchCondition }"></c:param>
						<c:param name="searchValue" value="${search.searchValue }"></c:param>
						<c:param name="page" value="${pi.currentPage + 1 }"></c:param>
					</c:url>
					<a href="${after }">[다음]</a>&nbsp;
				</c:if>
			</div>
	</c:if>
	
	<c:if test="${pList ne null || !empty pList }">
	<input style="margin-left:1060px;" type="submit" value="다음"/>
	</c:if>
	
	</form>
	<script>
	
	/* var arr = [];
		$('#search').on("click", function() {
			var type = $("#searchCondition").val();
			var search = $("#searchValue").val();
			
			$.ajax({
				url : "placeReviewSearch.do",
				type : "POST",
				data : {"searchCondition" : type, "searchValue" : search},
				success : function(data) {
				<c:forEach items="${pList}" var="list">
				var name = ${list.placeName};
				var addr = "${list.placeAddress}";
				for (var i in data) {
					$("tab tbody")
				}
				</c:forEach>
				}
			});
		}) */
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
	<br>
	<br>
</body>
</html>