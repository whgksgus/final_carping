<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차박 장소 추천</title>
</head>
<body>
	<jsp:include page="../common/nav.jsp"></jsp:include>
	<br>
	<br>
	<div style="margin-left: 100px;">
		<form action="placeSearch.do" method="get">
			<h2 class="h2">차박 장소 추천</h2>
			<br> <select name="sido">
				<option value="강원">강원</option>
				<option value="경기">경기</option>
			</select>&nbsp;&nbsp;&nbsp;&nbsp; <input name="address" type="text"
				placeholder="시 입력" />&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit"
				value="검색" />
		</form>
	</div>
	<br>
	<br>

	<!-- 지도 표시되는 부분 -->
	<div id="map" style="width: 1300px; height: 400px; margin-left: 100px;"></div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fdad10ac286b199d49c10545308769af"></script>
	<script>
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
          mapOption = { 
              center: new kakao.maps.LatLng(37.7224013131875, 127.590475961846), // 지도의 중심좌표
              level: 3 // 지도의 확대 레벨
          };
      
      var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
       
      // 마커를 표시할 위치와 title 객체 배열입니다 
      var positions = [
          {
              title: '형근둘레길', 
              latlng: new kakao.maps.LatLng(37.722139168233, 127.58357537359)
          },
          {
              title: '고고래프팅', 
              latlng: new kakao.maps.LatLng(37.6901974831763, 127.711942412987)
          },
          {
              title: '봉식길', 
              latlng: new kakao.maps.LatLng(37.6925664020358, 127.639054839372)
          },
          {
              title: '보리울권역체험관', 
              latlng: new kakao.maps.LatLng(37.7020722922921, 127.601049365186)
          },
      ];
      
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

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
</body>
</html>