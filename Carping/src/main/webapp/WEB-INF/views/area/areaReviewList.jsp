<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰게시판 - 장소 검색</title>
<!-- 상단 아이콘 -->
<link rel="shortcut icon" type="image/x-icon" href="resources/images/carpingLogo.jpg">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="../common/nav.jsp"></jsp:include>
	<div style="width:100%; height:1000px;">
	<div style="height:100px;"></div>
	<div align="center">
		<h2 style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="h2">리뷰게시판 - 장소</h2>
		<div style="width: 350px; border-bottom: 2px solid lightgray;"></div>
	</div>
	<br>
	<br>
	<form action="areaReviewInsertForm.do" method="post">
		<div class="container">
				<div class="col-md-1"></div>
				<div class="col-md-10">
	<input style="font-family: 'Sunflower', sans-serif; font-weight:bold;" type="hidden" name="areaKey" value="${areaKey}"/>
	<table class="table table-striped" align="center">
		<tr>
			<th style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="col-md-1 test-center">글번호</th>
			<th style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="col-md-7 test-center">제목</th>
			<th style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="col-md-1 test-center">작성자</th>
			<th style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="col-md-1 test-center">조회수</th>
			<th style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="col-md-2 test-center">작성날짜</th>
		</tr>
		<c:if test="${arList eq null || empty arList }">
			<tr>
				<td style="font-family: 'Sunflower', sans-serif; font-weight:bold;" colspan="5" class="col-md-11 text-center" align="center">등록된 정보가 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${arList ne null || !empty arList }">
		<c:forEach items="${arList }" var="arlist" varStatus="status">		
		<tr>
			<td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">${pageNum - status.index }</td>
			<td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">
				<c:url var="arDetail" value="areaReviewDetail.do">
					<c:param name="arKey" value="${arlist.arKey }"/>
					<c:param name="areaKey" value="${areaKey }"/>
				</c:url>
				<a style="font-family: 'Sunflower', sans-serif; font-weight:bold;" href="${arDetail}">${arlist.arTitle }</a>
			</td>
			<td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">${arlist.memberId }</td>
			<td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">${arlist.arHits }</td>
			<td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">${arlist.arRegDate }</td>
		</tr>
		</c:forEach>
		</c:if>
	</table>
	</div>
	</div>
	
	<input style="font-family: 'Sunflower', sans-serif; font-weight:bold; margin-left:1370px;" class="btn btn-info" type="submit" value="리뷰 작성"/>
	</form>
	<div class="container">
		<div class="col-md-12 text-center">
		<c:if test="${aList ne null || !empty aList }">
			<ul class="pagination pagination-sm">
			<c:if test="${pi.currentPage <= 1 }">
				<li class="page-item"><a style="font-family: 'Sunflower', sans-serif; font-weight:bold;" href="javascript:void(0);" class="page-link">이전</a></li>
			</c:if>
			<c:if test="${pi.currentPage>1}">
				<c:url var="before" value="areaReviewListView.do">
					<c:param name="page" value="${pi.currentPage-1}"></c:param>
				</c:url>
				
					<li class="page-item"><a style="font-family: 'Sunflower', sans-serif; font-weight:bold;" href="${before}" class="page-link">이전</a></li>
			</c:if>
			<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
				<c:if test="${pi.currentPage == p }">
					<li class="page-item"><a href="javascript:void(0);" class="page-link">${p}</a></li>
				</c:if>
				<c:if test="${pi.currentPage != p }">
					<c:url var="pagination" value="areaReviewListView.do">
						<c:param name="page" value="${p}"></c:param>
					</c:url>
					<li class="page-item"><a href="${pagination}" class="page-link">${p}</a></li>
				</c:if>
			</c:forEach>
			<c:if test="${pi.currentPage>=pi.maxPage}">
				<li class="page-item"><a style="font-family: 'Sunflower', sans-serif; font-weight:bold;" href="javascript:void(0);" class="page-link">다음</a></li>
			</c:if>
			<c:if test="${pi.currentPage<pi.maxPage }">
				<c:url var="after" value="areaReviewListView.do">
					<c:param name="page" value="${pi.currentPage + 1}"></c:param>
				</c:url>
				<li class="page-item"><a style="font-family: 'Sunflower', sans-serif; font-weight:bold;" href="${after}" class="page-link">다음</a></li>
			</c:if>
			</ul>
			</c:if>
		</div>
	</div>
	
		<form id="form" action="searchAreaBoardReview.do" method="get">
		<input type="hidden" name="areaKey" value="${areaKey}"/>
		<div style="margin-left:700px;">
			<select class="form-control col-sm-2" style="width:120px; font-family: 'Sunflower', sans-serif; font-weight:bold;" id="searchCondition" name="searchCondition">
				<option value="제목" <c:if test="${search.searchCondition == '제목'}">selected</c:if>>제목</option>
				<option value="내용" <c:if test="${search.searchCondition == '내용'}">selected</c:if>>내용</option>
				<option value="작성자" <c:if test="${search.searchCondition == '작성자'}">selected</c:if>>작성자</option>
			</select>&nbsp;&nbsp;
			<input type="text" class="form-control col-sm-1"  id="searchValue" name="searchValue" style="font-family: 'Sunflower', sans-serif; font-weight:bold; width:300px;" value="${search.searchValue }" required/>&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="submit" class="btn btn-default col-sm-1" style="font-family: 'Sunflower', sans-serif; font-weight:bold; width:80px;" value="검색" id="search"/>
		</div>
		</form>
	</div>
	<!--footer-->
	<jsp:include page="../../../WEB-INF/views/common/footer.jsp"/>
</body>
</html>