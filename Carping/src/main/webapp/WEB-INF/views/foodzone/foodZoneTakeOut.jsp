<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
</style>
</head>
<body>
<jsp:include page="../common/nav.jsp"></jsp:include>
<h1>${foodZone.foodZoneName} 예약하기~</h1>

<table>
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
	
</tbody>
</table>
	<script>
	 var tList = new Array();
	   <c:forEach items="${tList}" var="list">
	   var takeOutKey = ${list.takeOutKey};
	   var foodZoneKey = ${list.foodZoneKey};
	   var takeOutMenu = "${list.takeOutMenu}";
	   var takeOutMenuPrice = ${list.takeOutMenuPrice};
	   var takeOutMenuPhoto = "../../../resources/images/menu/${list.takeOutMenuPhoto}";
	   //jstl 객체를 for each문으로 자바스크립트 변수에 저장
	   
	   var list ={
			takeOutKey : takeOutKey,
			foodZoneKey : foodZoneKey,
			takeOutMenu : takeOutMenu,
			takeOutMenuPrice : takeOutMenuPrice,
			takeOutMenuPhoto : takeOutMenuPhoto
	   };
	   //자바스크립트 객체에 변수 삽입 후 객체 배열 생성
	      tList.push(list);
	   </c:forEach>
	   var insertMenu = "";
	   for(var i=0; i<tList.length;i++){
		   insertMenu += "<tr>";
		   insertMenu += "<td><img src='"+tList[i].takeOutMenuPhoto+"'></td>"
		   insertMenu += "<td>"+tList[i].takeOutMenu+"</td>"
		   insertMenu += "<td><input type='number' value='1' id='num'></td>" //왜 안먹지.? string으로 인식되는거같음...
		   insertMenu += "<td>"+tList[i].takeOutMenuPrice+"</td>"
		   insertMenu += "<td>"+(($('#num').val())*(tList[i].takeOutMenuPrice))+"</td>"
		   insertMenu += "</tr>";
		   console.log($("#num").val());
		   console.log(tList[i].takeOutMenuPrice);
	   }
	   console.log(insertMenu);
	   $("#menuList").append(insertMenu);
	</script>

</body>

</html>