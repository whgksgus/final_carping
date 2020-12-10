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
		<h2 class="h2">리뷰게시판 - 장소 검색</h2>
	</div>
	<br>
	<form id="form">
	<div style="text-align:center;">
		<select id="searchCondition" name="searchCondition">
			<option value="장소명">장소명</option>
			<option value="주소">주소</option>
		</select>&nbsp;&nbsp;
		<input type="text" id="searchValue" name="searchValue" size="50;" required/>&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" value="검색" id="search"/>
	</div>
	</form>

	<br>
	<br>
	
	<table>
		<tr>
			<th>장소명</th>
			<th>주소</th>
			<th>선택</th>
		</tr>
	
	</table>
	
	<script>
		$('#search').on("click", function() {
			var type = $("#searchCondition").val();
			var search = $("#searchValue").val();
			
			$.ajax({
				url : "placeReviewSearch.do",
				type : "POST",
				data : {"searchCondition" : type, "searchValue" : search},
				success : function(data) {
					alert(data);
				}
			})
		})
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