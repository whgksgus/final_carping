<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세</title>
</head>
<body>
	<jsp:include page="../common/nav.jsp"/>
	<br style="clear:both">
	<h1 align="center">${notice.nKey }번 글 상세 보기</h1>
	<table align="center" width="450" border="1" cellspacing="0">
		<tr>
			<td width="80">번호</td>
			<td>${notice.nKey }</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${notice.nTitle }</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${notice.memberId}</td>
		</tr>
		<tr>
			<td>작성날짜</td>
			<td>${notice.nWriteDate }</td>
		</tr>
		<tr height="300">
			<td>내용</td>
			<td>${notice.nContent }</td>
		</tr>

		<c:if test="${ loginUser.memberId eq notice.memberId }">
			<tr>
				<td colspan="2" align="center">
					<c:url var="nUpdate" value="noticeUpdateView.do">
						<c:param name="nKey" value="${notice.nKey }"></c:param>
					</c:url>
					<a href="${nUpdate}">수정페이지로 이동</a> &nbsp;&nbsp;
					<c:url var="nDelete" value="noticeDelete.do">
						<c:param name="nKey" value="${notice.nKey }"></c:param>
					</c:url>
					<a href="${nDelete }">삭제하기</a>
				</td>
			</tr>
		</c:if>
	</table>
	<br><br><br><br><br><br><br><br><br><br><br><br>
	
	<p align="center">
		<c:url var="home" value="home.kh"></c:url>
		<c:url var="nList" value="noticeList.kh"></c:url>
		<a href="${home }">시작페이지로 이동</a>
		<a href="${nList }">목록 전체보기</a>
	</p>
</body>
</html>