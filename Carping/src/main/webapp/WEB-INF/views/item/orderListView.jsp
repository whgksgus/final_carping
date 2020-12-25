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

#ul>li>ul>li:first-child {
	width: 5%;
} /*번호 열 크기*/

#ul>li>ul>li:first-child+li {
	width: 25%;
} /*이미지 열 크기*/

#ul>li>ul>li:first-child+li+li {
	width: 30%;
	
} /*상품정보 열 크기*/

#ul>li>ul>li:first-child+li+li+li {
	width: 15%;
} /*상품금액 열 크기*/

#ul>li>ul>li:first-child+li+li+li+li {
	width: 5%;
} /*수량 열 크기*/

#ul>li>ul>li:first-child+li+li+li+li+li {
	width: 8%;
} /*주문상태 열 크기*/

#ul>li>ul>li:first-child+li+li+li+li+li+li {
	width: 12%;
} /*주문날짜 열 크기*/


</style>

</head>

<body>

   <jsp:include page="../common/nav.jsp" />
	<div style="height:100px;"></div>
   <div id="contents" style="width:100%; height:1000px;">

         <legend id="title">구매내역</legend>
         
         <br>
         <c:if test="${empty orderList}">
            <p style="font-family: 'Sunflower', sans-serif; font-weight:bold; font-size: 23px;">구매내역이 비어있습니다.</p>
            <br>
            <br>
         </c:if>
		
	<div id="order">
      <c:if test="${not empty orderList}">
         	<ul id="ul">
				<li class="li">
					<ul class="ul">
						<li style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="col-md-1 test-center">번호</li>
						<li style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="col-md-3 test-center">이미지</li>
						<li style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="col-md-5 test-center">상품정보</li>
						<li style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="col-md-2 test-center">상품금액</li>
						<li style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="col-md-1 test-center">수량</li>
						<li style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="col-md-2 test-center">주문상태</li>
						<li style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="col-md-3 test-center">주문날짜</li>
					</ul>
				</li>
				<li class="li">
					<c:forEach items="${orderList}" var="order" varStatus="status">
						<c:url var="iDetail" value="itemDetail.do">
                        	<%-- <c:param name="itemKey${test.ITEM_KEY}" value="${test.ITEM_KEY}"></c:param> --%>
                        	<c:param name="itemKey" value="${order.ITEM_KEY}"></c:param>
                        </c:url> 
						<ul class="ul">
							<li style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="li"> ${status.count}</li>
							<li class="li" align="center">
								 <a href="${iDetail}"> 
									<img src="../../../resources/itemImage/${order.ITEM_IMAGE}" width="70px" height="70px" style="margin-top:-20px;">
								</a>
							</li>
							<li class="li" style="font-family: 'Sunflower', sans-serif; font-weight:bold;">
								 <a href="${iDetail}"> 
									<span style="font-size: 18px;">${order.ITEM_NAME}</span>
								</a> 
							</li>
							<li class="li" style="font-family: 'Sunflower', sans-serif; font-weight:bold;">
								<span style="font-size: 18px;">
                           			<fmt:formatNumber value="${order.TOTAL_PRICE}" pattern="#,###"/>원
 								</span></li>
							<li class="li" style="font-family: 'Sunflower', sans-serif; font-weight:bold;">
								<span style="font-size: 18px;">${order.CART_QUANTITY}</span>
                		    </li>
							<li class="li" style="font-size: 15px; font-family: 'Sunflower', sans-serif; font-weight:bold;">
								<span style="font-size: 18px; color: green;">결제완료</span>
							</li>
							<li class="li" style="font-family: 'Sunflower', sans-serif; font-weight:bold;">
								<span style="font-size: 18px;">${order.CART_ORDERDATE}</span>
							</li>
						</ul>
					</c:forEach>
				</li>
			</ul>
            <hr>

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