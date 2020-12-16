<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건의사항 - 등록</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
	<jsp:include page="../common/nav.jsp"></jsp:include>
	<br>
	<br>

	<div style="margin-left: 100px;">
		<h2 class="h2">건의사항 - 등록</h2>
		<div style="width: 350px; border-bottom: 2px solid lightgray;"></div>
	</div>
	<br>
	
	<form action="sugInsert.do" method="post">
      <table align="center">
         <tr>
            <td><input type="text" name="suggestionTitle" placeholder="제목을 입력해주세요" size="50" required></td>
         </tr>
         <tr>
            <td><textarea placeholder="내용을 입력해주세요" cols="50" rows="7" name="suggestionContent" style="resize:none" required></textarea></td>
         </tr>
         <tr>
            <td colspan="2" align="center">
               <input type="submit" onclick="return Add();" value="등록"> &nbsp;
               <a href="#">목록으로</a>
            </td>
         </tr>
      </table>
      <input type="hidden" name="memberId" value="${loginUser.memberId }">
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
	<script>
	function Add() {
		return confirm("리뷰를 등록하시겠습니까?")
		}
	</script>
</body>
</html>