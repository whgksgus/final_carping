<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역</title>
<!-- 상단 아이콘 -->
<link rel="shortcut icon" type="image/x-icon" href="resources/images/carpingLogo.jpg">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<style>
#contents {
padding-top: 20px;
padding-left: 10%;
padding-right: 10%;
}

#title {
	padding-top: 50px;
	text-align: left;
	font-size: 40px;
	font-weight: bold;
	font-family: 'Sunflower', sans-serif;
}

#trTag{
vertical-align: center;
	margin-top: auto;
	clear: both;
	padding: 0px auto;
	position: relative;
}

#tdTag{
	vertical-align: center;
}

.ul, .li {
	line-height: auto;
	list-style: none;
	text-align: center;
	padding: 0;
	margin: 0;
	line-height: center;
}

.ul {
	margin-top: 40px;
	width: 90%;
	display:inline-block;
}

.li {
	vertical-align: center;
	margin-top: auto;
	
}

#ul>li:first-child>ul>li {
	background-color: white;
	font-weight: bold;
	text-align: center;
	color: black;
	font-size: 19px;
	border-bottom: 1px solid lightgray;
	border-top: 1px solid lightgray;
}

#ul>li>ul {
	clear: both;
	padding: 0px auto;
	position: relative;
	min-width: 200px;
}

#ul>li>ul>li {
	float: left;
	font-size: 10pt;
	vertical-align: center;
}



</style>

</head>

<body>

   <jsp:include page="../common/nav.jsp" />
	<div style="height:100px;"></div>
   <div id="contents" style="width:100%; height:1000px;">
		<div align="center">
			<h1 class="h1" style="font-weight:bold; font-family: 'Sunflower', sans-serif;">구매내역</h1>
			<div style="width: 350px; border-bottom: 2px solid lightgray;"></div>
		</div>
         <br>
         <c:if test="${empty orderList}">
            <p style="font-family: 'Sunflower', sans-serif; font-weight:bold; font-size: 23px;">구매내역이 비어있습니다.</p>
            <br>
            <br>
         </c:if>
		
	<div id="order">
      <c:if test="${not empty orderList}">
      <div class="container">
				<div class="col-md-1"></div>
					<div class="col-md-13" align="center">
         	<table class="table table-striped">
				<tr>
					<th style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="col-sm-1">번호</th>
					<th style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="col-sm-1">이미지</th>
					<th style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="col-sm-4">상품정보</th>
					<th style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="col-sm-2">상품금액</th>
					<th style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="col-sm-1">수량</th>
					<th style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="col-sm-1">주문상태</th>
					<th style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="col-sm-3">주문날짜</th>
				</tr>
				<c:forEach items="${orderList}" var="order" varStatus="status">
				<tr id="trTag">
						<c:url var="iDetail" value="itemDetail.do">
                        	<%-- <c:param name="itemKey${test.ITEM_KEY}" value="${test.ITEM_KEY}"></c:param> --%>
                        	<c:param name="itemKey" value="${order.ITEM_KEY}"></c:param>
                        </c:url> 
							<td id="tdTag" class="col-sm-1" style="font-family: 'Sunflower', sans-serif; font-weight:bold;"> ${status.count}</td>
							<td id="tdTag" class="col-sm-1" align="center">
								 <a href="${iDetail}"> 
									<img src="../../../resources/itemImage/${order.ITEM_IMAGE}" width="70px" height="70px" style="">
								</a>
							</td>
							<td id="tdTag" class="col-sm-4" style="font-family: 'Sunflower', sans-serif; font-weight:bold;">
								 <a href="${iDetail}"> 
									<span style="font-size: 18px;">${order.ITEM_NAME}</span>
								</a> 
							</td>
							<td id="tdTag" class="col-sm-2" style="font-family: 'Sunflower', sans-serif; font-weight:bold;">
								<span style="font-size: 18px;">
                           			<fmt:formatNumber value="${order.TOTAL_PRICE}" pattern="#,###"/>원
 								</span></td>
							<td id="tdTag" class="col-sm-1"  style="font-family: 'Sunflower', sans-serif; font-weight:bold;">
								<span style="font-size: 18px;">${order.CART_QUANTITY}</span>
                		    </td>
							<td id="tdTag" class="col-sm-1" style="font-size: 15px; font-family: 'Sunflower', sans-serif; font-weight:bold;">
								<span style="font-size: 18px; color: green;">결제완료</span>
							</td>
							<td id="tdTag" class="col-sm-3" style="font-family: 'Sunflower', sans-serif; font-weight:bold;">
								<span style="font-size: 18px;">${order.CART_ORDERDATE}</span>
							</td>
					</tr>
				</c:forEach>
			</table>
			</div>
			</div>
            </c:if>
     	</div>
        <div style="text-align: right; font-size: 20px;">
        </div>
        <br><br>
        <br>
      <br><br><br><br>
   </div>
<br>
	<br>
	<!--footer-->
	<jsp:include page="../../../WEB-INF/views/common/footer.jsp"/>
</body>
</html>