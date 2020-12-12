<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>차박장소 추가</title>
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
                  // 주소-좌표 변환 객체를 생성합니다
                  var geocoder = new kakao.maps.services.Geocoder();
                  // 주소로 좌표를 검색합니다
                  geocoder.addressSearch(jibunAddr, function(result, status) {
                     // 정상적으로 검색이 완료됐으면 
                     if (status === kakao.maps.services.Status.OK) {
                        var geoCode = result[0].y+", "+result[0].x;
                        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                        /* map.setCenter(coords); */
                        document.getElementById('aGeoCode').value = geoCode;
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
            		for(var i=0; i<response.length; i++){
               			$('#fListTable').append("<tr><td>"+response[i]['foodZoneName']+"</td><td>"+response[i]['foodZoneAddress']+"</td><td><input type='radio' name='foodZoneKey' value='"+response[i]['foodZoneKey']+"'></td></tr>");
            		};
           		}else{
          			 $('#fListTable').append("<tr><td colspan='2' align='center'>근처의 맛집이 없습니다.</td><td><input type='hidden' name='foodZoneKey' value='0' checked></td></tr>");
          	 	};
            },"json");
         }
         function selectPList(jibunAddress) {
             $.post("/selectPList.do", { "areaAddress" : jibunAddress}, function(response) {
            	 if(response.length != 0){
            		 for(var i=0; i<response.length; i++){
                		$('#pListTable').append("<tr><td>"+response[i]['placeName']+"</td><td>"+response[i]['placeAddress']+"</td><td><input type='radio' name='placeKey' value='"+response[i]['placeKey']+"'></td></tr>");
                	 };
            	 }else{
            		 $('#pListTable').append("<tr><td colspan='2' align='center'>근처의 명소가 없습니다.</td><td><input type='hidden' name='placeKey' value='0' checked></td></tr>");
            	 };
             },"json");
          }
      </script>
   </head>
   <body>
      <div align="center">
         <h1 class="h1">차박 장소 추가</h1>
         <br>
         <div align="center">
            <form action="insertArea.do" method="post" enctype="multipart/form-data">
               <h3 class="h3">장소이름</h3>
               <input class="form-control" type="text" name="areaName">
               <h3 class="h3">주소찾기</h3>
               <!-- <input class="form-control" type="text" id="zonecode"> -->
               <input type="button" onclick="daumPostcode()" value="찾기">
               <h3 class="h3">지번주소</h3>
               <input class="form-control" type="text" id="jibunAddress" name="areaAddress">
               <input class="form-control" type="hidden" id="aGeoCode" name="areaGeoCode">
               <br>
               <div style="width: 1000px; display:inline-block">
               <br>
               <div style="width: 50%; float: left" align="center">
                  <h3 class="h3">근처 맛집 리스트</h3>
                  <table id="fListTable">
                     <tr>
                        <th style="width:150px;">이름</th>
                        <th style="width:250px;">주소</th>
                        <th style="width:50px;">선택</th>
                     </tr>
                  </table>
               </div>
                  <div style="width: 50%; float: left" align="center">
                     <h3 class="h3">근처 명소 리스트</h3>
                     <table id="pListTable">
                        <tr>
                           <th style="width:150px;">이름</th>
                           <th style="width:250px;">주소</th>
                           <th style="width:50px;">선택</th>
                        </tr>
                     </table>
                  </div>
               </div>
               <br>
               <br>
               <div align="center" style="display:inline-block">
                  <h3 class="h3">편의시설12</h3>
                  <input id="chkBox1" type="checkbox" name="areaGS25" value="1"> 화장실&nbsp;&nbsp;
                  <input id="chkBox2" type="checkbox" name="areaToilet" value="1"> 편의점&nbsp;&nbsp;
                  <input id="chkBox3" type="checkbox" name="areaSink" value="1"> 개수대&nbsp;&nbsp;
                  <input id="chkBox4" type="checkbox" name="areaPool" value="1"> 물놀이&nbsp;&nbsp;
               </div>
               <h3 class="h3">기타사항</h3>
               <textarea name="areaEtc" cols="50" rows="7" style="resize: none;"></textarea>
               <br>
               <h3 class="h3">사진 첨부</h3>
               <input type="file" name="uploadFile">
               <br>
               <br>
               <br>
               <input type="submit" value="등록">
            </form>
         </div>
      </div>
   </body>
</html>