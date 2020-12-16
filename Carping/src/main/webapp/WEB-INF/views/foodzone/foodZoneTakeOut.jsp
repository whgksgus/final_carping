<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테이크아웃 예약</title>
<style>
	#menuList tr td img{
		width: 100px;
		height: 100px;
	}
	table *{
		border: 1px solid black;
		text-align: center;
	}
	table tr th{
		width: 16%;
	}
	
	span{
		border: none;
	}
</style>

<!-- 합쳐지고 최소화된 최신 CSS -->
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet" >

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<body>
<jsp:include page="../common/nav.jsp"></jsp:include>
<h1>${foodZone.foodZoneName} 예약하기~</h1>
<input type="date" id="takeOutDay">
<input type="time" id="takeOutTime">

<table id="menu" style="text-align: center;">
<thead>
	<tr>
		<th>이미지</th>
		<th>메뉴이름</th>
		<th>수량</th>
		<th>가격</th>
		<th>총 금액</th>
	</tr>
</thead>


<tbody id="menuList">
	<c:forEach items="${tList}" var="menuList">
	<tr>
		<td><img src="../../../resources/images/menu/${menuList.takeOutMenuPhoto}"></td>
		<td>${menuList.takeOutMenu}</td>
		<td><input type="number" value="1" min="1" class="menuEa"></td>
		<td><span><fmt:formatNumber type="number" maxFractionDigits="3" value="${menuList.takeOutMenuPrice}" />원</span><input type="hidden" value="${menuList.takeOutMenuPrice}"></td>
		<td><span><fmt:formatNumber type="number" maxFractionDigits="3" value="${menuList.takeOutMenuPrice}" />원</span><input type="hidden" value="${menuList.takeOutMenuPrice}"></td>
	</tr>
	</c:forEach>
	
</tbody>
</table>
<div id="total" style="text-align: center;"></div>
<button onclick="go();">결제하기</button>
	<script>
		
	 //로딩이 된 후 선택자 선택 후 금액 계산(컬럼당 총 금액 , 전체 금액)
		$(document).ready(function(){
			var x = $("#menu tbody tr").length;
			var sum =0;
			for(var i=0; i<x; i++){
				sum += parseInt($("#menuList").children().eq(i).children().eq(4).children().eq(1).val()); //숫자변환 할것		
			}
			
			$("#total").text('총 금액 : '+numberWithCommas(sum)+"원");
			
			
			//number 값이 올라가거나 내려갈 경우 금액을 다시 책정해주는 function
			$(".menuEa").change(function(){
				var td = $(this).parent().parent().children();
				var menuEa = parseInt($(this).val());
				var price = td.eq(3).children().eq(1).val();
				var dollar = numberWithCommas(price*menuEa);
				td.eq(4).children().eq(0).text(dollar+"원");
				td.eq(4).children().eq(1).val(price*menuEa);
				
				
				var x = $("#menu tbody tr").length;
				var sum =0;
				for(var i=0; i<x; i++){
					sum += parseInt($("#menuList").children().eq(i).children().eq(4).children().eq(1).val()); //숫자변환 할것		
				}
				console.log(x);
				console.log(sum);
				
				$("#total").text('총 금액 : '+numberWithCommas(sum)+"원");
				console.log($("#takeOutDay").val());
				console.log($("#takeOutTime").val());
			});
			// 테이블 생성시에 객체를 만들어보고 넘겨서 받아지는지 할것 12/15;
			
		});
	 // ##,###원으로 표현해주는 정규표현식
	 	
		function numberWithCommas(x) { 
		    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
		var jsonArr = new Array();
	 	function tableFormat(){
	 		
	 		var tr = $("#menuList").children();
	 		var x = $("#menu tbody tr").length;
	 		
	 		for(var i=0; i<x; i++){
	 			var js = new Object();
	 			js.takeOutMenu = tr.eq(i).children().eq(1).text();
	 			js.menuEa = tr.eq(i).children().eq(2).children().eq(0).val();
	 			js.menuPrice = tr.eq(i).children().eq(3).children().eq(1).val();
	 			js.regDate = $("#takeOutDay").val();
	 			js.time = $("#takeOutTime").val();
	 			js.totalPrice = tr.eq(i).children().eq(4).children().eq(1).val();
	 			jsonArr.push(js);
	 			JSON.stringify(jsonArr);
	 			
	 		}
	 		console.log(jsonArr);
	 	}
	 	function go(){
		 	tableFormat();
	 		$.ajax({
	    		url : "takeOutInsert.do",
	    		data : {data : jsonArr},
	    		dataType : "json",
	    		type : "get",
	    		success: function(e){
	    			
	    		}
	    		
	    	});
		 }
	 	
	 //결제 메소드
		function pay(){
			var IMP = window.IMP;
			IMP.init('imp63220176');
			IMP.request_pay({
			    pg : 'html5_inicis',
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '주문명:결제테스트',
			    amount : 100,
			    buyer_email : 'iamport@siot.do',
			    buyer_name : '구매자이름',
			    buyer_tel : '010-1234-5678',
			    buyer_addr : '서울특별시 강남구 삼성동',
			    buyer_postcode : '123-456',
			    m_redirect_url : 'http://localhost:9999/'
			}, function(rsp) {
			    if ( rsp.success ) {
			    	
			    	
			        var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num;
			        
			        location.href="takeOutSuccess.do";
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			    }
			    alert(msg);
			});
		}
		
	</script>
</body>
	
</html>