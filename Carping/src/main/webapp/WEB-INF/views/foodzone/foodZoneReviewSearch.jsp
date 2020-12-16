<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛집 리뷰게시판 검색</title>
</head>
<body>
	<jsp:include page="../common/nav.jsp"></jsp:include>
	<section style="margin-top: 40px;">
		<article>
			<h3>맛집 검색</h3>
			<form action="foodZoneSearch.do" method="post">
			<div class="container">
			    <div class="row">
			        <div class="col-sm-2"></div>
			        <div class="col-sm-8" style="float: left;">
			        	<select id="searchCondition" name="searchCondition" class="form-control col-sm-2" style="width: 20%; text-align: center;">
			        		<option value="맛집이름">맛집 이름</option>
			        		<option value="주소">주소</option>
			        	</select>&nbsp;
			        	<input type="text" class="form-control col-sm-7" style="width : 50%;" id="searchValue" name="searchValue">
			        	&nbsp;<button class="btn btn-default col-sm-1">검색</button>
			        </div>
			        <div class="col-sm-2"></div>
			    </div>
			   </div>
			   </form>
			   <br><br><br>
			   <form action="foodZoneReviewListView.do" method="get">
			   <div class="container">
			    <div class="row">
			        <div class="col-sm-2"></div>
			        <div class="col-sm-7">
			        	<table class="table table-striped" style="text-align: center;">
							<tr>
								<th class="col-md-3 text-center">장소명</th>
								<th class="col-md-7 text-center">주소</th>
								<th class="col-md-2">선택</th>
							</tr>
							<c:forEach items="${fList}" var="list" varStatus="status">
								<tr>
									<td>${list.foodZoneName }</td>
									<td>${list.foodZoneAddress }</td>
									<c:if test="${status.count eq 1 }">
										<td class="text-center"><input type="radio" name="foodZoneKey" value="${list.foodZoneKey}" class="radio" checked="checked"></td>
									</c:if>
									<c:if test="${status.count ne 1 }">
										<td class="text-center"><input type="radio" name="foodZoneKey" value="${list.foodZoneKey}" class="radio"></td>
									</c:if>

									
								</tr>
							</c:forEach>
						</table>
			        </div>
			        <div class="col-sm-3"> </div>
			    </div>
			  </div>
				<div class="container">
			        <div class="col-sm-2"></div>
			        	<div class="col-sm-7">
			        		<button class="btn btn-success" style="width: 100%;" onsubmit="return chk();">리뷰 보러 가기!</button>
			        	</div>
			   		<div class="col-sm-3"></div>
			   </div>
			  </form>
		</article>
	</section>
	<script>
		
	</script>
</body>
</html>