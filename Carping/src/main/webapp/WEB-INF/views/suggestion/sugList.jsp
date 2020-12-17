<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건의사항</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
	<jsp:include page="../common/nav.jsp"></jsp:include>
	<br>
	<br>

	<div style="margin-left: 100px;">
		<h2 class="h2">건의사항</h2>
		<div style="width: 250px; border-bottom: 2px solid lightgray;"></div>
	</div>
	<br>
	
	<form action="sugInsertView.do" method="post">
	<table align="center" border="1" width="700">
		<tr text-align="center">
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
			<th>답변여부</th>
		</tr>
		<c:if test="${sList eq null || empty sList }">
			<tr>
				<td colspan="6" align="center">등록된 건의사항이 없습니다.</td>
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
			<td>${sList.suggestionEnrollDate }</td>
			<td>${sList.suggestionCount }</td>
			<td></td>
		</tr>
		</c:forEach>
		</c:if>
	</table>
	<br>
	<input style="margin-left:1045px;" type="submit" value="글쓰기"/>
	</form>
		<c:if test="${sList ne null || !empty sList }">
			<div align="center">
				<!-- 이전 -->
				<c:if test="${pi.currentPage <= 1 }">
					[이전]&nbsp;
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
					<a href="${before }">[이전]</a>&nbsp;
				</c:if>
				<!-- 페이지  -->
				<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
					<c:if test="${pi.currentPage == p }">
             	  	   <b style="color:blue">${p }</b>&nbsp;
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
					<a href="${pagination }">${p }</a>&nbsp;
					</c:if>
				</c:forEach>
				<!-- 다음 -->
				<c:if test="${pi.currentPage >= pi.maxPage }">
					[다음]&nbsp;
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
					<a href="${after }">[다음]</a>&nbsp;
				</c:if>
			</div>
		</c:if>
	
	<br><br>
	<form id="form" action="sugSearchList.do" method="get">
	<div style="text-align:center;">
		<select id="searchCondition" name="searchCondition">
			<option value="제목" <c:if test="${search.searchCondition == '제목'}">selected</c:if>>제목</option>
			<option value="내용" <c:if test="${search.searchCondition == '내용'}">selected</c:if>>내용</option>
			<option value="작성자" <c:if test="${search.searchCondition == '작성자'}">selected</c:if>>작성자</option>
		</select>&nbsp;&nbsp;
		<input type="text" id="searchValue" name="searchValue" size="50;" value="${search.searchValue }" required/>&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="submit" value="검색" id="search"/>
	</div>
	</form>
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