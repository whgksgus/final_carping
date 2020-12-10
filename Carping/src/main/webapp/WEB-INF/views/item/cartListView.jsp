<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>장바구니</title>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<style> 
    
    #title {
        text-align: center; 
        font-size: 30px;
        font-weight: bold;
    }
    #btnbuy {
	        width: 200px;
	        height: 70px;
	        background-color: #5bcdc5;
	        color: white;
	        font-size: 20px;
	        font-weight: bold;
	        border-top-left-radius: 5px;
	        border-top-right-radius: 5px;
	        border-bottom-right-radius: 5px;
	        border-bottom-left-radius: 5px;
	        border: none;
	        cursor: pointer;
	        margin: 0px 25px;
    }
</style>

<body>
    <div id="contents">
       		 <form action="#" method="post">
            <legend id="title">장바구니</legend><br>
            <hr><br><br> 
      <c:if test="${empty cart }"> 
            <p>장바구니가 비어 있습니다</p><br><br>
            <div style="text-align: right;">
                <span id="PText">총 0 개의 상품 금액</span>
                <span id="Pcalculate"> + </span>
                <span id="PText">배송비</span>
                <span id="Pcalculate"> = </span>
                <span id="PText">합계</span>
            </div>
            <div style="text-align: right;">
                <span id="Price">원</span>
                <span id="DeliveryPrice">3,000원</span>
                <span id="TotalPrice">원</span>
            </div>
            <hr>
            <input type="submit" value="구매하기" id="btnbuy">
        </form>
     </c:if>
     <c:if test="${not empty cart }">
        <form action="#" method="post">
            <legend id="legendtitle">장바구니</legend><br>
            <hr>
            <br><br>
             <ul id="ulTable" class="myul">
                <li class="myli">
                    <ul class="myul">
                        <li class="myli">..</li>
                        <li class="myli">..</li>
                        <li class="myli">..</li>
                        <li class="myli">..</li>
                    </ul>
                </li>
                <!-- 게시물이 출력될 영역 -->
                <li class="myli">
                    <ul class="myul">
                        <li class="myli"><img src="${cart.itemImage }" width="135px" height="131px"></li>
                        <li class="myli">
                            <div class="verticalO">${cart.itemName }</div>
                        </li>
                        <li class="myli">
                            <div class="verticalO"></div>
                        </li>
                        <li class="myli">
                            <div class="verticalO"></div>
                        </li>
                    </ul>
                </li>
            </ul>

            <br><br>
            <div style="text-align: right;">
                <span id="PText">총 ${cart.cartQuantity} 개의 상품 금액</span>
                <span id="Pcalculate"> + </span>
                <span id="PText">배송비</span>
                <span id="Pcalculate"> = </span>
                <span id="PText">합계</span>
            </div>
            <div style="text-align: right;">
                <span id="Price">${item.itemPrice * cart.cartQuantity}원</span>
                <span id="DeliveryPrice">3,000원</span>
                <span id="TotalPrice">${(item.itemPrice * cart.quantity)+3000}원</span>
            </div>
            <hr>
            <input type="submit" value="구매하기" id="btnbuy">
            </form>
            <form action="deleteCart.do" method="post">
	            <input type="hidden" value="${item.itemImage }" name="img">
	            <input type="hidden" value="${item.itemKey }" name="productNo">
	            <input type="hidden" value="${item.itemName }" name="productName">
	            <input type="hidden" value="${item.itemPrice}" name="price">
	            <input type="submit" value="상품 삭제" id="btndel">
        </form>
        </c:if>
    </div>

</body>
</html>