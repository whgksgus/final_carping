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
		<h2 class="h2">리뷰게시판 - 명소</h2>
		<div style="width: 350px; border-bottom: 2px solid lightgray;"></div>
	</div>
	<br>
	
	<form action="placeReviewInsertForm.do" method="post">
	<input type="hidden" name="placeKey" value="${placeKey}"/>
	<table align="center" border="1" width="700">
		<tr text-align="center">
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
			<th>별점</th>
		</tr>
		<c:if test="${prList eq null || empty prList }">
			<tr>
				<td colspan="6" align="center">등록된 정보가 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${prList ne null || !empty prList }">
		<c:forEach items="${prList }" var="prlist" varStatus="status">
		
		<tr>
			<td>${status.index }</td>
			<td>${prlist.prTitle }</td>
			<td>${prlist.memberId }</td>
			<td>${prlist.prRegDate }</td>
			<td>${prlist.prHits }</td>
			<td>${prlist.prScore }</td>
		</tr>
		</c:forEach>
		</c:if>
	</table>
	<br>
	<input style="margin-left:1045px;" type="submit" value="글쓰기"/>
	</form>
	<br><br>
	<form id="form" action="placeReviewSearch.do" method="post">
	<div style="text-align:center;">
		<select id="searchCondition" name="searchCondition">
			<option value="제목">제목</option>
			<option value="작성자">작성자</option>
		</select>&nbsp;&nbsp;
		<input type="text" id="searchValue" name="searchValue" size="50;" required/>&nbsp;&nbsp;&nbsp;&nbsp;
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