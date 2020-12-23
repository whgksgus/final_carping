<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<style>
#contents {
padding-top: 20px;
padding-left: 10%;
padding-right: 10%;
}

#title {
   text-align: left;
   font-size: 30px;
   font-weight: bold;
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
	margin-top: 10px;
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
	width: 26%;
	
} /*상품정보 열 크기*/

#ul>li>ul>li:first-child+li+li+li {
	width: 15%;
} /*가격 열 크기*/

#ul>li>ul>li:first-child+li+li+li+li {
	width: 6%;
} /*수량 열 크기*/

#ul>li>ul>li:first-child+li+li+li+li+li {
	width: 10%;
} /*상태 열 크기*/

#ul>li>ul>li:first-child+li+li+li+li+li+li {
	width: 11%;
} /*삭제 열 크기*/

#ul>li>ul>li:first-child+li+li+li+li+li+li+li {
	width: 7%;
} 

</style>

</head>

<body>

   <jsp:include page="../common/nav.jsp"/>
   <div id="contents">
      <form action="#" method="post">

         <legend id="title">주문내역</legend>
         
         <br>
         <c:if test="${empty orderList}">
            <p style="font-size: 23px;">주문내역이 비어있습니다.</p>
            <br>
            <br>
         </c:if>
      </form>
		
	<div id="order">
      <c:if test="${not empty orderList}">
         <form action="#" method="post">
         	<ul id="ul">
				<li class="li">
					<ul class="ul">
						<li class="li">번호</li>
						<li class="li">이미지</li>
						<li class="li">상품정보</li>
						<li class="li">상품금액</li>
						<li class="li">수량</li>
						<li class="li">주문상태</li>
						<li class="li">주문날짜</li>
					</ul>
				</li>
				<li class="li">
					<c:forEach items="${orderList}" var="order" varStatus="status">
						<c:url var="iDetail" value="itemDetail.do">
                        	<%-- <c:param name="itemKey${test.ITEM_KEY}" value="${test.ITEM_KEY}"></c:param> --%>
                        	<c:param name="itemKey" value="${order.ITEM_KEY}"></c:param>
                        </c:url> 
						<ul class="ul">
							<li class="li"> ${status.count}</li>
							<li class="li">
								 <a href="${iDetail}"> 
									<img src="../../../resources/itemImage/${order.ITEM_IMAGE}" width="170px" height="170px" style="margin: 20px 30px;">
								</a>
							</li>
							<li class="li" style="text-align: left;">
								 <a href="${iDetail}"> 
									<span style="font-size: 18px;">${order.ITEM_NAME}</span>
								</a> 
							</li>
							<li class="li">
								<span style="font-size: 18px;">
                           			<fmt:formatNumber value="${order.ITEM_PRICE}" pattern="#,###"/>원
 								</span></li>
							<li class="li">
								<span style="font-size: 18px;">${order.CART_QUANTITY}</span>
                		    </li>
							<li class="li" style="font-size: 15px;">
								<span style="font-size: 18px; color: green;">결제완료</span>
							</li>
							<li class="li">
								<span style="font-size: 18px;">${order.CART_ORDERDATE}</span>
							</li>
						</ul>
					</c:forEach>
				</li>
			</ul>
            <hr>

               </form>
            </c:if>
     	</div>
        <div style="text-align: right; font-size: 20px;">
        </div>
        <br><br>
        <br>
      <br><br><br><br>
   </div>
<br><br><br><br>
</body>
</html>