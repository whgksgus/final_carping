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
                 url: "updateCartList.do",
                 type: "POST",
                 data: JSON.stringify( data ),
                 dataType : "json",
                 contentType: "application/json; charset=utf-8",
               }).done( function( data ) {
                  // data > 0 >>> 장바구니 등록 성공 / data == 0 >>> 장바구니 등록 실패
                  if( data > 0 ) {
                     if( confirm( "변경을 확인하시겠습니까?" ) ) {
                        // 페이지 이동
                        window.location.href = "cartListView.do";
                     } else {
                        // 현재 페이지 위치
                        return false;
                     }
                  } else {
                     alert( "수량 변경에 실패하였습니다." );
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

#btnbuy {
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

         <legend id="title">장바구니</legend>
         
         <br>
         <c:if test="${empty cart}">
            <p>장바구니가 비어있습니다.</p>
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
            <input type="submit" value="구매하기" id="btnbuy">
         </c:if>
      </form>
		
		<div id="cart">
      <c:if test="${not empty cart}">
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
                        	<c:param name="itemKey" value="${test.ITEM_KEY}"></c:param>
                        </c:url>
					
						<ul class="ul">
							<li class="li"> ${status.count }</li>
							<li class="li">
								 <a href="${iDetail }"> 
									<img src="../../../resources/itemImage/${test.ITEM_IMAGE}" width="170px" height="170px" style="margin: 20px 30px;">
								</a>
							</li>
							<li class="li" style="text-align: left;">
								 <a href="${iDetail }"> 
									<span style="font-size: 18px;">
									${test.ITEM_NAME}</span>
								</a>
							</li>
							<li class="li">
								<span style="font-size: 18px;">
                           			<fmt:formatNumber value="${test.ITEM_PRICE}" pattern="#,###"/>원
 								</span></li>
							<li class="li">
								<input type="number" value="${test.CART_QUANTITY}" min="1" max="99" style="width: 50px; height: 25px; text-align: right;"id="cartQuantity" name="cartQuantity">
                		     	<input type="button" value="변경" id="modifyQuantity" onclick="modifyCartQuantity()" style="text-align: right;" />
                		     </li>
							<li class="li">${text.CART_STATUS }</li>
							<li class="li"><input type="button" value= "삭제" id="delItem" data-cartNum="${test.CART_KEY}" onclick="deleteItem()"></li>
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
               <span id="Price">${test.ITEM_PRICE * test.CART_QUANTITY}원 +</span> 
               <span id="DeliveryPrice">3,000원 =</span> 
               <span id="TotalPrice" style="text-weight:bold;">
               <fmt:formatNumber value="${(test.ITEM_PRICE * test.CART_QUANTITY)+3000}" pattern="#,###"/>원
               </span>
            </div>
            <br><br>
            <br>
            
      <input type="submit" value="구매하기" id="btnbuy"/>
      
      <br><br><br><br>
   </div>
<br><br><br><br>
</body>
</html>