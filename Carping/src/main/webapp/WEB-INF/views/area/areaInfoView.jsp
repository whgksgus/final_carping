<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차박 장소 추천</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
	<br>
	<br>

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
				$('#schQnaType').append("<option value='21' >이용문의</option>'");
				$('#schQnaType').append(
						"<option value='22' >회원가입/로그인</option>'");
				$('#schQnaType').append("<option value='23' >기타문의</option>'");
			} else if (type == '서울') { // 주문관련
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

	<div style="margin-left: 15.5%; width:1400px;">
		<form style="margin-left: 100px;" id="form" method="post">
			<h2 class="h2">차박 장소 추천</h2>
			<div style="width: 300px; border-bottom: 2px solid lightgray;"></div>
			<br> <select name="sido" id="select1"
				onChange="chnQnaType(this.value)">
				<option value="강원">강원</option>
				<option value="경기">경기</option>
				<option value="서울">서울</option>
			</select> <select id="schQnaType" name="sigun"
				style="width: 120px; display: none;">
			</select> <input name="address" type="text" placeholder="시 입력" />&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" value="검색" id="search" onclick="searchMap()">
		</form>
		<br>
		<!-- 지도 표시되는 부분 -->
		<div id="map" style="width: 1000px; height: 500px; margin-left: 100px;"></div>
	</div>
	<br>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fdad10ac286b199d49c10545308769af&libraries=services"></script>
	<script>
		var mapData;
		
	    var aList = new Array();
		<c:forEach items="${aList}" var="list">
		var key = ${list.areaKey};
		var name = "${list.areaName}";
		var addr = "${list.areaAddress}";
		var geocode = "${list.areaGeoCode}";
		var geocodeArr = geocode.split(', ', 2);
		var gs25 = ${list.areaGS25};
		var toilet = ${list.areaToilet};
		var sink = ${list.areaSink};
		var pool = ${list.areaPool};
		var image = "${list.areaImage}";
		var etc = "${list.areaEtc}";
		var fzKey = ${list.foodZoneKey};
		var pKey = ${list.placeKey};
		var avg = ${list.scoreAvg};

		var arr = {
			areaKey : key,
			areaName : name,
			areaAddress : addr,
			areaGeoCodeX : geocodeArr[0],
			areaGeoCodeY : geocodeArr[1],
			areaGS25 : gs25,
			areaToilet : toilet,
			areaSink : sink,
			areaPool : pool,
			areaImage : image,
			areaEtc : etc,
			foodZoneKey : fzKey,
			placeKey : pKey,
			scoreAvg : avg
		};

		aList.push(arr);
		</c:forEach>

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	       mapOption = { 
	           center: new kakao.maps.LatLng(37.7224013131875, 127.590475961846), // 지도의 중심좌표
	           level: 11 // 지도의 확대 레벨
	       };
	   
	   var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		var arr2 = new Array();
		var x = new Array();
		for (var i = 0; i < aList.length; i++) {
			x = {
				title : aList[i].areaName,
				latlng : new kakao.maps.LatLng(aList[i].areaGeoCodeX,aList[i].areaGeoCodeY),
				address : aList[i].areaAddress,
				aKey : aList[i].areaKey,
				foodKey : aList[i].foodZoneKey,
				plKey : aList[i].placeKey
			}
			arr2.push(x);
		}
		// 마커를 표시할 위치와 arr2 객체 배열입니다 
		var positions = arr2;

		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
		for (var i = 0; i < positions.length; i++) {

			// 마커 이미지의 이미지 크기 입니다
			var imageSize = new kakao.maps.Size(24, 35);

			// 마커 이미지를 생성합니다    
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				map : map, // 마커를 표시할 지도
				position : positions[i].latlng, // 마커를 표시할 위치
				title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
				image : markerImage, // 마커 이미지 
			});

			// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
			var iwContent = '<div style="padding:5px; width:200px; height:100px;">'+positions[i].title + '<br><br>' + positions[i].address+'</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

			// 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
				content : iwContent,
				removable : iwRemoveable
			});

			kakao.maps.event.addListener(marker, 'click', makeOverListener(map,
					marker, infowindow, positions[i]));
		}

		
		$('#search').on('click',function() {
					$.ajax({
						url : "asearchsido.do",
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
					url : "selectAreaInfo.do",
					data : {"areaName" : positions.title},
					type : "GET",
					success : function(result) {
						$('#areaInfo').html('');
						$('#image').html('');
						$('#areaName').html('');
						$('#areaAddress').html('');
						$('#scoreAvg').html('');
						$('#areaEtc').html('');
						$('#lineDiv1').html('');
						$('#lineDiv2').html('');
						$('#lineDiv3').html('');
						$('#reviewBox').html('');
						$('#etcBox').html('');
						$('#fzpl').html('');
						$('#areaInfo').append("<br><br><div id='lineDiv1' style='margin-left:5%;width: 90%;''></div><br><br><div id='image'></div><br><div id='areaName'></div><br><div id='areaAddress' align='center'style='display: inline-block; width: 100%; height: 150px;'align='center'></div><br><div id='lineDiv2' style='margin-left: 100px; width: 1200px;'></div><br><div id='div_1' style='width: 1200px; height: 800px; margin-left: 100px;'><!-- 맛집&명소 --><div id='fzpl' style='width: 600px; float: left; display: block;'></div><div id='div_2' style='width: 600px; float: left; display: block;'><div id='scoreAvg'></div><div id='lineDiv3' style='width: 98%; display: inline-block;'></div><div id='reviewBox' style='width: 100%; height: 400px; align: center;'></div></div><div id='areaEtc' style='width: 100%; height: 200px; text-align: center;/*  background-color: rgba(12, 12, 12, 0.36); */ display: inline-block;'></div></div>");
						$('#image').append("<img align='center' style='width: 1100px; height:600px;' src='../../../resources/areaImage/"+result.areaImage+"'>");
						$('#areaName').append("<h1 class='h1' align='center'>"+result.areaName+"</h1>");
						$('#areaAddress').append("<h3 class='h3'>"+result.areaAddress+"</h3><br>");
							if(result.areaGS25 == 1){
								$('#areaAddress').append("<img src='../../../resources/images/gs25.png'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
							};
							if(result.areaToilet == 1){
								$('#areaAddress').append("<img src='../../../resources/images/toilet.png'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
							};
							if(result.areaSink == 1){
								$('#areaAddress').append("<img src='../../../resources/images/sink.png'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
							};
							if(result.areaPool == 1){
								$('#areaAddress').append("<img src='../../../resources/images/pool.png'>");
							};
						$('#areaAddress').append("<br><br>");
						$('#fzpl').append("<h3 class='h3' style='width:200px; margin-left:100px;'>맛집&명소</h3><div style='width: 98%; display: inline-block; border-bottom: 2px solid lightgray;'></div><br><div id='fzImage' align='left' style=' width:100%; height:200px;'></div><br><div id='pImage' align='left' style=' width:100%; height:200px;'></div>");
						$('#scoreAvg').append("<h3 class='h3' style='width: 250px; float: left;'>리뷰</h3><h3 id='avg' class='h3' style='width:350px; float:left;' align='left'></h3>");
						$('#areaEtc').append("<div id='areaEtc' style='width: 100%; height: 100%; text-align: center; background-color: rgba(12, 12, 12, 0.36); display: inline-block;'><br><h3 class='h3'>기타 사항</h3><br><span>"+result.areaEtc+"</span></div>");
						$('#lineDiv1').append("<div style='border-bottom: 2px solid lightgray;'></div>");
						$('#lineDiv2').append("<div style='border-bottom: 2px solid lightgray;'></div>");
						$('#lineDiv3').append("<div style='border-bottom: 2px solid lightgray;'></div>");
					}
				});
				
				/* 맛집 사진 */
	            $.post("/selectFz.do", { "foodZoneKey" : positions.foodKey}, function(response) {
	            	$('#fzImage').html('');
	            	$('#fzImage').append("<img style='position:absolute; margin-left: 20px; margin-top:10px; width: 240px; height:180px; align:center;' src='../../../resources/foodzoneImage/"+response.foodZoneImage+"'><span style='position:absolute; margin-left:280px; margin-top:60px; width:300px;'><a>["+response.foodZoneName+"]<br><br>"+response.foodZoneAddress+"</a></span>")
	            });
				
				/* 명소 사진 */
	            $.post("/selectP.do", { "placeKey" : positions.plKey}, function(response) {
	            	$('#pImage').html('');
	            	$('#pImage').append("<img style='position:absolute; margin-left: 20px; margin-top:10px; width: 240px; height:180px; align:center;' src='../../../resources/placeImage/"+response.placeImage+"'><span style='position:absolute; margin-left:280px; margin-top:60px; width:300px;'><a>["+response.placeName+"]<br><br>"+response.placeAddress+"</a></span>")
	            });
				
				/* 리뷰 */
	            $.post("/selectAreview.do", { "areaKey" : positions.aKey}, function(response) {
	            	if(response.length != 0){
		            	$('#reviewBox').html('');
		            	for(var i=0; i<response.length; i++){
	                		$('#reviewBox').append("<div style='margin-left: 5%; margin-top:25px; width:95%; height:100px;' align='left'><img src='../../resources/images/co.png'>&nbsp;&nbsp;&nbsp;&nbsp;<span>["+response[i]['memberId']+"] : </span><span>"+response[i]['arTitle']+"</span>&nbsp;&nbsp;<span> ("+response[i]['arRegDate']+")</span><div>");
	                	 };
	            	}else{
	            		 $('#reviewBox').html('');
	            		 $('#reviewBox').append("<br><span>작성된 리뷰가 없습니다.</span>");
	            	};
				},"json");
				
				/* 별점 */
	             $.ajax({
		    		url : "areaScoreAvgUpdate.do",
		    		data : {"areaName" : positions.title},
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
		    	}); 
				
				var offset = $("#areaInfo").offset();
	          	$('html, body').animate({scrollTop : offset.top}, 500);
				
	          	infowindow.open(map, marker);

			};
		
		
		}
		
		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(infowindow) {
			return function() {
				infowindow.close();
			};
		}
	</script>

	<div id="areaInfo" style="margin-left: 10%; width:1400px; text-align: center;" >
		<%-- <br> <br>
		<div id="lineDiv1" style="margin-left: 5%; width: 90%;"></div>
		<br> <br>
		<div id="image"></div>
		<br>
		<div id="areaName"></div>
		<br>
		<div id="areaAddress" align="center"
			style="display: inline-block; width: 70%; height: 150px;"align="center">


		</div>
		<br>
		<div id="lineDiv2" style="margin-left: 15%; width: 70%;"></div>
		<br>
		<div id="div_1" style="width: 70%; height: 800px; margin-left: 15%;">
			<!-- 맛집&명소 -->
			<div id="fzpl" style="width: 50%; float: left; display: block;">
				
				
				<div style="width:100%; height:250px; align:center;"><img src="/resources/images/${fzList[0].foodZoneImage }"></div>
			<div style="width:100%; height:250px; align:center;"><img src="/resources/images/${pList[0].placeImage }"></div>
			</div>
			<!-- 리뷰 -->
			<div id="div_2" style="width: 50%; float: left; display: block;">
				<div id="scoreAvg">
					
				</div>
				<div id="lineDiv3" style="width: 100%; display: inline-block;"></div>
				<div id="div_3" style="width: 100%; height: 500px; align: center;">
					<!-- 리뷰 반복문 돌리기 -->
					
					<!-- <div id="reviewBox" style="width: 90%; margin-left: 5%; margin-top: 10px;">
						<img src="../../resources/images/co.png"><span>와 정말
							좋아요</span>
					</div> -->
				</div>
			</div>
			<div id="areaEtc" style="width: 100%; height: 200px; text-align: center;/*  background-color: rgba(12, 12, 12, 0.36); */ display: inline-block;">
				
			</div>
		</div> --%>
		
	</div>
	<br>
	<br>
</body>
</html>