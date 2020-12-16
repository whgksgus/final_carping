<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰게시판 - 리뷰 등록</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
	<jsp:include page="../common/nav.jsp"></jsp:include>
	<br>
	<br>

	<div style="margin-left: 100px;">
		<h2 class="h2">리뷰게시판 - 등록</h2>
		<div style="width: 350px; border-bottom: 2px solid lightgray;"></div>
	</div>
	<br>
	
	<form action="areaReviewInsert.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="areaKey" value="${area.areaKey }">
      <table align="center">
         <tr>
            <td><input type="text" name="address" value="${area.areaName } : ${area.areaAddress}" size="50" readonly></td>
         </tr>
         <tr>
            <td><input type="text" name="arTitle" placeholder="제목을 입력해주세요" size="50" required></td>
         </tr>
         <tr>
            <td><textarea placeholder="내용을 입력해주세요" cols="50" rows="7" name="arContent" style="resize:none" required></textarea></td>
         </tr>
         <tr>
         	<td>별점<input type="number" max="5" min="1" required name="arScore"/></td>
         </tr>
         <tr>
            <td><input type="file" name="uploadFile"></td>
         </tr>
         <tr>
            <td colspan="2" align="center">
               <input type="submit" onclick="return Add();" value="등록"> &nbsp;
               <c:url var="arList" value="areaReviewListView.do">
               	<c:param name="areaKey" value="${area.areaKey }"></c:param>
               </c:url>
               <a href="${arList }">목록으로</a>
            </td>
         </tr>
      </table>
      <input type="hidden" name="memberId" value="${loginUser.memberId }">
      <input type="hidden" name="areaKey" value="${area.areaKey }">
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