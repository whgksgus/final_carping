<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script type="text/javascript">
			$.ajaxSetup({ async:false });
	        function fnCart(itemName, itemPrice) {
	        	console.log( "itemName", itemName );
	        	console.log( "itemPrice", itemPrice );
	        	if(confirm("장바구니에 담으시겠습니까?")) {
	        		var data = {
	        			cartQuantity : $("#count").val(),			// 상품수량
	        			itemKey : $( "#itemKey" ).val(),			// 아이템 키
	        			itemName : $( "#itemName" ).val(),			// 아이템 이름
	        			itemPrice : $( "#itemPrice" ).val()			// 아이템 가격
	        		}
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
	        	}
	        }
	        function fnView() {
	        	if(confirm("장바구니로 이동하시겠습니까?")){
	        		location.href = "cartListView.jsp";
	        	}
	        }
	         
	 	    $(document).ready(function() {
	 	    	var amount = ( $( "#itemPrice" ).val() * $("#count").val() + 3000 );
		           console.log( amount );
		           $('#item_total b').empty();
		           $("#item_total b").append("상품 금액 : " + comma( amount ) + "원");
		           
		        $("#count").on("click", function(e){
		           var amount = ( $( "#itemPrice" ).val() * $("#count").val() + 3000 );
		           console.log( amount );
		           $('#item_total b').empty();
		           $("#item_total b").append("상품 금액 : " + comma( amount ) + "원");
		   		 });
		    });
	 	    
	 	   function comma(num){
	 		    var len, point, str; 
	 		       
	 		    num = num + ""; 
	 		    point = num.length % 3 ;
	 		    len = num.length; 
	 		   
	 		    str = num.substring(0, point); 
	 		    while (point < len) { 
	 		        if (str != "") str += ","; 
	 		        str += num.substring(point, point + 3); 
	 		        point += 3; 
	 		    } 
	 		     
	 		    return str;
	 		 
	 		}

	 	    
	 	    
	 	     // buy now payment
	 	     function buyNowPay( cartAmount ){
	 	  	   var amount = cartAmount + 3000;
	 	  	   console.log( "totalAmount", amount );
	 			var IMP = window.IMP;
	 			IMP.init('imp42719088');
	 			IMP.request_pay({
	 			    pg : 'html5_inicis',
	 			    pay_method : 'card',
	 			    merchant_uid : 'merchant_' + new Date().getTime(),
	 			    name : '주문명:결제테스트',
	 			    amount : 100,
	 			    buyer_email : 'iamport@siot.do',
	 			    buyer_name : '윤한결',
	 			    buyer_tel : '010-1234-5678',
	 			    buyer_addr : '서울특별시 용산구',
	 			    buyer_postcode : '12345',
	 			    m_redirect_url : 'http://localhost:9999/'
	 			}, function(rsp) {
	 			    if ( rsp.success ) {
	 			        var msg = '결제가 완료되었습니다.';
	 			        afterPayment();
	 			    } else {
	 			        var msg = '결제에 실패하였습니다.';
	 			        msg += '에러내용 : ' + rsp.error_msg;
	 			    }
	 			    //alert(msg);
	 			});
	 		} 
	 	       
	 	       // after payment ajax
	 			function afterPayment() {
	 				var items = {
	 					itemKey : $("#itemKey").val(),
	 					cartQuantity : $('#count').val()
	 				}
	 				console.log( "items>>> ", items );
	 				$.ajax({
	 					url: "orderItem.do",
	 					type: "POST",
	 					data: JSON.stringify( items ),
	 					dataType : "json",
	 					contentType: "application/json; charset=utf-8",
	 				}).done( function( data ) {
	 					console.log( "result", data );
	 					if( data > 0 ) {
	 						if( confirm( "결제가 완료되었습니다.\n구매내역으로 이동하시겠습니까?" ) ) {
								// 페이지 이동
	 							window.location.href = "myOrderView.do";
							} else {
								// 현재 페이지 위치
								return false;
							}
	 					} else {
	 						alert( "구매에 실패하였습니다" );
	 					}
	 				}).fail( function( error ) {
	 					console.log( error );
	 				});
	 			}
	 	 
</script>
</head>
<style>
ul, li {
	list-style: none;
}

#inputbox {
	border: 1px solid black;
	width: 185px;
	height: 25px;
}

#itemImage {
	float: left;
	padding-left: 15%;
}

#item {
	width: 100%;
}

#itemInfo {
	float: right;
	padding-right: 15%;
}

#cart {
	width: 200px;
	height: 70px;
	background-color: #d68060;
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

#buyNow {
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
	<jsp:include page="../common/nav.jsp" />
	<div style="height: 120px;"></div>
	<div style="margin-left: 290px;">
		<h2 style="font-family: 'Sunflower', sans-serif; font-weight: bold;"
			id="itemName">${item.itemName}</h2>
		<br>
		<div style="width: 700px; border-bottom: 2px solid lightgray;"></div>
	</div>
	<br>
	<br>
	<div id="itemImage">
		<img src="../../../resources/itemImage/${item.itemImage}"
			style="width: 550px; height: 550px;">
	</div>

	<div id="itemInfo">
		<input type="hidden" id="itemKey" value="${item.itemKey}" /> <input
			type="hidden" id="itemPrice" value="${item.itemPrice}" />
		<ul>

			<li
				style="font-family: 'Sunflower', sans-serif; font-weight: bold; font-size: 23px; margin: 10px;">${item.itemName}</li>
			<br>
			<li style="font-family: 'Sunflower', sans-serif; margin: 20px 10px;">가격<span
				style="font-family: 'Sunflower', sans-serif; position: relative; left: 134px;">
					<fmt:formatNumber value="${item.itemPrice}" pattern="#,###" />원
			</span></li>
			<!-- 				<li style="margin: 20px 10px;">추가옵션 <select
					style="position: relative; left: 100px; width: 250px; height: 25px;">
						<option value="1" selected>옵션없음</option>
						<option value="2">옵션없음</option> -->

			<li style="font-family: 'Sunflower', sans-serif; margin: 20px 10px;">배송방법<span
				style="font-family: 'Sunflower', sans-serif; position: relative; left: 108px;">택배
					(평일 기준 3~5일 소요)</span></li>
			<li style="font-family: 'Sunflower', sans-serif; margin: 20px 10px;">배송비<span
				style="font-family: 'Sunflower', sans-serif; position: relative; left: 123px;">3,000원</span></li>
			<li style="font-family: 'Sunflower', sans-serif; margin: 20px 10px;">수량선택
				<input type="number" value="1" min="1" max="100"
				style="font-family: 'Sunflower', sans-serif; width: 50px; height: 25px; position: relative; left: 104px;"
				id="count" name="quantity">
			</li>

			<li
				style="font-family: 'Sunflower', sans-serif; margin: 10px; text-align: right;">

				<br> <br>
				<div id="item_total">
					<b>상품 금액 : <fmt:formatNumber value="${item.itemPrice}"
							pattern="#,###" />원
					</b> <input type="text" style="display: none" id="totalAmount" />
				</div> <br>
			<br>
			</li>

			<div style="text-align: center;">
				<!-- 	<input type="submit" value="Add to Cart" onclick='fnCart("\"" + itemName[i] + "\", \"" + itemPrice[i] + "\")' id="cart"/> -->
				<input type="submit" value="Add to Cart"
					onclick='fnCart( $("#itemName" ).val(), $( "#itemPrice" ).val() )'
					id="cart" />
				<!-- <input type="button" value="Add to Cart" onclick="insertCart.do" id="cart"> -->
				<a href="#"> <input type="button" value="Buy Now"
					onclick="buyNowPay(${item.itemPrice})" id="buyNow"></a>
			</div>
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
	<div
		style="margin-left: 10%; height: 100px; width: 80%; border-bottom: 3px solid lightgray; display: inline-block"></div>
	<div id="item_detail" style="text-align: center;" align="center">
		<div id="item_detail" style="text-align: center;">
			<br>
			<br>
			<br>
			<h2 style="font-family: 'Sunflower', sans-serif; font-weight: bold;">
				상품 상세 정보</b> <br>
				<br> <img src="../../../resources/itemImage/${item.itemInfo}"
					width="1000px">
		</div>
		<br> <br>
		<!--footer-->
		<jsp:include page="../../../WEB-INF/views/common/footer.jsp"/>
</body>
</html>