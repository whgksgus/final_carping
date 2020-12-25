<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>차박장소 추가</title>
      <!-- 상단 아이콘 -->
<link rel="shortcut icon" type="image/x-icon" href="resources/images/carpingLogo.jpg">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fdad10ac286b199d49c10545308769af&libraries=services"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" type='text/css' href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap" rel="stylesheet">
      <script>
         function daumPostcode() {
            new daum.Postcode({
               oncomplete : function(data) {
                  var jibunAddr = data.jibunAddress;

                  /* document.getElementById('zonecode').value = data.zonecode; */
                  document.getElementById('jibunAddress').value = data.jibunAddress;
                  
                  var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                  mapOption = { 
                      center: new kakao.maps.LatLng(37.695918, 127.640103), // 지도의 중심좌표
                      level: 3 // 지도의 확대 레벨
                  };
	               // 지도를 생성합니다    
	                  var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	               // 주소-좌표 변환 객체를 생성합니다
	                  var geocoder = new kakao.maps.services.Geocoder();
	                  // 주소로 좌표를 검색합니다
	                  geocoder.addressSearch(jibunAddr, function(result, status) {
	                     // 정상적으로 검색이 완료됐으면 
	                     if (status === kakao.maps.services.Status.OK) {
	                        var geoCode = result[0].y+", "+result[0].x;
	                        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	                        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	                        // 결과값으로 받은 위치를 마커로 표시합니다
					        var marker = new kakao.maps.Marker({
					            map: map,
					            position: coords
					        });
	                        /* map.setCenter(coords); */
	                        document.getElementById('aGeoCode').value = geoCode;
	                          // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	                          map.setCenter(coords);
	                     }
	                  });
	

                  selectFzList(jibunAddr);
                  selectPList(jibunAddr);
               }
            }).open();
         }
         function selectFzList(jibunAddress) {
            $.post("/selectFzList.do", { "areaAddress" : jibunAddress}, function(response) {
           	 	if(response.length != 0){
           			$('#fListTable').html('');
           			$('#fListTable').append("<tr><th style='width:150px;'>이름</th><th style='width:250px;'>주소</th><th style='width:50px;'>선택</th></tr>");
            		for(var i=0; i<response.length; i++){
               			$('#fListTable').append("<tr><td>"+response[i]['foodZoneName']+"</td><td>"+response[i]['foodZoneAddress']+"</td><td><input type='radio' name='foodZoneKey' value='"+response[i]['foodZoneKey']+"'></td></tr>");
            		};
           		}else{
           			 $('#fListTable').html('');
          			 $('#fListTable').append("<tr><th style='width:150px;'>이름</th><th style='width:250px;'>주소</th><th style='width:50px;'>선택</th></tr><tr><td colspan='2' align='center'>근처의 맛집이 없습니다.</td><td><input type='radio' name='foodZoneKey' value='0' checked></td></tr>");
          	 	};
            },"json");
         }
         function selectPList(jibunAddress) {
             $.post("/selectPList.do", { "areaAddress" : jibunAddress}, function(response) {
            	 if(response.length != 0){
           			 $('#pListTable').html('');
           			 $('#pListTable').append("<tr><th style='width:150px;'>이름</th><th style='width:250px;'>주소</th><th style='width:50px;'>선택</th></tr>");
            		 for(var i=0; i<response.length; i++){
                		$('#pListTable').append("<tr><td>"+response[i]['placeName']+"</td><td>"+response[i]['placeAddress']+"</td><td><input type='radio' name='placeKey' value='"+response[i]['placeKey']+"'></td></tr>");
                	 };
            	 }else{
            		 $('#pListTable').html('');
            		 $('#pListTable').append("<tr><th style='width:150px;'>이름</th><th style='width:250px;'>주소</th><th style='width:50px;'>선택</th></tr><tr><td colspan='2' align='center'>근처의 명소가 없습니다.</td><td><input type='radio' name='placeKey' value='0' checked></td></tr>");
            	 };
             },"json");
          }
      </script>
<style>
.bannerLogin {
	background: url(../../../resources/images/fallStreet2.jpg) no-repeat 0px 0px;
	background-size: cover;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	-ms-background-size: cover;
	min-height: 950px;
	position: relative;
}
</style>
   </head>
   <body>
   <div class="bannerLogin" id="home" style="color: #FFFFFF;">
   <jsp:include page="../../../WEB-INF/views/common/nav.jsp"/>
      <div class="insertBox" align="center">
         <div style="background-color: rgba(12, 12, 12, 0.4); width:1400px; height:1250px; margin-top:50px;" align="center">
         	<h1 style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="h1">차박 장소 추가</h1>
         	<div style="width: 350px; border-bottom: 2px solid #FFFFFF;"></div>
            <form action="insertArea.do" method="post" enctype="multipart/form-data">
               <h3 style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="h3" align="center">장소이름</h3>
               <input class="form-control" style="width:400px;" type="text" name="areaName">
               <!-- <input class="form-control" type="text" id="zonecode"> -->
               <div style="width: 600px;">
               <h3 style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="h3">주소찾기</h3>
               <input class="form-control" style="margin-left:100px; width:400px;float:left;" type="text" id="jibunAddress" name="areaAddress">
               <input class="loginBtn" style="font-family: 'Sunflower', sans-serif; font-weight:bold; float:left; width:80px; height:35px;" type="button" onclick="daumPostcode()" value="찾기">
               <br>
               <br>
               <div id="map" style="width:100%;height:250px;"></div>
               </div>
               <input class="form-control" type="hidden" id="aGeoCode" name="areaGeoCode">
               <br>
               <div style="width: 1000px; display:inline-block">
               <div style="width: 50%; float: left" align="center">
                  <h3 style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="h3">근처 맛집 리스트</h3>
                  <br>
                  <table id="fListTable">
                     <tr>
                        <th style="font-family: 'Sunflower', sans-serif; font-weight:bold;width:150px;">이름</th>
                        <th style="font-family: 'Sunflower', sans-serif; font-weight:bold;width:250px;">주소</th>
                        <th style="font-family: 'Sunflower', sans-serif; font-weight:bold;width:50px;">선택</th>
                     </tr>
                  </table>
               </div>
                  <div style="width: 50%; float: left" align="center">
                     <h3 style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="h3">근처 명소 리스트</h3>
                     <br>
                     <table id="pListTable">
                        <tr>
                           <th style="font-family: 'Sunflower', sans-serif; font-weight:bold;width:150px;">이름</th>
                           <th style="font-family: 'Sunflower', sans-serif; font-weight:bold;width:250px;">주소</th>
                           <th style="font-family: 'Sunflower', sans-serif; font-weight:bold;width:50px;">선택</th>
                        </tr>
                     </table>
                  </div>
               </div>
               <br>
               <br>
               <div align="center" style="display:inline-block">
                  <h3 style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="h3">편의시설</h3>
                  <br>
                  <input style="font-family: 'Sunflower', sans-serif; font-weight:bold;" id="chkBox1" type="checkbox" name="areaGS25" value="1"> 편의점&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <input style="font-family: 'Sunflower', sans-serif; font-weight:bold;" id="chkBox2" type="checkbox" name="areaToilet" value="1"> 화장실&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <input style="font-family: 'Sunflower', sans-serif; font-weight:bold;" id="chkBox3" type="checkbox" name="areaSink" value="1"> 개수대&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <input style="font-family: 'Sunflower', sans-serif; font-weight:bold;" id="chkBox4" type="checkbox" name="areaPool" value="1"> 물놀이
               </div>
               <br>
               <br>
               <h3 style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="h3">기타사항</h3>
               <textarea class="form-control" style="width:400px;" name="areaEtc" cols="50" rows="5" style="resize: none; color:black;"></textarea>
               <br>
               <h3 style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="h3">사진 첨부</h3>
               <input class="loginBtn" type="file" name="uploadFile">
               <br>
               <br>
               <input class="loginBtn" style="font-family: 'Sunflower', sans-serif; font-weight:bold; width:80px; height:35px;" type="submit" value="등록">
            </form>
         </div>
      </div>
      </div>
      <!--footer-->
	<jsp:include page="../../../WEB-INF/views/common/footer.jsp"/>
   </body>
</html>