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
<script type="text/javascript">
    	function deleteItem() {
			if( confirm( "선택한 상품을 삭제하시겠습니까?" ) ) {
				// delete item
				var cartKey = JSON.stringify( $( '#cartKey' ).val() );
				console.log( $("#delItem").attr( "data-cartNum" ) );
				$.ajax({
      			  url: "deleteCart.do",
      			  type: "POST",
      			  data: cartKey,
      			  dataType : "json",
      			  contentType: "application/json; charset=utf-8",
					}).done( function( data ) {
						console.log( data );
						if( data > 0 ) {
							window.location.reload();
						} else {
							alert( "선택한 상품의 삭제에 실패하였습니다." );
							return false;
						}
					}).fail( function( error ) {
						console.log( error );
					});
			} else {
				return false;
			}
		}
    	
    	function modifyCartQuantity() {
    		if( confirm( "수량을 변경하시겠습니까?" ) ) {
    			// modify quantity
    			$.ajax({
      			  url: "insertCart.do",
      			  type: "POST",
      			  data: JSON.stringify( data ),
      			  dataType : "json",
      			  contentType: "application/json; charset=utf-8",
					}).done( function( data ) {
						// data > 0 >>> 장바구니 등록 성공 / data == 0 >>> 장바구니 등록 실패
						if( data > 0 ) {
							if( confirm( "장바구니로 이동하시겠습니까?" ) ) {
								// 페이지 이동
								window.location.href = "cartListView.do";
							} else {
								// 현재 페이지 위치
								return false;
							}
						} else {
							alert( "장바구니 등록에 실패하였습니다." );
							return false;
						}
					}).fail( function( error ) {
						console.log( error );
					});
    		} else {
    			return false;
    		}
    	}
    </script>
</head>
<style>


ul, li {
	margin: 15px 0px;
	padding: 0px;
	list-style: none;
}


#contents {

padding-top: 20px;
padding-left: 10%;
padding-right: 10%;

}

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
	float: right;
}
</style>


<body>

	<jsp:include page="../common/nav.jsp"/>
	<div id="contents">
		<form action="#" method="post">
			<legend id="title">장바구니</legend>
			<br>
			<br>
			<br>
			<c:if test="${empty cart}">
				<p>장바구니가 비어 있습니다</p>
				<br>
				<br>
				<div style="text-align: right;">
					<span id="PText">총 0 개의 상품 금액</span> <span id="Pcalculate">
						+ </span> <span id="PText">배송비</span> <span id="Pcalculate"> = </span> <span
						id="PText">합계</span>
				</div>
				<div style="text-align: right;">
					<span id="Price">원</span> <span id="DeliveryPrice">3,000원</span> <span
						id="TotalPrice">원</span>
				</div>
				<hr>
				<input type="submit" value="구매하기" id="btnbuy">
			</c:if>
		</form>

		<c:if test="${not empty cart}">
			<form action="#" method="post">
				<br>
				<br>
				<br>
				<ul>

					<c:forEach items="${cart}" var="test">
						<li>
							<ul>
								<li><img src="${test.ITEM_IMAGE}"
									width="300px" height="300px"></li>
								<li >
									<div style="font-weight: bold; font-size: 20px;">${test.ITEM_NAME}</div>
									<input type="button" value="삭제" id="delItem" data-cartNum="${test.CART_KEY}" onclick="deleteItem()">
								</li>
								<li>수량</li>
								<li>
								<input type="number" value="${test.CART_QUANTITY}" min="1"
									max="99"
									style="width: 50px; height: 25px;"id="cartQuantity" name="cartQuantity">
								<input type="button" value="수정" id="modifyQuantity"
									onclick="modifyCartQuantity()" />
							</li>
						<li>
							<fmt:formatNumber value="${test.ITEM_PRICE}" pattern="#,###"/>원
							
						</li>
				</ul>
				</li>
				
				<hr>
				
				<!-- form>
		<form action="deleteCart.do" method="post"> -->
				<input type="hidden" value="${test.ITEM_IMAGE}" name="itemImage" />
				<input type="hidden" value="${test.ITEM_KEY}" name="itemKey" />
				<input type="hidden" value="${test.ITEM_NAME}" name="itemName" />
				<input type="hidden" value="${test.ITEM_PRICE}" name="itemPrice" />
				<input type="hidden" value="${test.CART_KEY}" id="cartKey" /> 
				
				</c:forEach>
				</ul>
			</form>

		</c:if>
		
		
		<div style="text-align: right;">
			<span>  상품가격 </span> 
			<span>  +  </span> 
			<span> 배송비 </span> 
			<span> = </span> 
			<span> 총 구매 금액</span>
		</div>
				<div style="text-align: right;">
					<span id="Price">${test.ITEM_PRICE * test.CART_QUANTITY}원 +</span> 
					<span id="DeliveryPrice">3,000원 =</span> 
					<span id="TotalPrice">${(test.ITEM_PRICE * test.CART_QUANTITY)+3000}원</span>
				</div>
				<br><br>
				<br>
				
		<input type="submit" value="구매하기" id="btnbuy"/>
		
		<br><br><br><br>
	</div>
<br><br><br><br>
</body>
</html>