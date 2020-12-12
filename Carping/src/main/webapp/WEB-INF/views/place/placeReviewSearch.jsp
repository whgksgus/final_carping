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
	<form id="form" action="placeReviewSearch.do" method="post">
	<div style="text-align:center;">
		<select id="searchCondition" name="searchCondition">
			<option value="장소명">장소명</option>
			<option value="주소">주소</option>
		</select>&nbsp;&nbsp;
		<input type="text" id="searchValue" name="searchValue" size="50;" required/>&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="submit" value="검색" id="search"/>
	</div>
	</form>

	<br>
	<br>
	
	<!-- 검색 결과 출력  -->
	<form action="placeReviewListView.do" method="post">
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
			<td><input type="radio" name="placeKey" value="${list.placeKey }"/></td>
		</tr>
		</c:forEach>
	</table>
	<br>
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