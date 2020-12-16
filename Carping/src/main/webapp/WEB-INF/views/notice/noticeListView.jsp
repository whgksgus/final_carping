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
	width: 90%;
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
	width: 5%;
} /*번호 열 크기*/

#ul>li>ul>li:first-child+li {
	width: 25%;
} /*이미지 열 크기*/

#ul>li>ul>li:first-child+li+li {
	width: 26%;
	
} /*상품정보 열 크기*/

#ul>li>ul>li:first-child+li+li+li {
	width: 15%;
} /*가격 열 크기*/

#ul>li>ul>li:first-child+li+li+li+li {
	width: 10%;
} /*수량 열 크기*/

#ul>li>ul>li:first-child+li+li+li+li+li {
	width: 10%;
} /*상태 열 크기*/

#ul>li>ul>li:first-child+li+li+li+li+li+li {
	width: 5%;
} /*삭제 열 크기*/

#ul>li>ul>li:first-child+li+li+li+li+li+li+li {
	width: 7%;
} 



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
					<li class="li"><a href="${nDetail }">${notice.nKey }</a></li>
		<%-- 			<c:url var="nDetail" value="noticeDetail.do">
							<c:param name="nKey" value="${notice.nKey }"></c:param>
						</c:url> --%>
					<li class="li"><a href="${nDetail }">${notice.nTitle }</a></li>
					<li class="li">${notice.memberId }</li>
					<li class="li">${notice.nCount }</li>
					<li class="li">${notice.nWriteDate }</li>
				</ul>
			</c:forEach>
		</li>
	</ul>
	<br>
	<%-- <!-- 게시물 검색하기 -->
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
	</div> --%>
	<p align="center">
		<a href="#">시작페이지로 이동</a> <a href="#">목록 전체보기</a>
	</p>
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