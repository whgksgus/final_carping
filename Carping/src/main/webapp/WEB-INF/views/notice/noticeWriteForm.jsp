<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>
</head>
<body>
	<jsp:include page="../common/nav.jsp"/>
	<br style="clear:both">
	<h1 align="center">공지글 등록페이지</h1>
	<br><br>
	<form action="noticeInsert.do" method="post">
		<table align="center" border="1" cellspacing="0">
			<tr>
				<td>제목</td>
				<td><input type="text" size="50" name="nTitle" placeholder = "제목을 입력해주세요. "></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" size="50" name="memberId" value="${loginUser.memberId }" readonly></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="7" cols="50" name="nContent" placeholder = "내용을 입력해주세요. "></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="등록">&nbsp;&nbsp;
					<input type="reset" value="취소">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>