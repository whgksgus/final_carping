<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛집 추천</title>
<!-- 상단 아이콘 -->
<link rel="shortcut icon" type="image/x-icon" href="resources/images/carpingLogo.jpg">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
<style>
.display-none {
	display: none;
}
.star-rating { 
	margin-left: 10px;
	margin-top: -15px;
	width:205px; 
	} 
.star-rating,.star-rating span { display:inline-block; height:37px; overflow:hidden; background:url(../../../resources/images/star.png)no-repeat; } 
.star-rating span{ background-position:left bottom; line-height:0; vertical-align:top;}
#star{
   width : 120px;
   /* display: table-cell; */
   float: left;
}

#stars{
	float: left;
}
</style>
</head>
<body>
   <jsp:include page="../common/nav.jsp"></jsp:include>
   <br><br>
   
   <script type="text/javascript">
		$(function() {

			// 질문유형을 선택한다.
			chnQnaType('1', '11');
		});

		function chnQnaType(type, select) {

			$('#schQnaType').empty();

			if (type == '강원') { // 상품관련
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
			} else if (type == '경기') { // 일반관련
				$('#schQnaType').append("<option value='고양시' >고양시</option>'");
				$('#schQnaType').append("<option value='일산' >일산</option>'");
				$('#schQnaType').append("<option value='인천' >인천</option>'");
				$('#schQnaType').append("<option value='수원' >수원</option>'");
				$('#schQnaType').append("<option value='용인' >용인</option>'");
				$('#schQnaType').append("<option value='과천' >과천</option>'");
				$('#schQnaType').append("<option value='의정부' >의정부</option>'");
			} else if (type == '서울') { // 주문관련
				$('#schQnaType').append("<option value='종로구' >종로구</option>'");
				$('#schQnaType').append("<option value='동대문구' >동대문구</option>'");
				$('#schQnaType').append("<option value='성북구' >성북구</option>'");
				$('#schQnaType').append("<option value='은평구' >은평구</option>'");
				$('#schQnaType').append("<option value='용산구' >용산구</option>'");
				$('#schQnaType').append("<option value='용산구' >용산구</option>'");
				$('#schQnaType').append("<option value='용산구' >용산구</option>'");
				$('#schQnaType').append("<option value='용산구' >용산구</option>'");
				$('#schQnaType').append("<option value='용산구' >용산구</option>'");
				$('#schQnaType').append("<option value='송파구' >송파구</option>'");
				$('#schQnaType').append("<option value='강남구' >강남구</option>'");
			}
			document.getElementById("schQnaType").style.display = "";

			if ($.trim(select) != "") {
				$('#select1').val(type);
				$('#schQnaType').val(select);
			}
		}
	</script>
	
   <div style="margin-left: 15.5%; width:1400px; margin-top:100px;">
		<form style="margin-left: 100px;" id="form" method="post">
			<h2 style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="h2">맛집 추천</h2>
			<div style="width: 300px; border-bottom: 2px solid lightgray;"></div>
			<br> <select style="width: 120px; font-family: 'Sunflower', sans-serif;" class="form-control col-sm-2" name="sido" id="select1"
				onChange="chnQnaType(this.value)">
				<option value="강원">강원</option>
				<option value="경기">경기</option>
				<option value="서울">서울</option>
			</select> <select class="form-control col-sm-2" id="schQnaType" name="sigun"
				style="width: 120px; font-family: 'Sunflower', sans-serif; display: none;">
			</select> <input name="address" style="width:200px; font-family: 'Sunflower', sans-serif;" class="form-control col-sm-1" type="text" placeholder="시 입력" />&nbsp;&nbsp;&nbsp;&nbsp;
			<input class="btn btn-default col-sm-1" style="font-family: 'Sunflower', sans-serif;" type="button" value="검색" id="search" onclick="searchMap()">
		</form>
		<br>
		<!-- 지도 표시되는 부분 -->
		<div id="map" style="width: 1000px; height: 500px; margin-left: 100px;"></div>
	</div>
   <br>
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fdad10ac286b199d49c10545308769af&libraries=services"></script>
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
           level: 6 // 지도의 확대 레벨
       };
   
   var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
  
   var arr2 = new Array();
   var x = new Array();
    for(var i=0; i<fList.length;i++){
     x = {
           title : fList[i].foodZoneName,
           latlng : new kakao.maps.LatLng(fList[i].foodZoneGeoCodeX, fList[i].foodZoneGeoCodeY),
     	   address : fList[i].foodZoneAddress
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
       
    	// 마커에 표시할 인포윈도우를 생성합니다 
      	var iwContent = '<div style="padding:5px; width:200px; height:100px;">'+positions[i].title + '<br><br>' + positions[i].address+'</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
			content : iwContent,
			removable : iwRemoveable
		});
			
			
       // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
       // 이벤트 리스너로는 클로저를 만들어 등록합니다 
       // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
       /* kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker, infowindow, positions[i]));
       kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow)); */
		kakao.maps.event.addListener(marker, 'click', makeOverListener(map,
				marker, infowindow, positions[i]));
   }
   
   $('#search').on('click',function(){
	   $.ajax({
			url : "fsearchsido.do",
			type : "POST",
			async : false, // 기본값 true -> 비동기식 / false -> 동기식으로 바뀜
			data : $("#form").serialize(),
			success : function(data) {
				mapData = data;
			}
		});
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(mapData, function(result, status) {

			// 정상적으로 검색이 완료됐으면 
			if (status === kakao.maps.services.Status.OK) {
				var coords = new kakao.maps.LatLng(result[0].y,
						result[0].x);

				// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				map.setCenter(coords);
			}
		});
   })
   
   
   function makeOverListener(map, marker, infowindow, positions) {
	    return function() {
	    	$.ajaxSetup({ async:false });
	    	$.ajax({
	    		url : "foodZoneSelect.do",
	    		data : {"foodZoneName" : positions.title},
	    		type : "GET",
	    		success : function(result){
	    			$('#fzInfo').html('');
					$('#image').html('');
					$('#fzName').html('');
					$('#fzAddress').html('');
					$('#scoreAvg').html('');
					$('#fzEtc').html('');
					$('#lineDiv1').html('');
					$('#lineDiv2').html('');
					$('#lineDiv3').html('');
					$('#reviewBox').html('');
					$('#fzInfo').append("<br><br><div id='lineDiv1' style='margin-left:5%;width: 90%;''></div><br><br><div id='image'></div><br><div id='fzName'></div><br><div id='fzAddress' align='center'style='background-color: rgba(99, 82, 63, 0.2); display: inline-block; width: 1200px; height: 150px;font-family: 'Sunflower', sans-serif; font-weight:bold;display: inline-block; width: 100%; height: 150px;'align='center'></div><br><div id='lineDiv2' style='margin-left: 100px; width: 1200px;'></div><br><div id='div_1' style='width: 1200px; height: 500px; margin-left: 100px;'><!-- 맛집&명소 --><div id='fzEtc' style='width: 600px; float: left; display: block;'></div><div id='div_2' style='width: 600px; float: left; display: block;'><div id='scoreAvg'></div><div id='lineDiv3' style='width: 98%; display: inline-block;'></div><div id='reviewBox' style='width: 100%; height: 400px; align: center;'></div></div></div>");
					$('#image').append("<img align='center' style='width: 1100px; height:600px;' src='../../../resources/foodzoneImage/"+result.foodZoneImage+"'>");
					$('#fzName').append("<h1 style='font-family: 'Sunflower', sans-serif; font-weight:bold;' class='h1' align='center'>"+result.foodZoneName+"</h1>");
					$('#fzAddress').append("<h3 class='h3'>"+result.foodZoneAddress+"</h3><br><h4 class='h4'>"+result.foodZonePhone+"</h4><br><br>");
					$('#fzEtc').append("<h3 class='h3' style='width:200px; margin-left:100px;'>기타사항</h3><div style='width: 98%; display: inline-block; border-bottom: 2px solid lightgray;'></div><br><br><div id='pImage' align='left' style=' width:100%; height:150px;'>"+result.foodZoneEtc+"</div><div id='takeout' align='left' style=' width:100%; height:150px;'></div>");
					$('#scoreAvg').append("<h3 class='h3' style='width: 250px; float: left;'>리뷰</h3><h3 id='avg' class='h3' style='width:350px; float:left;' align='left'></h3>");
					$('#lineDiv1').append("<div style='border-bottom: 2px solid lightgray;'></div>");
					$('#lineDiv2').append("<div style='border-bottom: 2px solid lightgray;'></div>");
					$('#lineDiv3').append("<div style='border-bottom: 2px solid lightgray;'></div>");	    			
	    		}
	    	});
	    	
	    	$.ajax({
	    		url : "foodZoneScoreAvgUpdate.do",
	    		data : {"foodZoneName" : positions.title},
	    		type : "GET",
	    		success : function(result){
	    			if(result == 0){
	    				$("#avg").html('');
	    				$("#avg").append("<div id='star'><span>평점 : "+result+"</span></div><div id='stars'><span class='star-rating'><span style ='width:0%;'></span></span></div>");
	    			}else{
	    				$("#avg").html('');
	    				if(result > 0 && result < 0.5){
	    					$("#avg").append("<div id='star'><span>평점 : "+result+"</span></div><div id='stars>'<span class='star-rating'><span style ='width:0%;'></span></span></div>");	
	    				} else if (result >= 0.5 && result < 1.0){
	    					$("#avg").append("<div id='star'><span>평점 : "+result+"</span></div><div id='stars>'<span class='star-rating'><span style ='width:10%;'></span></span></div>");
	    				} else if (result >= 1.0 && result < 1.5){
	    					$("#avg").append("<div id='star'><span>평점 : "+result+"</span></div><div id='stars>'<span class='star-rating'><span style ='width:20%;'></span></span></div>");
	    				} else if (result >= 1.5 && result < 2.0){
	    					$("#avg").append("<div id='star'><span>평점 : "+result+"</span></div><div id='stars>'<span class='star-rating'><span style ='width:30%;'></span></span></div>");
	    				} else if (result >= 2.0 && result < 2.5){
	    					$("#avg").append("<div id='star'><span>평점 : "+result+"</span></div><div id='stars>'<span class='star-rating'><span style ='width:40%;'></span></span></div>");
	    				} else if (result >= 2.5 && result < 3.0){
	    					$("#avg").append("<div id='star'><span>평점 : "+result+"</span></div><div id='stars>'<span class='star-rating'><span style ='width:50%;'></span></span></div>");
	    				} else if (result >= 3.0 && result < 3.5){
	    					$("#avg").append("<div id='star'><span>평점 : "+result+"</span></div><div id='stars>'<span class='star-rating'><span style ='width:60%;'></span></span></div>");
	    				} else if (result >= 3.5 && result < 4.0){
	    					$("#avg").append("<div id='star'><span>평점 : "+result+"</span></div><div id='stars>'<span class='star-rating'><span style ='width:70%;'></span></span></div>");
	    				} else if (result >= 4.0 && result < 4.5){
	    					$("#avg").append("<div id='star'><span>평점 : "+result+"</span></div><div id='stars>'<span class='star-rating'><span style ='width:80%;'></span></span></div>");
	    				} else if (result >= 4.5 && result < 5.0){
	    					$("#avg").append("<div id='star'><span>평점 : "+result+"</span></div><div id='stars>'<span class='star-rating'><span style ='width:90%;'></span></span></div>");
	    				} else if(result==5.0){
	    					$("#avg").append("<div id='star'><span>평점 : "+result+"</span></div><div id='stars>'<span class='star-rating'><span style ='width:100%;'></span></span></div>");
	    				}
	    			}
	    		}
	    	})
	    	
	    	$.ajax({
	    		url : "foodZoneReviewList.do",
	    		data : {"foodZoneName" : positions.title},
	    		type : "GET",
	    		success : function(response){
	    			if(response.frList.length != 0){
		            	$('#reviewBox').html('');
		            	for(var i=0; i<response.frList.length; i++){
	                		$('#reviewBox').append("<div style='margin-left: 5%; margin-top:25px; width:95%; height:100px;' align='left'><img src='../../resources/images/co.png'>&nbsp;&nbsp;&nbsp;&nbsp;<span>["+response.frList[i].memberId+"] : </span><a href='foodZoneReviewDetail.do?foodZoneKey="+response.frList[i].foodZoneKey+"&frKey="+response.frList[i].frKey+"'>"+response.frList[i].frTitle+"</>&nbsp;&nbsp;<span> ("+response.frList[i].frRegDate+")</span><div>");
	                	 };
	            	}else{
	            		 $('#reviewBox').html('');
	            		 $('#reviewBox').append("<br><span>작성된 리뷰가 없습니다.</span>");
	            	};
	    		}
	    	});
	    	
	    	
	    	$.ajax({
	    		url : "foodZoneSelect.do",
	    		data : {"foodZoneName" : positions.title},
	    		type : "GET",
	    		success : function(result){
	    			console.log($(this));
	    			if(result.takeOutStatus == 'Y'){
	    				var foodZoneName = result.foodZoneName;
	    				$("#takeout").html('');
	    				$("#takeout").append("<p>테이크아웃이 가능한 매장입니다.</p>");
	    				$("#takeout").append("<br><button class='btn btn-info' style='width:120px;font-family: 'Sunflower', sans-serif; font-weight:bold;' onclick=location.href='takeOut.do?foodZoneName="+foodZoneName+"'>포장예약하기</button>");
	    			}else{
	    				$("#takeout").html('');
	    				$("#takeout").append("<p>테이크 아웃이 불가능한 매장입니다.</p>");
	    			}
	    		}
	    	});
	    	
	    	var offset = $("#fzInfo").offset();
          	$('html, body').animate({scrollTop : offset.top}, 500);
	        infowindow.open(map, marker);
	    };
	}
   
   $('#search').on('click',function() {
		$.ajax({
			url : "fsearchsido.do",
			type : "POST",
			async : false, // 기본값 true -> 비동기식 / false -> 동기식으로 바뀜
			data : $("#form").serialize(),
			success : function(data) {
				mapData = data;
			}
		});
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(mapData, function(result, status) {

			// 정상적으로 검색이 완료됐으면 
			if (status === kakao.maps.services.Status.OK) {
				var coords = new kakao.maps.LatLng(result[0].y,
						result[0].x);

				// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				map.setCenter(coords);
			}
		});

	})
   
	// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
	function makeOutListener(infowindow) {
	    return function() {
	        infowindow.close();
	    };
	}
	function takeOut(){
		/* location.href="takeOut.do?foodZoneName="+foodZoneName; */
	}
	
   </script>

	<div id="fzInfo" style="margin-left: 10%; width:1400px; text-align: center;" >
	</div>
	<!--footer-->
	<jsp:include page="../../../WEB-INF/views/common/footer.jsp"/>   

</body>
</html>