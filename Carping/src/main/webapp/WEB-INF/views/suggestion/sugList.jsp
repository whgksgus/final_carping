<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건의사항</title>
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
			<h3>건의사항 리스트</h3>
			<br> <br> <br>
			<div class="container">
				<div class="col-md-1"></div>
				<div class="col-md-10">
					<table class="table table-striped">
						<tr>
			<th class="col-md-1 test-center">글번호</th>
			<th class="col-md-5 test-center">제목</th>
			<th class="col-md-1 test-center">작성자</th>
			<th class="col-md-1 test-center">조회수</th>
			<th class="col-md-2 test-center">작성일</th>
			<th class="col-md-1 test-center">답변여부</th>
		</tr>
		<c:if test="${sList eq null || empty sList }">
			<tr>
				<td colspan="5" class="col-md-12 text-center">등록된 정보가 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${sList ne null || !empty sList }">
		<c:forEach items="${sList }" var="sList" varStatus="status">		
		<tr>
			<td>${pageNum - status.index }</td>
			<td>
			<c:url var="sugDetail" value="selectOne.do">
				<c:param name="suggestionKey" value="${sList.suggestionKey }"/>
			</c:url>
			<a href="${sugDetail }">${sList.suggestionTitle }</a>
			</td>
			<td>${sList.memberId }</td>
			<td>${sList.suggestionCount }</td>
			<td>${sList.suggestionEnrollDate }</td>
			<c:if test="${sList.answerCheck eq 0 }">
			<td>X</td>
			</c:if>
			<c:if test="${sList.answerCheck eq 1 }">
			<td>O</td>
			</c:if>
		</tr>
		</c:forEach>
		</c:if>
	</table>
	</div>
	<div class="com-md-1"></div>
	</div>
	<form action="sugInsertView.do" method="post">
	<input style="margin-left:1350px;" type="submit" class="btn btn-info" value="글쓰기"/>
	</form>
			<div class="contatiner">
			<div class="col-md-12 text-center">
		<c:if test="${sList ne null || !empty sList }">
				<ul class="pagination pagination-sm">
				<!-- 이전 -->
				<c:if test="${pi.currentPage <= 1 }">
					<li class="page-item"><a href="javascript:void(0);" class="page-link">이전</a></li>
				</c:if>
				<c:if test="${pi.currentPage > 1 }">
					<!-- 그냥 실행했을때 -->
					<c:url var="before" value="selectList.do">
						<c:param name="page" value="${pi.currentPage -1 }"></c:param>
						<c:param name="searchCondition" value="${search.searchCondition }"></c:param>
						<c:param name="searchValue" value="${search.searchValue }"></c:param>
					</c:url>
					<!-- 검색어가 있으면 검색어만 볼 수 있도록 url을 search쪽으로 보내줌 -->
					<c:if test="${search.searchValue ne null }">
					<c:url var="before" value="sugSearchList.do">
						<c:param name="page" value="${pi.currentPage -1 }"></c:param>
						<c:param name="searchCondition" value="${search.searchCondition }"></c:param>
						<c:param name="searchValue" value="${search.searchValue }"></c:param>
					</c:url>
					</c:if>
					<li class="page-item"><a href="${before }" class="page-link">이전</a></li>
				</c:if>
				<!-- 페이지  -->
				<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
					<c:if test="${pi.currentPage == p }">
             	  	   <li class="page-item"><a href="javascript:void(0);" class="page-link">${p }</a></li>
            	  	</c:if>
            	  	<c:if test="${pi.currentPage != p }">	
            	  	<!--  그냥 실행했을때 -->
					<c:url var="pagination" value="selectList.do">
						<c:param name="page" value="${p }"></c:param>
						<c:param name="searchCondition" value="${search.searchCondition }"></c:param>
						<c:param name="searchValue" value="${search.searchValue }"></c:param>
					</c:url>
					<!-- 검색어가 있으면 검색어만 볼 수 있도록 url을 search쪽으로 보내줌 -->
					<c:if test="${search.searchValue ne null }">
					<c:url var="pagination" value="sugSearchList.do">
						<c:param name="page" value="${p }"></c:param>
						<c:param name="searchCondition" value="${search.searchCondition }"></c:param>
						<c:param name="searchValue" value="${search.searchValue }"></c:param>
					</c:url>
					</c:if>
					<li class="page-item"><a href="${pagination }" class="page-link">${p }</a></li>
					</c:if>
				</c:forEach>
				<!-- 다음 -->
				<c:if test="${pi.currentPage >= pi.maxPage }">
					<li class="page-item"><a href="javascript:void(0);" class="page-link">다음</a></li>
				</c:if>
				<c:if test="${pi.currentPage < pi.maxPage }">
				<!--  그냥 실행했을때 -->
					<c:url var="after" value="selectList.do">
						<c:param name="page" value="${pi.currentPage + 1 }"></c:param>
						<c:param name="searchCondition" value="${search.searchCondition }"></c:param>
						<c:param name="searchValue" value="${search.searchValue }"></c:param>
					</c:url>
					<!-- 검색어가 있으면 검색어만 볼 수 있도록 url을 search쪽으로 보내줌 -->
					<c:if test="${search.searchValue ne null }">
					<c:url var="after" value="sugSearchList.do">
						<c:param name="page" value="${pi.currentPage + 1 }"></c:param>
						<c:param name="searchCondition" value="${search.searchCondition }"></c:param>
						<c:param name="searchValue" value="${search.searchValue }"></c:param>
					</c:url>
					</c:if>
					<li class="page-item"><a href="${after }" class="page-link">다음</a></li>
				</c:if>
				</ul>
				</c:if>
			</div>
		</div>
	<br><br>
	<form id="form" action="sugSearchList.do" method="get">
	<div class="contatiner">
		<div class="col-md-3"></div>
					<div class="col-md-7">
						<div class="col-md-1"></div>
						<select class="col-md-2 from-control" id="searchCondition" name="searchCondition" style="width: 12%;">
			<option value="제목" <c:if test="${search.searchCondition == '제목'}">selected</c:if>>제목</option>
			<option value="내용" <c:if test="${search.searchCondition == '내용'}">selected</c:if>>내용</option>
			<option value="작성자" <c:if test="${search.searchCondition == '작성자'}">selected</c:if>>작성자</option>
		</select>
		<div class="col-md-6">
		<input type="text" id="searchValue" name="searchValue" size="50;" value="${search.searchValue }" required/>
		</div>
		<div class="col-md-2">
		<input type="submit" class="btn btn-into" value="검색" id="search"/>
		</div>
	</div>
	<div class="col-md-2"></div>
	</div>
	</form>
	</article>
	</section>
</body>
</html>