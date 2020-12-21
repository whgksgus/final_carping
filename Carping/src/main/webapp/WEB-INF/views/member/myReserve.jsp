<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포장 예약내역</title>
</head>
<body>
	<jsp:include page="../common/nav.jsp"></jsp:include>
	<section style="margin-top: 40px;">
		<article>
			<h3>포장 예약내역</h3>
			<table class="container">
				<tr>
					<th class="col-sm-1">번호</th>
					<th class="col-sm-2">메뉴</th>
					<th class="col-sm-1">수량</th>
					<th class="col-sm-2">금액</th>
					<th class="col-sm-4">예약날짜 및 시간</th>
					<th class="col-sm-2">총 금액</th>
				</tr>
				<c:forEach items="${reserveList }" var="rList" varStatus="status">
					<tr>
						<td class="col-sm-1">${status.count}</td>
						<td class="col-sm-2">${rList.takeOutMenu }</td>
						<td class="col-sm-1">${rList.torEa }</td>
						<td class="col-sm-2">${rList.torPrice }</td>
						<td class="col-sm-4">${rList.torRegDate }</td>
						<td class="col-sm-2">${rList.torTotalPrice }</td>
					</tr>
				</c:forEach>
			</table>
		</article>
	</section>
	<script>
	</script>
</body>
</html>