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

#order{
   width: 200px;
   height: 70px;
   font-size: 20px;
   font-weight: bold;
   color: white;
   background-color: #5bcdc5;
   border-top-left-radius: 5px;
   border-top-right-radius: 5px;
   border-bottom-right-radius: 5px;
   border-bottom-left-radius: 5px;
   border: none;
   cursor: pointer;
   float: right;
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
	width: 10%;
} /*수량 열 크기*/

#ul>li>ul>li:first-child+li+li+li+li+li {
	width: 10%;
} /*상태 열 크기*/

#ul>li>ul>li:first-child+li+li+li+li+li+li {
	width: 5%;
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
         <c:if test="${empty order}">
            <p>주무내역이 비어있습니다.</p>
            <br>
            <br>
            <div style="text-align: right;">
               <span id="PText">총 0 개의 상품 금액</span> <span id="Pcalculate">
                  + </span> <span id="PText">배송비</span> <span id="Pcalculate"> = </span> <span
                  id="PText">합계</span>
            </div>
            <div style="text-align: right;">
               <span id="Price">0원</span> <span id="DeliveryPrice">0원</span> <span
                  id="TotalPrice">0원</span>
            </div>
            <hr>
         </c:if>
      </form>
		
	<div id="order">
      <c:if test="${not empty order}">
         <form action="#" method="post">
         	<ul id="ul">
				<li class="li">
					<ul class="ul">
						<li class="li">번호</li>
						<li class="li">이미지</li>
						<li class="li">상품정보</li>
						<li class="li">가격</li>
						<li class="li">수량</li>
						<li class="li">상태</li>
						<li class="li">삭제</li>
					</ul>
				</li>
				<li class="li">
					<c:forEach items="${cart}" var="test" varStatus="status">
						<c:url var="iDetail" value="itemDetail.do">
                        	<%-- <c:param name="itemKey${test.ITEM_KEY}" value="${test.ITEM_KEY}"></c:param> --%>
                        	<c:param name="itemKey" value="${test.ITEM_KEY}"></c:param>
                        </c:url> 
						<ul class="ul">
							<li class="li"> ${status.count}</li>
							<li class="li">
								 <a href="${iDetail}"> 
									<img src="../../../resources/itemImage/${test.ITEM_IMAGE}" width="170px" height="170px" style="margin: 20px 30px;">
								</a>
							</li>
							<li class="li" style="text-align: left;">
								 <a href="${iDetail}"> 
									<span style="font-size: 18px;">${test.ITEM_NAME}</span>
								</a> 
							</li>
							<li class="li">
								<span style="font-size: 18px;">
                           			<fmt:formatNumber value="${test.ITEM_PRICE}" pattern="#,###"/>원
 								</span></li>
							<li class="li">
								<input type="number" value="${test.CART_QUANTITY}" min="1" max="99" style="width: 50px; height:25px; text-align: right;"id="cartQuantity${test.CART_QUANTITY}" name="cartQuantity">
                		     	<input type="button" value="변경" id="modifyQuantity" onclick="modifyCartQuantity($('#cartQuantity${test.CART_QUANTITY}').val(), ${test.CART_KEY} )" style="text-align: right;" />
                		    </li>
							<li class="li" style="font-size: 15px;">구매완료</li>
							<li class="li"><input type="button" value= "삭제" id="delItem" onclick="deleteItem( '${test.CART_KEY}' )"></li>
						</ul>
					</c:forEach>
				</li>
			</ul>
            <hr>

               </form>
            </c:if>
     	</div>
      
      <div style="text-align: right; width: 100%;">
         <span>  상품가격 </span> 
         <span>  +  </span> 
         <span> 배송비 </span> 
         <span> = </span> 
         <span> 총 구매 금액</span>
      </div>
            <div style="text-align: right; font-size: 20px;">
               <span id="totalPrice"> <fmt:formatNumber value="${grandTotal}" pattern="#,###"/>원 +</span> 
               <span id="DeliveryPrice">3,000원 =</span> 
               <span id="TotalPrice" style="text-weight:bold; font-size: 20px;">
               <fmt:formatNumber value="${grandTotal+3000}" pattern="#,###" />원
               </span>
               <input type="hidden" id="allCartKeys" value="${cartKeys}"/>
            </div>
            <br><br>
            <br>
            
      <br><br><br><br>
   </div>
<br><br><br><br>
</body>
</html>