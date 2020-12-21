<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>명소 리뷰게시판 검색</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
	<jsp:include page="../common/nav.jsp"></jsp:include>
	<section style="margin-top:40px;">
		<article>
			<h3>명소 검색</h3>
	<form action="placeReviewSearch.do" method="get">
	<div class="container">
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-8" style="float:left;">
		<select id="searchCondition" name="searchCondition" class="form-control col-sm-2" style="width:20%; text-align:center;"> 
			<option value="명소이름" <c:if test="${search.searchCondition == '명소이름'}">selected</c:if>>명소 이름</option>
			<option value="주소" <c:if test="${search.searchCondition == '주소'}">selected</c:if>>주소</option>
		</select>&nbsp;
		<input type="text" class="form-control col-sm-7" style="width:50%;" id="searchValue" name="searchValue" value="${search.searchValue }"/>&nbsp;
		<input type="submit" class="btn btn-default col-sm-1" value="검색" id="search"/>
	</div>
	<div class="col-sm-2"></div>
	</div>
	</div>
	</form>
	<br><br><br>
	<!-- 검색 결과 출력  -->
	<form action="placeReviewListView.do" method="get">
	<div class="container">
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-7">
		<table class="table table-striped" style="text-align:center;">
			<tr>
			<th class="col-md-3 text-center">장소명</th>
			<th class="col-md-7 text-center">주소</th>
			<th class="col-md-2">선택</th>
		</tr>
		<c:forEach items="${pList }" var="list" varStatus="status">
		<tr>
			<td>${list.placeName }</td>
			<td>${list.placeAddress }</td>
			<c:if test="${status.count eq 1 }">
				<td class="text-center"><input type="radio" name="placeKey" value="${list.placeKey }" class="radio" checked="checked"></td>
			</c:if>
			<c:if test="${status.count ne 1 }">
				<td class="text-center"><input type="radio" name="placeKey" value="${list.placeKey }" class="radio"></td>
			</c:if>
		</tr>
		</c:forEach>
	</table>
	</div>
	<div class="col-sm-3"></div>
	</div>
	</div>
		<div class="container">
		<div class="col-sm-2"></div>
			<div class="col-sm-7">
			<c:if test="${pList ne null || !empty pList }">
			<input type="submit" class="btn btn-success" style="width:100%;" value="리뷰 보러 가기!" onsubmit="return chk();"/>
			</c:if>
		</div>
			<div class="col-sm-3"></div>
			</div>
			<br><br>
			</form>
			</article>
			</section>
	
	<c:if test="${pList ne null || !empty pList }">
	<div class="container">
		<div class="col-md-11 text-center">
			<ul class="pagination pagionation-sm">
				<!-- 이전 -->
				<c:if test="${pi.currentPage <= 1 }">
					<li class="page-item"><a href="javascript:void(0);" class="page-link">이전</a>
				</c:if>
				<c:if test="${pi.currentPage > 1 }">
					<c:url var="before" value="placeReviewSearch.do">
						<c:param name="searchCondition" value="${search.searchCondition }"></c:param>
						<c:param name="searchValue" value="${search.searchValue }"></c:param>
						<c:param name="page" value="${pi.currentPage - 1 }"></c:param>
					</c:url>
					<li class="page-item"><a href="${before}" class="page-link">이전</a></li>
				</c:if>
				<!-- 페이지  -->
				<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
					<c:if test="${pi.currentPage == p }">
             	  	   <li class="page-item"><a href="javascript:void(0);" class="page-link">${p}</a></li>
            	  	</c:if>
            	  	<c:if test="${pi.currentPage != p }">
					<c:url var="pagination" value="placeReviewSearch.do">
						<c:param name="searchCondition" value="${search.searchCondition }"></c:param>
						<c:param name="searchValue" value="${search.searchValue }"></c:param>
						<c:param name="page" value="${p}"></c:param>
					</c:url>
					<li class="page-item"><a href="${pagination}" class="page-link">${p}</a></li>
					</c:if>
				</c:forEach>
				<!-- 다음 -->
				<c:if test="${pi.currentPage >= pi.maxPage }">
					<li class="page-item"><a href="javascript:void(0);" class="page-link">다음</a></li>
				</c:if>
				<c:if test="${pi.currentPage < pi.maxPage }">
					<c:url var="after" value="placeReviewSearch.do">
						<c:param name="searchCondition" value="${search.searchCondition }"></c:param>
						<c:param name="searchValue" value="${search.searchValue }"></c:param>
						<c:param name="page" value="${pi.currentPage + 1 }"></c:param>
					</c:url>
					<li class="page-item"><a href="${after}" class="page-link">다음</a></li>
				</c:if>
				</ul>
			</div>
			</div>
	</c:if>

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

</body>
</html>