<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<style>

	a { text-decoration:none;
	color: black; } 
	
    #title {
    	padding-top: 50px;
        text-align: center;
        font-size: 30px;
        font-weight: bold;
    }
    
    th {
    align: center;
    background-color: lightgray;
	color: white;
	font-size: 18px;
	font-weight: bold;
	text-align: center;
    }

</style>
<body>
<jsp:include page="../common/nav.jsp"/>
	 <legend id="title">공지사항</legend>
	<br><br>
	<c:if test="${loginUser.memberId == 'admin' }">
		<div align="center">
			<button onclick="location.href='noticeWriteView.do'">글쓰기</button>
		</div>
	</c:if>
	<br style="clear:both">
	<table align="center" width="700" border="1" cellspacing="0" style="clear:right; text-align: center;">
		<tr align="center"d>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>올린날짜</th>
		</tr>
		<c:forEach items="${nList }" var="notice">
			<tr>
				<td align="center">${notice.nKey }</td>
				<td>
					<c:if test="${!empty loginUser }">
						<c:url var="nDetail" value="noticeDetail.do">
							<c:param name="nId" value="${notice.nKey }"></c:param> <!-- 퀴리스트링 -->
						</c:url>
						<a href="${nDetail }">${notice.nTitle }</a>
					</c:if>
					<c:if test="${empty loginUser }">
						${notice.nTitle }
					</c:if>
				</td>
				<td align="center">${notice.memberId }</td>
				<td align="center">${notice.nWriteDate }</td>
				
			</tr>
		</c:forEach>
	</table>
	<br>
	<!-- 게시물 검색하기 -->
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
	</div>
	<p align="center">
		<a href="#">시작페이지로 이동</a>
		<a href="#">목록 전체보기</a>
	</p>
	<br><br><br><br><br><br><br><br><br><br><br><br>
	
</body>
</html>