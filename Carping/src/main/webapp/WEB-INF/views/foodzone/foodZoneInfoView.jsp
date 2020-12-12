<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛집 추천</title>
<style>
.star-rating { width:205px; } 
.star-rating,.star-rating span { display:inline-block; height:39px; overflow:hidden; background:url(../../../resources/images/star.png)no-repeat; } 
.star-rating span{ background-position:left bottom; line-height:0; vertical-align:top;}
#star{
	width : 100%;
	display: table-cell;
	vertical-align: middle;
}
#star div{
	float: left;
}

</style>
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
   <br>
   <div id="Info" style="text-align: center;">
   
   </div>
   <span id="reviewAvg" style="font-size: 1.8em;"></span>
   <div id="review">
   </div>
   <div id="paging"></div>
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
       
    	// 마커에 표시할 인포윈도우를 생성합니다 
       var infowindow = new kakao.maps.InfoWindow({
           content: positions[i].title // 인포윈도우에 표시할 내용
       });

       // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
       // 이벤트 리스너로는 클로저를 만들어 등록합니다 
       // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
       kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker, infowindow, positions[i]));
       kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
   }
   function makeOverListener(map, marker, infowindow, positions) {
	    return function() {
	    	$.ajax({
	    		url : "foodZoneSelect.do",
	    		data : {"foodZoneName" : positions.title},
	    		type : "GET",
	    		success : function(result){
	    			$('#Info').html('');
	    			$('#Info').append("<p>"+result.foodZoneKey+"</p><br>");
	    			$('#Info').append("<p>"+result.foodZoneName+"</p><br>");
	    			$('#Info').append("<p>"+result.foodZoneAddress+"</p><br>");
	    			$('#Info').append("<p>"+result.foodZonePhone+"</p><br>");
	    			$('#Info').append("<img src='../../../resources/images/"+result.foodZoneImage+"'><br>");
	    			$('#Info').append("<p>"+result.foodZoneEtc+"</p><br>");

	    		}
	    		
	    	});
	    	
	    	$.ajax({
	    		url : "scoreAvgUpdate.do",
	    		data : {"foodZoneName" : positions.title},
	    		type : "GET",
	    		success : function(result){
	    			if(result == 0){
	    				$("#reviewAvg").html('');
	    				$("#reviewAvg").append("<p>아직 리뷰 평점이 존재하지 않습니다..</p>");
	    			}else{
	    				$("#reviewAvg").html('');
	    				if(result > 0 && result < 0.5){
	    					$("#reviewAvg").append("<div id='star'><div id='starcom'><span>"+positions.title+"의 평균 별점 : "+result+"</span></div><div id='stars>'<span class='star-rating'><span style ='width:0%;'></span></span></div></div>");	
	    				} else if (result >= 0.5 && result < 1.0){
	    					$("#reviewAvg").append("<div id='star'><div id='starcom'><span>"+positions.title+"의 평균 별점 : "+result+"</span></div><div id='stars>'<span class='star-rating'><span style ='width:10%;'></span></span></div></div>");
	    				} else if (result >= 1.0 && result < 1.5){
	    					$("#reviewAvg").append("<div id='star'><div id='starcom'><span>"+positions.title+"의 평균 별점 : "+result+"</span></div><div id='stars>'<span class='star-rating'><span style ='width:20%;'></span></span></div></div>");
	    				} else if (result >= 1.5 && result < 2.0){
	    					$("#reviewAvg").append("<div id='star'><div id='starcom'><span>"+positions.title+"의 평균 별점 : "+result+"</span></div><div id='stars>'<span class='star-rating'><span style ='width:30%;'></span></span></div></div>");
	    				} else if (result >= 2.0 && result < 2.5){
	    					$("#reviewAvg").append("<div id='star'><div id='starcom'><span>"+positions.title+"의 평균 별점 : "+result+"</span></div><div id='stars>'<span class='star-rating'><span style ='width:40%;'></span></span></div></div>");
	    				} else if (result >= 2.5 && result < 3.0){
	    					$("#reviewAvg").append("<div id='star'><div id='starcom'><span>"+positions.title+"의 평균 별점 : "+result+"</span></div><div id='stars>'<span class='star-rating'><span style ='width:50%;'></span></span></div></div>");
	    				} else if (result >= 3.0 && result < 3.5){
	    					$("#reviewAvg").append("<div id='star'><div id='starcom'><span>"+positions.title+"의 평균 별점 : "+result+"</span></div><div id='stars>'<span class='star-rating'><span style ='width:60%;'></span></span></div></div>");
	    				} else if (result >= 3.5 && result < 4.0){
	    					$("#reviewAvg").append("<div id='star'><div id='starcom'><span>"+positions.title+"의 평균 별점 : "+result+"</span></div><div id='stars>'<span class='star-rating'><span style ='width:70%;'></span></span></div></div>");
	    				} else if (result >= 4.0 && result < 4.5){
	    					$("#reviewAvg").append("<div id='star'><div id='starcom'><span>"+positions.title+"의 평균 별점 : "+result+"</span></div><div id='stars>'<span class='star-rating'><span style ='width:80%;'></span></span></div></div>");
	    				} else if (result >= 4.5 && result < 5.0){
	    					$("#reviewAvg").append("<div id='star'><div id='starcom'><span>"+positions.title+"의 평균 별점 : "+result+"</span></div><div id='stars>'<span class='star-rating'><span style ='width:90%;'></span></span></div></div>");
	    				} else if(result==5.0){
	    					$("#reviewAvg").append("<div id='star'><div id='starcom'><span>"+positions.title+"의 평균 별점 : "+result+"</span></div><div id='stars>'<span class='star-rating'><span style ='width:100%;'></span></span></div></div>");
	    				}
	    			}
	    		}
	    	})
	    	
	    	console.log(positions.title)
	    	$.ajax({
	    		url : "foodZoneReviewList.do",
	    		data : {"foodZoneName" : positions.title},
	    		type : "GET",
	    		success : function(result){
	    			if(result.frList.length ==0){
	    				$('#review').html('');
	    				$('#review').append("<p>아직 작성된 리뷰가 없습니다..</p>")
	    			}else{
	    				$('#review').html('');	
	    				for(var i=0; i<result.frList.length; i++){
	    					
	    					$('#review').append("<p>"+result.frList[i].memberId+" : "+result.frList[i].frContent+"</p><br>");
		    			}
	    			}
	    		}
	    	});
	        infowindow.open(map, marker);
	    };
	}
	// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
	function makeOutListener(infowindow) {
	    return function() {
	        infowindow.close();
	    };
	}

	/* function getFoodzoneReviews() {
		$.ajax({
    		url : "foodZoneReviewList.do",
    		data : {"foodZoneName" : positions.title},
    		type : "GET",
    		success : function(result){
    			if(result.frList.length ==0){
    				$('#review').html('');
    				$('#review').append("<p>아직 작성된 리뷰가 없습니다..</p>")
    			}else{
    				$('#review').html('');	
    				for(var i=0; i<result.frList.length; i++){
    					
    					$('#review').append("<p>"+result.frList[i].memberId+" : "+result.frList[i].frContent+"</p><br>");
	    			}
    			}
    			if(result.pi.currentPage<=1){
    				$('#paging').html('');
    				$('#paging').append("<p>[이전]</p>")
    			}
    			
    			if(result.pi.currentPage>1){
    				$('#paging').html('');
    				$('#paging').append("<a href=foodZoneReviewList.do?page="+(result.pi.currentPage-1)+"&foodZoneName="+(positions.title)+">[이전]</a>")
    			} 
    			
    			for(var i=result.pi.startPage; i<=result.pi.endPage;i++){
    				console.log(result.pi.startPage);
    				console.log(result.pi.endPage);
    				if(i==result.pi.currentPage){
    					$('#paging').append("<font color=red size=4>"+i+"</font>")
    				}else{
    					$('#paging').append("<a href='foodZoneReviewList.do?page="+i+"&foodZoneName="+positions.title+"'>"+i+"</a>");
    				}
    			}
    			if(result.pi.currentPage>=result.pi.maxPage){
    				$('#paging').append("<p>다음</p>")
    			}
    			 */
	             <%--
	             <!-- 페이지  -->
	             <c:forEach var="p" begin=result.pi.startPage end=pi.endPage>
	                <c:url var="pagination" value="boardList.kh">
	                   <c:param name="page" value="${p }"></c:param>
	                </c:url>
	                <c:if test="${p eq pi.currentPage }">
	                	<font color="red" size="4">[${p }]</font>
	                </c:if>
	                <c:if test="${p ne pi.currentPage }">
	                	<a href="${pagination }">${p }</a>&nbsp;
	                </c:if>
	                
	             </c:forEach>
	             <!-- 다음 -->
	             <c:if test="${pi.currentPage >= pi.maxPage }">
	                [다음]&nbsp;
	             </c:if>
	             <c:if test="${pi.currentPage < pi.maxPage }">
	                <c:url var="after" value="boardList.kh">
	                   <c:param name="page" value="${pi.currentPage + 1 }"></c:param>
	                </c:url>
	                boardList.kh?page=${pi.currentPage + 1 }
	                <a href="${after }">[다음]</a>&nbsp;
	             </c:if>
	              --%>
	              /* if(result.pi.currentPage<=1){
  				$('#paging').html('');
  				$('#paging').append("<p>[이전]</p>")
  			}
  			
  			if(result.pi.currentPage>1){
  				$('#paging').html('');
  				$('#paging').append("<a href=foodZoneReviewList.do?page="+(result.pi.currentPage-1)+"&foodZoneName="+(positions.title)+">[이전]</a>")
  			} 
  			
  			for(var i=result.pi.startPage; i<=result.pi.endPage;i++){
  				console.log(result.pi.startPage);
  				console.log(result.pi.endPage);
  				if(i==result.pi.currentPage){
  					$('#paging').append("<font color=red size=4>"+i+"</font>")
  				}else{
  					$('#paging').append("<a href='foodZoneReviewList.do?page="+i+"&foodZoneName="+positions.title+"'>"+i+"</a>");
  					//$('#paging').append("<a onclick='getFoodzoneReviews("+i+","+positions.title+"'></a>");
  				}
  			}
  			if(result.pi.currentPage>=result.pi.maxPage){
  				$('#paging').append("<p>다음</p>")
  			} */
  			
	             <%--
	             <!-- 페이지  -->
	             <c:forEach var="p" begin=result.pi.startPage end=pi.endPage>
	                <c:url var="pagination" value="boardList.kh">
	                   <c:param name="page" value="${p }"></c:param>
	                </c:url>
	                <c:if test="${p eq pi.currentPage }">
	                	<font color="red" size="4">[${p }]</font>
	                </c:if>
	                <c:if test="${p ne pi.currentPage }">
	                	<a href="${pagination }">${p }</a>&nbsp;
	                </c:if>
	                
	             </c:forEach>
	             <!-- 다음 -->
	             <c:if test="${pi.currentPage >= pi.maxPage }">
	                [다음]&nbsp;
	             </c:if>
	             <c:if test="${pi.currentPage < pi.maxPage }">
	                <c:url var="after" value="boardList.kh">
	                   <c:param name="page" value="${pi.currentPage + 1 }"></c:param>
	                </c:url>
	                boardList.kh?page=${pi.currentPage + 1 }
	                <a href="${after }">[다음]</a>&nbsp;
	             </c:if>
	             
    			
    		}
    	});
	} --%>
   </script>

   
   <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

</body>
</html>