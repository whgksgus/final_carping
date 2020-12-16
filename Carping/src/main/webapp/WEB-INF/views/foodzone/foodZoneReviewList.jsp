<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰게시판 - 맛집 검색페이지</title>
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

	<section style="margin-top: 40px;">
		<article>
			<h3>맛집 리뷰리스트</h3>
			<br><br><br>
			
			<form action="foodZoneReviewInsertForm.do" method="post">
				<div class="container">
				<div class="col-md-1"></div>
					<div class="col-md-10">
						<table class="table table-striped">
							<tr>
								<th class="col-md-1 text-center">글 번호</th>
								<th class="col-md-7 text-center">제목</th>
								<th class="col-md-1 text-center">작성자</th>
								<th class="col-md-1 text-center">조회수</th>
								<th class="col-md-2 text-center">작성날짜</th>
							</tr>
							<c:if test="${fzrList eq null || empty fzrList}">
								<tr>
									<td colspan="5" class="col-md-12 text-center">등록된 리뷰가 없어요~</td>
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
											<a href="${fzrDetail }">${list.frTitle }</a>
										</td>
										<td>${list.memberId }</td>
										<td>${list.frHits }</td>
										<td>${list.frRegDate}</td>
									</tr>
								</c:forEach>
							</c:if>
						</table>
					</div>
				<div class="com-md-1"></div>
				</div>
			</form>
			<div class="container">
				<div class="col-md-12 text-center">
					<ul class="pagination pagination-sm">
					<c:if test="${pi.currentPage <= 1 }">
						<li class="page-item"><a href="javascript:void(0);" class="page-link">이전</a></li>
					</c:if>
					<c:if test="${pi.currentPage>1}">
						<c:url var="before" value="foodZoneReviewListView.do">
							<c:param name="page" value="${pi.currentPage-1}"></c:param>
							<c:param name="foodZoneKey" value="${foodZoneKey}"></c:param>
						</c:url>
						
							<li class="page-item"><a href="${before}" class="page-link">이전</a></li>
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
						<li class="page-item"><a href="javascript:void(0);" class="page-link">다음</a></li>
					</c:if>
					<c:if test="${pi.currentPage<pi.maxPage }">
						<c:url var="after" value="foodZoneReviewListView.do">
							<c:param name="page" value="${pi.currentPage + 1}"></c:param>
							<c:param name="foodZoneKey" value="${foodZoneKey}"></c:param>
						</c:url>
						<li class="page-item"><a href="${after}" class="page-link">다음</a></li>
					</c:if>
					</ul>
					
				</div>
			</div>
			<div>
			</div>
		</article>
	</section>
</body>
</html>