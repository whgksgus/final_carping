<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰게시판 - 명소 검색페이지</title>
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
				<h2 style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="h2">명소 리뷰리스트</h2>
				<div style="width: 350px; border-bottom: 2px solid lightgray;"></div>
			</div>
			<br>
			<div class="container">
				<div class="col-md-1"></div>
				<div class="col-md-10">
					<table class="table table-striped">
						<tr>
							<th style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="col-md-1 test-center">글번호</th>
							<th style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="col-md-7 test-center">제목</th>
							<th style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="col-md-1 test-center">작성자</th>
							<th style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="col-md-1 test-center">조회수</th>
							<th style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="col-md-2 test-center">작성날짜</th>
						</tr>
						<c:if test="${prList eq null || empty prList }">
							<tr>
								<td style="font-family: 'Sunflower', sans-serif; font-weight:bold;" colspan="5" class="col-md-12 text-center">등록된 정보가 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${prList ne null || !empty prList }">
							<c:forEach items="${prList }" var="prlist" varStatus="status">
								<tr>
									<td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">${pageNum - status.index }</td>
									<td><c:url var="prDetail" value="placeReviewDetail.do">
											<c:param name="prKey" value="${prlist.prKey }" />
											<c:param name="placeKey" value="${placeKey }" />
										</c:url> <a style="font-family: 'Sunflower', sans-serif; font-weight:bold;" href="${prDetail}">${prlist.prTitle }</a></td>
									<td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">${prlist.memberId }</td>
									<td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">${prlist.prHits }</td>
									<td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">${prlist.prRegDate }</td>
								</tr>
							</c:forEach>
						</c:if>
					</table>
				</div>
				<div class="com-md-1"></div>
			</div>
			<form action="placeReviewInsertForm.do" method="post">
				<div class="container" style="margin-left: 210px;">
					<div class="col-md-10"></div>
					<div class="col-md-1">
						<input style="font-family: 'Sunflower', sans-serif; font-weight:bold;" type="hidden" name="placeKey" value="${placeKey}" />
					</div>
					<div class="col=md-1">
						<input style="font-family: 'Sunflower', sans-serif; font-weight:bold;" type="submit" class="btn btn-info" value="리뷰작성" />
					</div>
				</div>
			</form>
			<div class="contatiner">
				<div class="col-md-12 text-center">
				<c:if test="${prList ne null || !empty prList }">
					<ul class="pagination pagination-sm">
						<!-- 이전 -->
						<c:if test="${pi.currentPage <= 1 }">
							<li class="page-item"><a style="font-family: 'Sunflower', sans-serif; font-weight:bold;" href="javascript:void(0);"
								class="page-link">이전</a></li>
						</c:if>
						<c:if test="${pi.currentPage > 1 }">
							<!-- 그냥 실행했을때 -->
							<c:url var="before" value="placeReviewListView.do">
								<c:param name="page" value="${pi.currentPage -1 }"></c:param>
								<c:param name="placeKey" value="${placeKey}"></c:param>
								<c:param name="searchCondition"
									value="${search.searchCondition }"></c:param>
								<c:param name="searchValue" value="${search.searchValue }"></c:param>
							</c:url>
							<!-- 검색어가 있으면 검색어만 볼 수 있도록 url을 search쪽으로 보내줌 -->
							<c:if test="${search.searchValue ne null }">
								<c:url var="before" value="searchPlaceBoardReview.do">
									<c:param name="page" value="${pi.currentPage -1 }"></c:param>
									<c:param name="placeKey" value="${placeKey}"></c:param>
									<c:param name="searchCondition"
										value="${search.searchCondition }"></c:param>
									<c:param name="searchValue" value="${search.searchValue }"></c:param>
								</c:url>
							</c:if>
							<li class="page-item"><a style="font-family: 'Sunflower', sans-serif; font-weight:bold;" href="${before }" class="page-link">이전</a></li>
						</c:if>
						<!-- 페이지  -->
						<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
							<c:if test="${pi.currentPage == p }">
								<li class="page-item"><a href="javascript:void(0);"
									class="page-link">${p }</a></li>
							</c:if>
							<c:if test="${pi.currentPage != p }">
								<!--  그냥 실행했을때 -->
								<c:url var="pagination" value="placeReviewListView.do">
									<c:param name="page" value="${p }"></c:param>
									<c:param name="placeKey" value="${placeKey}"></c:param>
									<c:param name="searchCondition"
										value="${search.searchCondition }"></c:param>
									<c:param name="searchValue" value="${search.searchValue }"></c:param>
								</c:url>
								<!-- 검색어가 있으면 검색어만 볼 수 있도록 url을 search쪽으로 보내줌 -->
								<c:if test="${search.searchValue ne null }">
									<c:url var="pagination" value="searchPlaceBoardReview.do">
										<c:param name="page" value="${p }"></c:param>
										<c:param name="placeKey" value="${placeKey}"></c:param>
										<c:param name="searchCondition"
											value="${search.searchCondition }"></c:param>
										<c:param name="searchValue" value="${search.searchValue }"></c:param>
									</c:url>
								</c:if>
								<li class="page-item"><a href="${pagination }"
									class="page-link">${p }</a></li>
							</c:if>
						</c:forEach>
						<!-- 다음 -->
						<c:if test="${pi.currentPage >= pi.maxPage }">
							<li class="page-item"><a href="javascript:void(0);"
								class="page-link">다음</a></li>
						</c:if>
						<c:if test="${pi.currentPage < pi.maxPage }">
							<!--  그냥 실행했을때 -->
							<c:url var="after" value="placeReviewListView.do">
								<c:param name="page" value="${pi.currentPage + 1 }"></c:param>
								<c:param name="placeKey" value="${placeKey}"></c:param>
								<c:param name="searchCondition"
									value="${search.searchCondition }"></c:param>
								<c:param name="searchValue" value="${search.searchValue }"></c:param>
							</c:url>
							<!-- 검색어가 있으면 검색어만 볼 수 있도록 url을 search쪽으로 보내줌 -->
							<c:if test="${search.searchValue ne null }">
								<c:url var="after" value="searchPlaceBoardReview.do">
									<c:param name="page" value="${pi.currentPage + 1 }"></c:param>
									<c:param name="placeKey" value="${placeKey}"></c:param>
									<c:param name="searchCondition"
										value="${search.searchCondition }"></c:param>
									<c:param name="searchValue" value="${search.searchValue }"></c:param>
								</c:url>
							</c:if>
							<li class="page-item"><a style="font-family: 'Sunflower', sans-serif; font-weight:bold;" href="${after }" class="page-link">다음</a></li>
						</c:if>
					</ul>
					</c:if>
				</div>
			</div>
			<br> <br>
			<form id="form" action="searchPlaceBoardReview.do" method="get">
				<input type="hidden" name="placeKey" value="${placeKey}" />
				<div class="contatiner">
					<div class="col-md-3"></div>
					<div class="col-md-7">
						<div class="col-md-1"></div>
						<select class="col-md-2 from-control" id="searchCondition"
							name="searchCondition" style="font-family: 'Sunflower', sans-serif; font-weight:bold; width: 12%;">
							<option value="제목"
								<c:if test="${search.searchCondition == '제목'}">selected</c:if>>제목</option>
							<option value="내용"
								<c:if test="${search.searchCondition == '내용'}">selected</c:if>>내용</option>
							<option value="작성자"
								<c:if test="${search.searchCondition == '작성자'}">selected</c:if>>작성자</option>
						</select>
						<div class="col-md-6">
							<input type="text" id="searchValue" name="searchValue" size="50;"
								style="font-family: 'Sunflower', sans-serif; font-weight:bold;" value="${search.searchValue }" required />
						</div>
						<div class="col-md-2">
							<input style="font-family: 'Sunflower', sans-serif; font-weight:bold;" type="submit" class="btn btn-into" value="검색" id="search" />
						</div>
					</div>
					<div class="col-md-2"></div>
				</div>
			</form>
		</article>
	</section>
	<!--footer-->
	<%-- <jsp:include page="../../../WEB-INF/views/common/footer.jsp"/> --%>
</body>
</html>