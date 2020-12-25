<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
</head>
<body>
	<jsp:include page="../common/nav.jsp"/>
	<br style="clear:both">
	<h1 align="center">게시글 수정페이지</h1>
	<br><br>
	<form action="noticeUpdate.do" method="post">
		<input type="hidden" name="nKey" value="${notice.nKey }">
		<table align="center" border="1" cellspace="0">
			<tr>
				<td>제목</td>
				<td><input type="text" size="50" name="nTitle" value="${notice.nTitle }"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="memberId" value="${notice.memberId }" readonly></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="8" cols="50" name="nContent">${notice.nContent }</textarea></td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="수정">
				</td>
			</tr>
		</table>
	</form>
	
	<p align="center">
		<c:url var="home" value="home.do"></c:url>
		<c:url var="nList" value="noticeList.do"></c:url>
		<c:url var="back" value="${header.referer }"></c:url>
		<a href="${home }">Home</a>
		<a href="${nList }">목록</a>
		<a href="${back }">이전</a>	
</body>
</html>