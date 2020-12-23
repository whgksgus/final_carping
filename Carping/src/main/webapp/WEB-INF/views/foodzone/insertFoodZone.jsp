<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>맛집 & 메뉴 추가</title>
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
      <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fdad10ac286b199d49c10545308769af&libraries=services"></script>
      <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
               }
            }).open();
         }
         
      </script>
        
   </head>
 
   <body>
   <div class="banner2" id="home" style="color: #FFFFFF;">
   <jsp:include page="../../../WEB-INF/views/common/nav.jsp"/>
      <div class="insertBox" align="center">
         <div style="background-color: rgba(12, 12, 12, 0.36); width:1400px; height:1200px;" align="center">
         	<h1 class="h1">차박 장소 추가</h1>
         	<br>
            <form action="insertFoodZone.do" method="post" enctype="multipart/form-data" name="fzForm">
               <h3 class="h3" align="center">장소이름</h3>
               <input class="form-control" style="width:400px;" type="text" name="foodZoneName" id="foodZoneName">
               <!-- <input class="form-control" type="text" id="zonecode"> -->
               <div style="width: 600px;">
               <h3 class="h3">주소찾기</h3>
               <input class="form-control" style="width:400px;" type="text" id="jibunAddress" name="foodZoneAddress" readonly="readonly">
               <input class="loginBtn" type="button" onclick="daumPostcode()" value="찾기">
               <div id="map" style="width:100%;height:250px;"></div>
               </div>
               <input class="form-control" type="hidden" id="aGeoCode" name="foodZoneGeoCode">
               <br>
               <h3 class="h3">가게 사진</h3>
               <input class="btn btn-default" type="file" name="uploadFile">
               <br>
               <br>
               <h3 class="h3">전화번호</h3>
               <input type="text" class="form-control" name="foodZonePhone" style="width:200px;">
               <br><br>
               <h3 class="h3">기타사항</h3>
               <textarea name="foodZoneEtc" id="etc" cols="50"  rows="5" style="resize: none; color:black;"></textarea>
               <br>
               
               <h3 class="h3">테이크 아웃 여부</h3>
               <input type="radio" name="takeOutStatus" value="Y">Y 
               <input type="radio" name="takeOutStatus" value="N">N
               <br>
               <br>
               <button class="loginBtn" type="submit" onclick="return sbchk();">등록</button>
            </form>
         </div>
      </div>
      </div>
      
      <script>
      	function sbchk(){
      		/* var fzForm = document.fzForm;
      		if(!fzForm.foodZoneName.value){
      			alert('가게 이름을 적어주세요.');
      			return false;
      		}
      		return true; */
      		if($("#foodZoneName").val()==''){
      			alert('가게 이름을 입력해주세요.');
      			return false;
      		}
      		if($("#jibunAddress").val()==''){
      			alert('주소를 찾아주세요.');
      			return false;
      		}
      		if($("input[name=uploadFile]").val()==''){
      			alert('가게 사진을 업로드 해주세요.');
      			return false;
      		}
      		if($("input[name=foodZonePhone]").val()==''){
      			alert('가게 번호를 적어주세요.');
      			return false;
      		}
      		if($("#etc").val()==''){
      			alert('대표 메뉴를 기타사항에 적어주세요.');
      			console.log($("input[name=foodZoneEtc]").val());
      			return false;
      		}
      		if($("input[name='takeOutStatus']:checked").val()==undefined){
      			alert('테이크 아웃 여부를 체크해주세요.');
      			return false;
      		}
      		return true;
      	}
      </script>
   </body>
</html>