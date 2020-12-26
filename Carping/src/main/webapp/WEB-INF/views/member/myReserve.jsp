<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포장 예약내역</title>
<!-- 상단 아이콘 -->
<link rel="shortcut icon" type="image/x-icon" href="resources/images/carpingLogo.jpg">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
</head>
<body>
	<jsp:include page="../common/nav.jsp"></jsp:include>
	<section style="width:100%; height:800px;">
		<article>
			<div style="height:100px; display:block;"></div>
			<div align="center">
				<h2 style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="h2">포장 예약내역</h2>
				<div style="width: 350px; border-bottom: 2px solid lightgray;"></div>
			</div>
			<br>
			<div class="container">
				<div class="col-md-1"></div>
					<div class="col-md-10">
						<table class="table table-striped">
				<tr>
					<th style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="col-sm-1">번호</th>
					<th style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="col-sm-2">메뉴</th>
					<th style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="col-sm-1">수량</th>
					<th style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="col-sm-2">금액</th>
					<th style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="col-sm-4">예약날짜 및 시간</th>
					<th style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="col-sm-2">총 금액</th>
				</tr>
				<c:forEach items="${reserveList }" var="rList" varStatus="status">
					<tr>
						<td style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="col-sm-1">${status.count}</td>
						<td style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="col-sm-2">${rList.takeOutMenu }</td>
						<td style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="col-sm-1">${rList.torEa }</td>
						<td style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="col-sm-2">${rList.torPrice }</td>
						<td style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="col-sm-4">${rList.torRegDate }</td>
						<td style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="col-sm-2">${rList.torTotalPrice }</td>
					</tr>
				</c:forEach>
			</table>
			</div>
			</div>
		</article>
	</section>
	<!--footer-->
	<jsp:include page="../../../WEB-INF/views/common/footer.jsp"/>
</body>
</html>