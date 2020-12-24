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
	#firstTb tr>td{
		vertical-align: middle;
	}
	#menu tr>td{
		vertical-align: middle;
	}
	#total{
		font-family: 'Sunflower', sans-serif;
		font-size: 1.5em;
		width: 1100px;
	}
	#btn{
		font-family: 'Sunflower', sans-serif;
		font-size: 1.5em;
		width: 1100px;
	}
</style>
<link rel="shortcut icon" type="image/x-icon" href="resources/images/carpingLogo.jpg">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
<!-- 합쳐지고 최소화된 최신 CSS -->

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet" >

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../../../resources/jquery.timepicker.min.js"></script>
<link type="text/css" rel="stylesheet" href="../../../resources/jquery.timepicker.css">
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<body>
<jsp:include page="../common/nav.jsp"></jsp:include>

<div style="height: 100px;"></div>

<div style="margin-left: 15.5%;">
	<h2 style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="h2">테이크아웃 예약하기</h2>
	<div style="width: 300px; border-bottom: 2px solid lightgray;"></div>
</div>
<br><br>

<table align="center" id="firstTb" class="table table-bordered" style="width: 900px; font-family: 'Sunflower', sans-serif; font-size: 1.2em;">
	<tr>
		<td rowspan="6"><img src="../../../resources/images/${foodZone.foodZoneImage }" style="width: 300px; height: 300px;"></td>
		<td>${foodZone.foodZoneName}</td>
	</tr>
	<tr>
		<td>${foodZone.foodZoneAddress }</td>
	</tr>
	<tr>
		<td>${foodZone.foodZonePhone}</td>
	</tr>
	<tr>
		<td><input type="date" id="takeOutDay" value="2020-12-29" min="2020-12-27" max="2020-12-30"></td>
	</tr>
	<tr>
		<td><input type="time" id="takeOutTime" value="13:00" min="13:00" max="21:00"></td>
	</tr>
	<tr>
		<td>
			<select id="menuSelect">
				<c:forEach items="${tList}" var="menuL">
					<option>${menuL.takeOutMenu}</option>
				</c:forEach>
			</select>
			<button id="menuChoice" class="btn btn-info" onclick="menuInsert();">+</button>
		</td>
	</tr>
</table>
<script>
	
</script>
<!-- <td><img src="../../../resources/images/menu/${menuList.takeOutMenuPhoto}"></td>
		<td>${menuList.takeOutMenu}</td>
		<td><input type="number" value="1" min="1" class="menuEa" style="width: 50px;"></td>
		<td><span><fmt:formatNumber type="number" maxFractionDigits="3" value="${menuList.takeOutMenuPrice}" />원</span><input type="hidden" value="${menuList.takeOutMenuPrice}"></td>
		<td><span><fmt:formatNumber type="number" maxFractionDigits="3" value="${menuList.takeOutMenuPrice}" />원</span><input type="hidden" value="${menuList.takeOutMenuPrice}"></td>
		<td><button onclick="del(this);" class="btn btn-danger">X</button></td> -->
<br><br>
<table id="menu" style="text-align: center; width: 1100px; font-family: 'Sunflower', sans-serif;"  align="center" class="table table-bordered">
<thead>
	<tr>
		<th class="text-center">메뉴 사진</th>
		<th class="text-center">이름</th>
		<th class="text-center">수량</th>
		<th class="text-center">가격</th>
		<th class="text-center">총 금액</th>
		<th class="text-center">삭제</th>
	</tr>
</thead>


<tbody id="menuList">	
</tbody>
</table>
<div align="center">
	<div id="total" style="text-align: right;"></div>
	
</div>
<div align="center">
	<div id="btn" align="right">
			<button class="btn btn-info" onclick="back();">목록으로</button>
			<button class="btn btn-danger" onclick="pay();">결제하기</button>
	</div>
</div>
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
			$(".menuEa").click(function(){
				console.log('test');
				var td = $(this).parent().parent().children();
				var menuEa = parseInt($(this).val());
				var price = td.eq(3).children().eq(1).val();
				var dollar = numberWithCommas(price*menuEa);
				td.eq(4).children().eq(0).text(dollar+"원");
				td.eq(4).children().eq(1).val(price*menuEa);
				
				sumPrice();
			});
			// 테이블 생성시에 객체를 만들어보고 넘겨서 받아지는지 할것 12/15;

		});
	 // ##,###원으로 표현해주는 정규표현식
	 	
	 	function sumPrice(){
	 		var x = $("#menu tbody tr").length;
			var sum =0;
			for(var i=0; i<x; i++){
				sum += parseInt($("#menuList").children().eq(i).children().eq(4).children().eq(1).val()); //숫자변환 할것		
			}
			console.log(x);
			console.log(sum);
			
			$("#total").text('총 금액 : '+numberWithCommas(sum)+"원");
	 }
	 
		function numberWithCommas(x) { 
		    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
		var jsonArr = new Array();
	 	function tableFormat(){
	 		
	 		var tr = $("#menuList").children();
	 		var x = $("#menu tbody tr").length;
	 		jsonArr.splice(0,x);
	 		for(var i=0; i<x; i++){
	 			var js = new Object();
	 			js.takeOutMenu = tr.eq(i).children().eq(1).text();
	 			js.menuEa = tr.eq(i).children().eq(2).children().eq(0).val();
	 			js.menuPrice = tr.eq(i).children().eq(3).children().eq(1).val();
	 			js.regDate = $("#takeOutDay").val();
	 			js.time = $("#takeOutTime").val();
	 			js.totalPrice = tr.eq(i).children().eq(4).children().eq(1).val();
	 			js.foodZoneKey = ${foodZone.foodZoneKey};
	 			jsonArr.push(js);
	 			JSON.stringify(jsonArr);
	 			
	 		}
	 		console.log(jsonArr);
	 	}
	 	
	 	function go(){
		 	tableFormat();
	 		$.ajax({
	    		url : "takeOutInsert.do",
	    		data : {data : JSON.stringify(jsonArr)},
	    		type : "post",
	    		success: function(result){
	    			if(result==1){
	    				location.href="takeOutSuccess.do";
	    			}else{
	    				location.href="error.do";
	    			}
	    		}
	    		
	    	});
		 }
	 	
	 //결제 메소드
		function pay(){
		 var question = confirm('결제하시겠어요?');
		 var tr = $("#menuList tr").length;
		 
		 if(question){
			 if(tr>0){
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
					        go();
					        
					        
					    } else {
					        var msg = '결제에 실패하였습니다.';
					        msg += '에러내용 : ' + rsp.error_msg;
					    }
					    alert(msg);
					});
			 }else{
				alert('물건을 담아주시고 결제해주세요.'); 
			 }
		 }
		 
			
		}
		function del(obj){
			var tr = $("#menuList tr").length;
				$(obj).parent().parent().remove();
				sumPrice();

			
			
		}
		
		function back(){
			location.href='foodZoneView.do';
		}
		
		function menuInsert(){
			var menu = $("#menuSelect option:selected").val();
			var tr = $("#menuList tr");
			var chk = 0;
			console.log('tr 길이 : '+tr.length);
			for(var y=0; y<tr.length; y++){
				 if(menu==tr.eq(y).children().eq(1).text()){
					chk = chk+1;
				}
			}
			console.log(chk);
			if(chk==0){
				<c:forEach items="${tList}" var="list">
				var i = "${list.takeOutMenu}";
				if(menu==i){
										
					$("#menuList").append("<tr><td><img src='../../../resources/images/menu/${list.takeOutMenuPhoto}' style='width:100px; height:100px;'></td><td>${list.takeOutMenu}</td><td><input type='number' value='1' min='1' class='menuEa' style='width: 50px;' onclick='change(this);'></td>"
								+"<td><span><fmt:formatNumber type='number' maxFractionDigits='3' value='${list.takeOutMenuPrice}' />원</span><input type='hidden' value='${list.takeOutMenuPrice}'></td><td><span><fmt:formatNumber type='number' maxFractionDigits='3' value='${list.takeOutMenuPrice}'/>원</span><input type='hidden' value='${list.takeOutMenuPrice}'></td>"
								+"<td><button onclick='del(this);' class='btn btn-danger'>X</button></td>");
								sumPrice();
					}
					
/* 					$("#menuList").append("<td><img src='../../../resources/images/menu/${list.takeOutMenuPhoto}' style='width:100px; height:100px;'></td>"
					+"");
					$("#menuList").append("<td>${list.takeOutMenu}</td>");
					$("#menuList").append("<td><input type='number' value='1' min='1' class='menuEa' style='width: 50px;'></td>");
					$("#menuList").append("<td><span><fmt:formatNumber type='number' maxFractionDigits='3' value='${list.takeOutMenuPrice}' />원</span><input type='hidden' value='${list.takeOutMenuPrice}'></td>")
					$("#menuList").append("<td><span><fmt:formatNumber type='number' maxFractionDigits='3' value='${list.takeOutMenuPrice}' />원</span><input type='hidden' value='${list.takeOutMenuPrice}'></td>")
					$("#menuList").append("<td><button onclick='del(this);' class='btn btn-danger'>X</button></td>"); */
					
				
			</c:forEach>
			}else{
				alert('이미 등록된 상품이에요.');
			}
			
		}
		
		function change(obj){
			var td = $(obj).parent().parent().children();
			var menuEa = parseInt($(obj).val());
			var price = td.eq(3).children().eq(1).val();
			var dollar = numberWithCommas(price*menuEa);
			td.eq(4).children().eq(0).text(dollar+"원");
			td.eq(4).children().eq(1).val(price*menuEa);
			
			sumPrice();
		}
	</script>
</body>
	
</html>