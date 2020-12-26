<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>맛집 메뉴 추가</title>
      <!-- 상단 아이콘 -->
<link rel="shortcut icon" type="image/x-icon" href="resources/images/carpingLogo.jpg">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   </head>
   <script>
      	function nameChk(){
      		var name = $("#foodZoneName").val();
      		if(name==''){
      			alert('맛집 이름을 적어주세요.');
      		}else{
      			$.ajax({
      				url : "searchFoodZone.do",
      				data : {"foodZoneName" : name},
      				type : "GET",
      				dataType : "json",
      				success : function(result){
      					if(result.length!=0){
      						$("#menuList tbody tr").remove();
      					 	$("#fzListTable").html('');
      						$("#fzListTable").append("<tr><th style='width:20%; text-align: center;'>이름</th><th style='width:600px; text-align: center;'>주소</th><th style='width:50px; text-align: center;'>선택</th></tr>");
      						for(var i=0; i<result.length; i++){
      							 $('#fzListTable').append("<tr><td>"+result[i]['foodZoneName']+"</td><td>"+result[i]['foodZoneAddress']+"</td><td><input type='radio' name='key' value='"+result[i]['foodZoneKey']+"'></td></tr>");
      						} 

      					}else{
      						$("#menuList tbody tr").remove();
      						$('#fzListTable').html('');
      	          			 $('#fzListTable').append("<tr><th style='width:150px; text-align: center;'>이름</th><th style='width:250px; text-align: center;'>주소</th><th style='width:50px; text-align: center;'>선택</th></tr><tr><td colspan='2' align='center'>테이크아웃 가능만 매장이 없어요.</td><td><input type='radio' name='foodZoneKey' value='0' checked></td></tr>");
      					}
      				}
      				
      			});
      		}
      	}
      	function menuInsert(){
      		var chk = $("input[name='key']:checked").val();
      		console.log(chk);
      		/*if(chk=''){
      			alert('가게 선택해주세요.');
      		}else{
      			$("#menuList").append("<tr><td><input type='hidden' name='foodZoneKey' value='"+chk+"'</td><td></td><td></td></tr>");
      		}   */
      		if(chk==undefined){
      			alert('가게 선택해주세요.');
      		}else{
      			var i = $("input[name='key']:checked").val();
      			$("#menuList tbody").append("<tr style='color : black;'><td><input type='hidden' name='foodZoneKey' value='"+i+"'><input type='text' name='takeOutMenu' id='takeOutMenu'></td><td><input type='text' name='takeOutMenuPrice' id='takeOutMenuPrice'>'"
          				+"'</td><td><input type='file' name='uploadFile'></td><td><button type='button' onclick='deleteTr(this);'>X</button></td></tr>");
      		}
      	}
      	/* $("#menuList tbody>tr>td:last>button[id='dbtn']").on("click", function(){
      		 $(this).parent().parent().remove(); 
      		alert('test');
      	}) */
      	
      	function deleteTr(obj){
      		/* console.log($(this).val()); */
      		var i = $(obj).parent().parent();
      		
      		i.remove();
      	}
      	// 맛집 등록시 빈칸 유효성 검사.
      	function chk(){
      		var name = $("#foodZoneName").val();
      		var chkKey = $("input[name='key']:checked").val();
      		console.log(name);
      		console.log(chkKey);
      		if(name != '' && chkKey!= undefined){
      			var menu = $("input[name=takeOutMenu]");
   			 	var price = $("input[name=takeOutMenuPrice]");
   				var uFile = $("input[name=uploadFile]");
   				if($("#menuList tbody tr").length ==0){
   					alert('메뉴를 추가하세요.');
   					return false;
   				}
   				for (var i=0; i<menu.length;i++){
	   				if(menu.eq(i).val() == ''){
	   					alert('메뉴 이름을 입력해주세요.');
	   					return false;
	   				}
	   				if(price.eq(i).val() == ''){
	   					alert('메뉴 가격을 입력해주세요.');
	   					return false;
	   				}
	   				if(uFile.eq(i).val() == ''){
	   					alert('파일을 업로드 해주세요.');
	   					return false;
	   				}
	   			}
	      		}else{
	      			alert('정보를 전부 입력해주세요.');
	      			return false;
	      		}
      		return true; 
      	} 
      	   	
      </script>
   <body>
   <div class="banner2" id="home" style="color: #FFFFFF;">
   <jsp:include page="../../../WEB-INF/views/common/nav.jsp"/>
      <div class="insertBox" align="center">
         <div style="background-color: rgba(12, 12, 12, 0.36); width:1400px; height:1200px;" align="center">
         	<h1 class="h1">메뉴 추가</h1>
         	<br>
           
               <h3 class="h3" align="center">장소이름</h3>
               <input class="form-control" style="width:400px;" type="text" name="foodZoneName" id="foodZoneName">
               <button type="button" class="btn btn-info" onclick="nameChk();">검색</button>
               <!-- <input class="form-control" type="text" id="zonecode"> -->
               
               <br>
               <div style="width: 500px; display:inline-block">
                  <h3 class="h3">근처 맛집 리스트</h3>
                  <table id="fzListTable" style="text-align: center;">
                     <tr>
                        <th style="width:150px; text-align: center;">이름</th>
                        <th style="width:250px; text-align: center;">주소</th>
                        <th style="width:50px; text-align: center;">선택</th>
                     </tr>
                  </table>
               </div>
               <br>
               <br>
               <button type="button" class="btn btn-info" onclick = "menuInsert();">메뉴 추가하기</button>
               <br><br>
             <form action="insertMenu.do" method="post" enctype="multipart/form-data" name="menuInsertForm" onsubmit="return chk();">
               <table id="menuList" style="text-align: center;" border="">
	               <thead>
		               <tr>
		               		<th>메뉴이름</th>	
		               		<th>가격</th>	
		               		<th>메뉴 사진</th>	
		               		<th>삭제</th>
		               </tr>
	               </thead>
	               <tbody>
	               </tbody>
               </table>
               <br>
               <br>
               <button type="submit" class="loginBtn" onsubmit="return chk();">등록</button>
            </form>
         </div>
      </div>
      </div>
      
   </body>
</html>