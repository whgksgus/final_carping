<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<style>
a {
	text-decoration: none;
	color: black;
}

#title {
	padding-top: 50px;
	text-align: center;
	font-size: 30px;
	font-weight: bold;
}


.ul, .li {
	line-height: auto;
	list-style: none;
	text-align: center;
	padding: 0;
	margin: 0;
	line-height: center;
}

.ul {
	margin-top: 10px;
	width: 80%;
	display:inline-block;
}

.li {
	vertical-align: center;
	margin-top: auto;
	
}

#ul>li:first-child>ul>li {
	background-color: white;
	font-weight: bold;
	text-align: center;
	color: black;
	font-size: 19px;
	border-bottom: 1px solid lightgray;
	border-top: 1px solid lightgray;
}

#ul>li>ul {
	clear: both;
	padding: 0px auto;
	position: relative;
	min-width: 200px;
}

#ul>li>ul>li {
	float: left;
	font-size: 10pt;
	vertical-align: center;
}

#ul>li>ul>li:first-child {
	width: 10%;
} /*번호 열 크기*/

#ul>li>ul>li:first-child+li {
	width: 55%;
} /*제목 열 크기*/

#ul>li>ul>li:first-child+li+li {
	width: 15%;
} /*작성자 열 크기*/

#ul>li>ul>li:first-child+li+li+li {
	width: 10%;
} /*조회수 열 크기*/

#ul>li>ul>li:first-child+li+li+li+li {
	width: 10%;
} /*작성날짜 열 크기*/

</style>
<body>
	<jsp:include page="../common/nav.jsp" />
	<legend id="title">공지사항</legend>
	<br>
	<br>
	<c:if test="${loginUser.memberId == 'admin' }">
		<div align="center">
			<button onclick="location.href='noticeWriteView.do'">글쓰기</button>
		</div>
	</c:if>
	<br style="clear: both">
	<ul id="ul">
		<li class="li">
			<ul class="ul">
				<li class="li">글번호</li>
				<li class="li">제목</li>
				<li class="li">작성자</li>
				<li class="li">조회수</li>
				<li class="li">작성날짜</li>
			</ul>
		</li>
		<li class="li">
			<c:forEach items="${nList }" var="notice">
				<ul class="ul">
					<li class="li">${notice.nKey }</li>
						<c:url var="nDetail" value="noticeDetail.do">
							<c:param name="nKey" value="${notice.nKey }"></c:param>
						</c:url> 
					<li class="li"><a href="${nDetail }">${notice.nTitle }</a></li>
					<li class="li">${notice.memberId }</li>
					<li class="li">${notice.nCount }</li>
					<li class="li">${notice.nWriteDate }</li>
				</ul>
			</c:forEach>
		</li>
	</ul>

	<br>
	<br>
	<br>
	<table style="width: 100%; text-align: center; padding-top: 300px;">
		<tr align="center" height="20">
			<td colspan="6">
				<!-- 이전 --> 
				<c:if test="${pi.currentPage <= 1 }">
					◀&nbsp;
				</c:if> <c:if test="${pi.currentPage > 1 }">
					<c:url var="before" value="noticeListView.do">
						<c:param name="page" value="${pi.currentPage -1 }"></c:param>
					</c:url>
					<a href="${before }">◀</a>&nbsp;
				</c:if> 
				
				<!-- 페이지 -->
				 <c:forEach var="p" begin="${pi.startPage }"
					end="${pi.endPage }">
					<c:if test="${p eq pi.currentPage }">
						<font style="font-weight: bold;">${p }</font>
					</c:if>
					<c:url var="pagination" value="noticeList.do">
						<c:param name="page" value="${p }"></c:param>
					</c:url>
					<c:if test="${p ne pi.currentPage }">
						<a href="${pagination }">${p }</a>&nbsp;
					</c:if>
				</c:forEach> <!-- 다음 --> <c:if test="${pi.currentPage >= pi.maxPage }">
					▶&nbsp;
				</c:if> <c:if test="${pi.currentPage < pi.maxPage }">
					<c:url var="next" value="noticeList.do">
						<c:param name="page" value="${pi.currentPage + 1 }"></c:param>
					</c:url>
					<a href="${next }">▶</a>&nbsp;
				</c:if>
			</td>
		</tr>
	</table>
	<br>
	<br>
	<br>
	<div id="searchArea" align="center">
		<form action="noticeSearch.do" method="get">
			<select id="searchCondition" name="searchCondition">
				<option value="all" <c:if test="${search.searchCondition == 'all' }">selected</c:if>>전체</option>
				<option value="title" <c:if test="${search.searchCondition == 'title' }">selected</c:if>>제목</option>
				<option value="content" <c:if test="${search.searchCondition == 'content' }">selected</c:if>>내용</option>
			</select>		
			<input type="text" name="searchValue" value="${search.searchValue }">
			<input type="submit" value="검색">
		</form>
	</div> <br>
	
	<br>
	<br>
	<br>
	<br>
	<br>
</body>
</html>