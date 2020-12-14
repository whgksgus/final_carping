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
<script type="text/javascript">

	        function fnCart(itemName, itemPrice) {
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
		        $("#count").on("click", function(e){
		           var amount = ( ${item.itemPrice} * $("#count").val() );
		           $('#item_total b').empty();
		           $("#item_total b").append("총 금액 : " + amount + "원");
		   		 });
		    });
</script>
</head>
<style>
ul, li {
	margin: 15px 0px;
	padding: 0px;
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
	<jsp:include page="../common/nav.jsp"/>
	<br>
	<br>
	<br>
	<hr>
		<div id="itemImage">
			<img src="${item.itemImage}" style="width: 550px; height: 550px;">
		</div>

		<div id="itemInfo">
			<input style="display:none;" type="text" id="itemName" value="${item.itemName}"/>
			<input style="display:none;" type="text" id="itemKey" value="${item.itemKey}"/>
			<input style="display:none;" type="text" id="itemPrice" value="${item.itemPrice}"/>
			<ul>

				<li style="font-weight: bold; font-size: 23px; margin: 10px;">${item.itemName}</li>
				<hr>
				<li style="margin: 20px 10px;">가격<span
					style="position: relative; left: 131px;">
				<fmt:formatNumber value="${item.itemPrice }" pattern="#,###"/>원</span></li>

				<li style="margin: 20px 10px;">배송방법<span
					style="position: relative; left: 104px;">택배 (평일 기준 3~5일 소요)</span></li>
				<li style="margin: 20px 10px;">배송비<span
					style="position: relative; left: 122px;">3,000원</span></li>
<!-- 				<li style="margin: 20px 10px;">추가옵션 <select
					style="position: relative; left: 100px; width: 250px; height: 25px;">
						<option value="1" selected>옵션없음</option>
						<option value="2">옵션없음</option> -->
				</select>
				</li>
				<hr>
					<li style="margin: 20px 10px;">수량선택</li>
					<li style="margin: 20px 10px;">${item.itemName}
				<input type="number" value="1" min="1" max="100" style="width: 50px; height: 25px; position: relative; left: 127px;" id="count" name="quantity">
				</li>
				<hr>
				<li style="margin: 10px; text-align: right;">
				
				
				<div id="item_total">
						<b> 총 금액 : <fmt:formatNumber value="${item.itemPrice }" pattern="#,###"/>원 </b>
						<input type="text" style="display:none" id="totalAmount"/>
				</div>
				<br><br>
				</li>
				
				<div style="text-align: center;">
				<!-- 	<input type="submit" value="Add to Cart" onclick='fnCart("\"" + itemName[i] + "\", \"" + itemPrice[i] + "\")' id="cart"/> -->
					<input type="submit" value="Add to Cart" onclick='fnCart( $("#itemName" ).val(), $( "#itemPrice" ).val() )' id="cart"/>
					<!-- <input type="button" value="Add to Cart" onclick="insertCart.do" id="cart"> -->
					<a href="#">
					<input type="button" value="Buy Now" onclick="" id="buyNow"></a>
				</div>
				</div>
		<br><br><br>
		<br><br><br>
		<br><br><br>
		
	<div id="item_detail" style="text-align:center;">
	<br><br><br>
	<br><br><br>
	<br><br><br>
	<br><br><br>
	<br><br><br>
	<br><br><br>
	<br><br><br>
		<b style="font-size: 20px;">상품 상세 정보</b>
		<hr noshade>
		<img src="${item.itemInfo}" width="1000px">

	</div>
</body>
</html>