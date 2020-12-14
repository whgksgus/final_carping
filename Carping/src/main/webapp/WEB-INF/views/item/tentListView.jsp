<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰</title>
</head>
<style>
a {
	text-decoration: none;
	color: black;
	
}

#shopping {
	width: 1000px;
	height: 100px;
	padding-left: 100px;
	 
}

#title {
	padding-top: 50px;
	text-align: left;
	font-size: 30px;
	font-weight: bold;
}

#item_category {
	float: left;
	width: 100%;
	text-align: left;
	font-size: 21px;
	color: darkgray;
	font-weight: bold;
}

#item_sortby {
	float: left;
	width: 100%;
	text-align: right;
	font-size: 15px;
	color: black;
	padding-right: 100px;
}

#sortby {
	margin: 0px 16px;
}

#sortby:hover {
	font-weight: bold;
}

#item {
	margin: 100px 100px;
}

#item_img {
	margin: 20px 10px;
	width: 350px;
	height: 350px;
}

#item_img:hover {
	transition-duration: 1s;
	transform: scale(1.03);
}

#item_name {
	margin-top: 5px;
	font-size: 20px;
}

#item_price {
	font-size: 15px;
}

ul, li {
	line-height: auto;
	list-style: none;
	text-align: center;
	float: left;
	line-height: center;
}

#li_category:hover {
	color: #d68060;
	cursor: pointer;
}
#cart_icon:hover {
	cursor: pointer;
	transition-duration: 0.7s;
	transform: scale(1.2);
}


</style>
<body>
	<jsp:include page="../common/nav.jsp" />
	<div id="shopping" style="padding-left: 150px;">
		<legend id="title">쇼핑몰
			<a href="cartListView.do">
				<img id="cart_icon" src="../../../resources/itemImage/cart.png" style="width: 37px; height:45px; padding-bottom:10px;">
			</a>
		</legend>
		<div id="item_category">
			<ul>
				<li id="li_category"><span id="category" style="color: #5bcdc5;">텐트&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
				</li>
				<li id="li_category">
				<span id="category">취사도구&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</li>
				<li id="li_category">
				<span id="category">침구류&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
				</li>
				<li id="li_category">
				<span
				id="category">기타용품&nbsp;</span>
				
				</li>
				</ul>
		</div>
	</div>
	<hr>



	<div id="item_sortby">
		<a href="#"><span id="sortby">최신순</span></a>| <a href="#"><span
			id="sortby">낮은가격순</span></a>| <a href="#"><span id="sortby">높은가격순</span></a>
	</div>
	<div id="item"
		style="width: 100%; height: 800px; float: left; padding-left: 100px; padding-right: 150px;">
		
		
		<c:forEach items="${iList }" var="item">
			<c:url var="iDetail" value="itemDetail.do">
				<c:param name="itemKey" value="${item.itemKey }"></c:param>
			</c:url>
			<div id="item_img"
				style="width: 300px; height: 400px; float: left; padding-left: 10px; padding-right: 10px; text-align: center;">

				<a href="${iDetail }"> <img
					src="../../../resources/itemImage/${item.itemImage}"
					style="width: 300px; height: 300px;"></a><br> <a
					href="${iDetail }">${item.itemName }</a> <br>
				<fmt:formatNumber value="${item.itemPrice }" pattern="#,###" />
				원

			</div>
		</c:forEach>


	</div>

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
	<table style="width: 100%; text-align: center; padding-top: 300px;">
		<tr align="center" height="20">
			<td colspan="6">
				<!-- 이전 --> <c:if test="${pi.currentPage <= 1 }">
					◀&nbsp;
				</c:if> <c:if test="${pi.currentPage > 1 }">
					<c:url var="before" value="tentListView.do">
						<c:param name="page" value="${pi.currentPage -1 }"></c:param>
					</c:url>
					<a href="${before }">◀</a>&nbsp;
				</c:if> <!-- 페이지 --> <c:forEach var="p" begin="${pi.startPage }"
					end="${pi.endPage }">
					<c:if test="${p eq pi.currentPage }">
						<font style="font-weight: bold;">${p }</font>
					</c:if>
					<c:url var="pagination" value="tentListView.do">
						<c:param name="page" value="${p }"></c:param>
					</c:url>
					<c:if test="${p ne pi.currentPage }">
						<a href="${pagination }">${p }</a>&nbsp;
					</c:if>
				</c:forEach> <!-- 다음 --> <c:if test="${pi.currentPage >= pi.maxPage }">
					▶&nbsp;
				</c:if> <c:if test="${pi.currentPage < pi.maxPage }">
					<c:url var="after" value="tentListView.do">
						<c:param name="page" value="${pi.currentPage + 1 }"></c:param>
					</c:url>
					<a href="${after }">▶</a>&nbsp;
				</c:if>
			</td>
		</tr>
	</table>

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
</body>

</html>
