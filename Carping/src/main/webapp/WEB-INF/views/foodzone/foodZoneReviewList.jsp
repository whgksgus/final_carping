<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰게시판 - 맛집 검색페이지</title>
<!-- 상단 아이콘 -->
<link rel="shortcut icon" type="image/x-icon" href="resources/images/carpingLogo.jpg">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
<!-- 합쳐지고 최소화된 최신 CSS -->
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>

<body>
	<jsp:include page="../common/nav.jsp"></jsp:include>

	<section style="width:100%; height:800px;">
		<article>
		<div style="height:100px; display:block;"></div>
			<div align="center">
				<h2 style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="h2">맛집 리뷰리스트</h2>
				<div style="width: 350px; border-bottom: 2px solid lightgray;"></div>
			</div>
			<br>
			
			
				<div class="container">
				<div class="col-md-1"></div>
					<div class="col-md-10">
						<table class="table table-striped">
							<tr>
								<th style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="col-md-1 text-center">글 번호</th>
								<th style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="col-md-7 text-center">제목</th>
								<th style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="col-md-1 text-center">작성자</th>
								<th style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="col-md-1 text-center">조회수</th>
								<th style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="col-md-2 text-center">작성날짜</th>
							</tr>
							<c:if test="${fzrList eq null || empty fzrList}">
								<tr>
									<td style="font-family: 'Sunflower', sans-serif; font-weight:bold;" colspan="5" class="col-md-12 text-center">등록된 리뷰가 없어요~</td>
								</tr>
							</c:if>
							<c:if test="${fzrList ne null && !empty fzrList }">
								<c:forEach items="${fzrList}" var="list" varStatus="status">
									<tr>
										<td>${pageNum - status.index }</td>
										<td>
											<c:url var="fzrDetail" value="foodZoneReviewDetail.do">
												<c:param name="frKey" value="${list.frKey }"></c:param>
												<c:param name="foodZoneKey" value="${list.foodZoneKey }"></c:param>
											</c:url>
											<a style="font-family: 'Sunflower', sans-serif; font-weight:bold;" href="${fzrDetail }">${list.frTitle }</a>
										</td>
										<td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">${list.memberId }</td>
										<td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">${list.frHits }</td>
										<td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">${list.frRegDate}</td>
									</tr>
								</c:forEach>
							</c:if>
						</table>
					</div>
				<div class="com-md-1"></div>
				</div>
			<form action="foodZoneReviewInsertForm.do" method="get">
				<div class="container" style="margin-left: 210px;">
					<div class="col-md-10"></div>
					<div class="col-md-1"><input style="font-family: 'Sunflower', sans-serif; font-weight:bold;" type="submit" class="btn btn-info" value="리뷰 작성"></div>
					<div class="col-md-1"><input style="font-family: 'Sunflower', sans-serif; font-weight:bold;" type="hidden" name="foodZoneKey" value="${foodZoneKey}"></div>
				</div>
			</form>
			<div class="container">
				<div class="col-md-12 text-center">
				<c:if test="${fzrList ne null || !empty fzrList }">
					<ul class="pagination pagination-sm">
					<c:if test="${pi.currentPage <= 1 }">
						<li class="page-item"><a style="font-family: 'Sunflower', sans-serif; font-weight:bold;" href="javascript:void(0);" class="page-link">이전</a></li>
					</c:if>
					<c:if test="${pi.currentPage>1}">
						<c:url var="before" value="foodZoneReviewListView.do">
							<c:param name="page" value="${pi.currentPage-1}"></c:param>
							<c:param name="foodZoneKey" value="${foodZoneKey}"></c:param>
						</c:url>
						
							<li class="page-item"><a style="font-family: 'Sunflower', sans-serif; font-weight:bold;" href="${before}" class="page-link">이전</a></li>
					</c:if>
					<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
						<c:if test="${pi.currentPage == p }">
							<li class="page-item"><a href="javascript:void(0);" class="page-link">${p}</a></li>
						</c:if>
						<c:if test="${pi.currentPage != p }">
							<c:url var="pagination" value="foodZoneReviewListView.do">
								<c:param name="page" value="${p}"></c:param>
								<c:param name="foodZoneKey" value="${foodZoneKey }"></c:param>
							</c:url>
							<li class="page-item"><a href="${pagination}" class="page-link">${p}</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${pi.currentPage>=pi.maxPage}">
						<li class="page-item"><a style="font-family: 'Sunflower', sans-serif; font-weight:bold;" href="javascript:void(0);" class="page-link">다음</a></li>
					</c:if>
					<c:if test="${pi.currentPage<pi.maxPage }">
						<c:url var="after" value="foodZoneReviewListView.do">
							<c:param name="page" value="${pi.currentPage + 1}"></c:param>
							<c:param name="foodZoneKey" value="${foodZoneKey}"></c:param>
						</c:url>
						<li class="page-item"><a style="font-family: 'Sunflower', sans-serif; font-weight:bold;" href="${after}" class="page-link">다음</a></li>
					</c:if>
					</ul>
					</c:if>
				</div>
			</div>
			<br><br>
			
			 <form action="searchFoodZoneBoardReview.do">
			 <input type="hidden" name="foodZoneKey" value=${foodZoneKey }>
				  	<div style="margin-left:700px;">
						<select class="form-control col-sm-2" style="width:120px; font-family: 'Sunflower', sans-serif; font-weight:bold;" id="searchCondition" name="searchCondition">
							<option value="제목" <c:if test="${search.searchCondition == '제목'}">selected</c:if>>제목</option>
							<option value="내용" <c:if test="${search.searchCondition == '내용'}">selected</c:if>>내용</option>
							<option value="작성자" <c:if test="${search.searchCondition == '작성자'}">selected</c:if>>작성자</option>
						</select>&nbsp;&nbsp;
						<input type="text" class="form-control col-sm-1"  id="searchValue" name="searchValue" style="font-family: 'Sunflower', sans-serif; font-weight:bold; width:300px;" value="${search.searchValue }" required/>&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="submit" class="btn btn-default col-sm-1" style="font-family: 'Sunflower', sans-serif; font-weight:bold; width:80px;" value="검색" id="search"/>
					</div>
				  	<div class="col-md-2"></div>
				  	
				  </div>
			  </form>
		</article>
	</section>
	<!--footer-->
	<jsp:include page="../../../WEB-INF/views/common/footer.jsp"/>
</body>
</html>