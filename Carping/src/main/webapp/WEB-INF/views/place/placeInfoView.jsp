<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>명소 추천</title>
<style>
	/* .display-none {
		display:none;
	} */
</style>
</head>
<body>
	<jsp:include page="../common/nav.jsp"></jsp:include>
   <br>
   <br>
   
   <script type="text/javascript">
      $(function(){
          
          // 질문유형을 선택한다.
          chnQnaType('1' , '11');
      });
      
      function chnQnaType(type , select) {
          
          $('#schQnaType').empty();
          
          if(type == '강원') { // 상품관련
              $('#schQnaType').append("<option value='강릉시' >강릉시</option>'");
              $('#schQnaType').append("<option value='고성군' >고성군</option>'");
              $('#schQnaType').append("<option value='동해시' >동해시</option>'");
              $('#schQnaType').append("<option value='삼척시' >삼척시</option>'");
              $('#schQnaType').append("<option value='속초시' >속초시</option>'");
              $('#schQnaType').append("<option value='양구군' >양구군</option>'");
              $('#schQnaType').append("<option value='양양군' >양양군</option>'");
              $('#schQnaType').append("<option value='연천군' >연천군</option>'");
              $('#schQnaType').append("<option value='영월군' >영월군</option>'");
              $('#schQnaType').append("<option value='원주시' >원주시</option>'");
              $('#schQnaType').append("<option value='인제군' >인제군</option>'");
              $('#schQnaType').append("<option value='정선군' >정선군</option>'");
              $('#schQnaType').append("<option value='춘천시' >춘천시</option>'");
              $('#schQnaType').append("<option value='철원군' >철원군</option>'");
              $('#schQnaType').append("<option value='태백시' >태백시</option>'");
              $('#schQnaType').append("<option value='평창군' >평창군</option>'");
              $('#schQnaType').append("<option value='화천군' >화천군</option>'");
              $('#schQnaType').append("<option value='홍천군' >홍천군</option>'");
          } else if (type == '경기') {  // 일반관련
              $('#schQnaType').append("<option value='21' >이용문의</option>'");
              $('#schQnaType').append("<option value='22' >회원가입/로그인</option>'");
              $('#schQnaType').append("<option value='23' >기타문의</option>'");
          } else if ( type == '서울') {  // 주문관련
              $('#schQnaType').append("<option value='31' >결제문의</option>'");
              $('#schQnaType').append("<option value='32' >배송문의</option>'");
              $('#schQnaType').append("<option value='33' >주문취소문의</option>'");
              $('#schQnaType').append("<option value='34' >반품문의</option>'");
              $('#schQnaType').append("<option value='35' >기타문의</option>'");
          }
          document.getElementById("schQnaType").style.display = "";
          
          if ($.trim(select) != "") {
              $('#select1').val(type);
              $('#schQnaType').val(select);
          }
      }
</script>
   
   <div style="margin-left: 100px;">
      <form id="form">
         <h2 class="h2">명소 추천</h2>
         <div style="width: 300px; border-bottom: 2px solid lightgray;"></div>
         <br> 
         <select name="sido" id="select1" onChange="chnQnaType(this.value)" >
             <option value="강원">강원</option>
             <option value="경기">경기</option>
             <option value="서울">서울</option>
         </select>    
         <select id="schQnaType" name="sigun"   style="width:120px; display:none;" >
         </select>
         <input name="address" type="text"   placeholder="시 입력" />&nbsp;&nbsp;&nbsp;&nbsp; 
         <input type="button" value="검색" id="search"/>
      </form>
   </div>
   <br>
	<!-- 지도 표시되는 부분 -->
	<div id="map" style="width:1300px;height:400px; margin-left:100px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fdad10ac286b199d49c10545308769af&libraries=services"></script>
	<script>
	var mapData;
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(37.7224013131875, 127.590475961846), // 지도의 중심좌표
        level: 7 // 지도의 확대 레벨
    };
    
    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	var pList = new Array();
	<c:forEach items="${pList}" var="list">
		var key = ${list.placeKey};
		var name = "${list.placeName}";
		var addr = "${list.placeAddress}";
		var geocode = "${list.placeGeoCode}";
		var geocodeArr = geocode.split(', ',2);
		var gs25 = "${list.placeGS25}";
		var toilet = "${list.placeToilet}";
		var parking = "${list.placeParking}";
		var image = "${list.placeImage}";
		var etc = "${list.placeEtc}";
		var avg = ${list.scoreAvg};
		// jstl 객체를 for each문으로 자바스크립트 변수에 저장
		
		var arr = {
				placeKey : key,
				placeName : name,
				placeAddress : addr,
				placeGeoCodeX : geocodeArr[0],
				placeGeoCodeY : geocodeArr[1],
				placeGS25 : gs25,
				placeToilet : toilet,
				placeParking : parking,
				placeImage : image,
				placeEtc : etc,
				scoreAvg : avg
		};
		// 자바스크립트 객체에 변수 삽입 후 객체 배열 생성
			pList.push(arr);
		// pList라는 배열안에 arr객체배열을 넣음
		</c:forEach>
		
		var arr2 = new Array();
		var x = new Array();
		for(var i=0; i<pList.length; i++) {
			x = {
					title : pList[i].placeName,
					latlng : new kakao.maps.LatLng(pList[i].placeGeoCodeX, pList[i].placeGeoCodeY)
			}
			// for문으로 pList에 있는 객체배열 순서대로 title, latlng를 빼와서 x라는 배열에 저장
			arr2.push(x);
			// arr2라는 배열에 x 배열 저장
		}
		
		// 마커를 표시할 위치와 arr2 객체 배열입니다.
		var positions = arr2;
		
		// 마커 이미지의 이미지 주소입니다
		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
		var iwContent = new Array();
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
		        image : markerImage, // 마커 이미지
		        clickable: true //  마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다.
		    });
		
		  // 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
	          iwContent = '<div style="padding:5px;">'+positions[i].title+'</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	              iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

	          // 인포윈도우를 생성합니다
	          var infowindow = new kakao.maps.InfoWindow({
	              content : iwContent,
	              removable : iwRemoveable
	          });
     		 
	      } 
		
		
		$('#search').on('click', function() {
	        $.ajax({
	           url : "psearchsido.do",
	           type : "POST",
	           async : false,  // 기본값 true -> 비동기식 / false -> 동기식으로 바뀜
	           data : $("#form").serialize(),
	           success: function(data){
	              mapData = data;
	           }
	        });
	       
		     // 주소-좌표 변환 객체를 생성합니다
  	          var geocoder = new kakao.maps.services.Geocoder();
            // 주소로 좌표를 검색합니다
            geocoder.addressSearch(mapData, function(result, status) {

                // 정상적으로 검색이 완료됐으면 
                 if (status === kakao.maps.services.Status.OK) {
                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                    map.setCenter(coords);
                } 
            });
           
        })
        
        kakao.maps.event.addListener(marker, 'click', function() {
        	console.log(postitions.title);
        	infowindow.open(map, marker);
        	$.ajax({
        		url : "selectPlaceInfo.do",
        		type : "POST",
        		data : {"placeName" : ' 사근진해변'},
        		success : function(data) {
        			alert(data.placeName);
        		}
        		,deforeSend:function() {
        			$('.placeInfo').addClass('display-none');
        		}
        		,complete:function() {
        			$('.placeInfo').removeClass('display-none');
        		}
        	});
        });

	</script>
	
	<div class="placeInfo display-none">
	<br>
	<br>
	<div style="margin-left: 5%; width:1000px; height:600px; align:center;" src="/resources/images/${place.placeImage }"></div>
	<br>
	<h1 class="h1" align="center">${place.placeName }</h1>
	<br>
	<div align="center" style="display:inline-block; width:70%; height:150px; margin-left:15%;">
		<h3 class="h3">${place.placeAddress }</h3>
	</div>
	
	<br>
	<div style="margin-left : 15%; width: 70%; border-bottom: 2px solid lightgray;"></div>
	<br>
	
	
	
	
	
	
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>