<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛집 추천</title>
</head>
<body>
   <jsp:include page="../common/nav.jsp"></jsp:include>
   <br><br>
   <div style="margin-left:100px;">
      <form action="placeSearch.do" method="get">
            <h2>맛집 추천</h2><br>
            <select name="sido">
                <option value="강원">강원</option>
                <option value="경기">경기</option>
            </select>&nbsp;&nbsp;&nbsp;&nbsp;
            <input name="address" type="text" placeholder="시 입력"/>&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="submit" value="검색"/>
        </form>
   </div>
   <br><br>
   
   <!-- 지도 표시되는 부분 -->
      <!-- 지도 표시되는 부분 -->
   <div id="map" style="width:1300px;height:400px; margin-left:100px;"></div>
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fdad10ac286b199d49c10545308769af"></script>
   <script>
   var fList = new Array();
   <c:forEach items="${fList}" var="list">
      var key = ${list.foodZoneKey};
   var name = "${list.foodZoneName}";
   var addr = "${list.foodZoneAddress}";
   var geocode = "${list.foodZoneGeoCode}";
   var geocodeArr = geocode.split(', ',2);
   var phone = "${list.foodZonePhone}";
   var image = "${list.foodZoneImage}";
   var etc = "${list.foodZoneEtc}";
   var avg = ${list.scoreAvg};
   //jstl 객체를 for each문으로 자바스크립트 변수에 저장
   
   var arr ={
      foodZoneKey : key,
      foodZoneName : name,
      foodZoneAddress : addr,
      foodZoneGeoCodeX : geocodeArr[0],
      foodZoneGeoCodeY : geocodeArr[1],
      foodZonePhone : phone,
      foodZoneImage : image,
      foodZoneEtc : etc,
      scoreAvg : avg
   };
   //자바스크립트 객체에 변수 삽입 후 객체 배열 생성
      fList.push(arr);
   //fList라는 배열안에 arr객체배열을 넣음
   </c:forEach>
   var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
       mapOption = { 
           center: new kakao.maps.LatLng(37.7224013131875, 127.590475961846), // 지도의 중심좌표
           level: 11 // 지도의 확대 레벨
       };
   
   var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
  
   var arr2 = new Array();
   var x = new Array();
    for(var i=0; i<fList.length;i++){
     x = {
           title : fList[i].foodZoneName,
           latlng : new kakao.maps.LatLng(fList[i].foodZoneGeoCodeX, fList[i].foodZoneGeoCodeY) 
     }
     //for문으로 fList에 있는 객체배열 순서대로 title, latlng를 빼와서 x라는 배열에 저장
     arr2.push(x);
     //arr2라는 배열에 x 배열 저장
  } 
   // 마커를 표시할 위치와 arr2 객체 배열입니다 
   var positions = arr2;
   // 마커 이미지의 이미지 주소입니다
   var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
       
   for (var i = 0; i < positions.length; i ++) {
       
       // 마커 이미지의 이미지 크기 입니다
       var imageSize = new kakao.maps.Size(24, 35); 
       
       // 마커 이미지를 생성합니다    
       var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
       
       // 마커를 생성합니다
       var marker = new kakao.maps.Marker({
           map: map, // 마커를 표시할 지도
           position: positions[i].latlng, // 마커를 표시할 위치
           title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
           image : markerImage // 마커 이미지 
       });
   }

   </script>

   
   <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>