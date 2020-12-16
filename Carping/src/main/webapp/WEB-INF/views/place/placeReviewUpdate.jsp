<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰게시판 - 리뷰 수정</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
	<jsp:include page="../common/nav.jsp"></jsp:include>
	<br>
	<br>

	<div style="margin-left: 100px;">
		<h2 class="h2">리뷰게시판 - 수정</h2>
		<div style="width: 350px; border-bottom: 2px solid lightgray;"></div>
	</div>
	<br>
	
	<form action="placeReviewUpdate.do" method="post" enctype="multipart/form-data">
		
      <table align="center">
         <tr>
            <td><input type="text" name="address" value="${place.placeName } : ${place.placeAddress}" size="50" readonly></td>
         </tr>
         <tr>
            <td><input type="text" name="prTitle" placeholder="제목을 입력해주세요" size="50" required value="${preview.prTitle }"></td>
         </tr>
         <tr>
            <td><textarea placeholder="내용을 입력해주세요" cols="50" rows="7" name="prContent" style="resize:none" required>${preview.prContent }</textarea></td>
         </tr>
         <tr>
         	<td>별점<input type="number" max="5" min="1" required name="prScore" value="${preview.prScore }"/></td>
         </tr>
         <tr>
            <td><input type="file" name="reloadFile"></td>
         </tr>
         <tr>
            <td colspan="2" align="center">
               <input type="submit" onclick="return Update();" value="수정"> &nbsp;
               <a href="javascript:history.go(-1);">이전페이지로</a>
            </td>
         </tr>
      </table>
      <input type="hidden" name="memberId" value="${loginUser.memberId }">
      <input type="hidden" name="placeKey" value="${preview.placeKey }">
      <input type="hidden" name="prKey" value="${preview.prKey }">
      <input type="hidden" name="prPhoto" value="${preview.prPhoto }">
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
	function Update() {
		return confirm("리뷰를 수정하시겠습니까?")
	}
	</script>
</body>
</html>