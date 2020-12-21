<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 수정하기! </title>
<style>
	           .star-input>.input,

.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{
    display: inline-block;
    vertical-align: top;
    background: url(../../../resources/images/star.png) no-repeat;
}
.star-input{
    white-space: nowrap;
}
.star-input>.input{
    display:inline-block;
    width: 100px;
    background-size: 100px;
    height: 19px;
    white-space: nowrap;
    overflow: hidden;
    position: relative;
}
.star-input>.input>input{
    position: absolute;
    width: 1px;
    height: 1px;
    opacity: 0;
}
.star-input>.input.focus{
    outline: 1px dotted #ddd;
}
.star-input>.input>label{
    width: 10px;
    height: 0;
    padding: 19px 0 0 0;
    overflow: hidden;
    float: left;
    cursor: pointer;
    position: absolute;
    top: 0;
    left: 0;
}

.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{
    background-size: 100px;
    background-position: 0 bottom;
}

.star-input>.input>label[for="p1"]{ 
    width: 20px;
    z-index: 10;
}
.star-input>.input>label[for="p2"]{ 
    width: 40px;
    z-index: 9;
}
.star-input>.input>label[for="p3"]{ 
    width: 60px;
    z-index: 8;
}
.star-input>.input>label[for="p4"]{ 
    width: 80px;
    z-index: 7;
}
.star-input>.input>label[for="p5"]{ 
    width: 100px;
    z-index: 6;
}
.star-input>output{
    display: inline-block;
    width: 36px;
    text-align: right;
}
.star-input>output>b{
    font:bold 18px Helvetica, Arial, sans-serif;
    vertical-align: middle;
}  

</style>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" type='text/css' href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
</head>
<body>
	<jsp:include page="../common/nav.jsp"></jsp:include>
	<section style="margin-top: 40px; ">
		<h3 style="font-family: 'Sunflower', sans-serif; margin-left: 100px;">리뷰 수정</h3>
		<br><br>
		<form action="foodZoneUpdate.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="foodZoneKey" value=${foodZone.foodZoneKey }>
			<input type="hidden" name="memberId" value="${loginUser.memberId }">
			<input type="hidden" name="frKey" value="${fReview.frKey }">
			<input type="hidden" name="frPhoto" value="${fReview.frPhoto }">
			
			
		<article>
			<div class="container" style="font-family: 'Sunflower', sans-serif;">
				<div class="col-md-2"></div>
				<div class="col-md-8 vcenter">
					<label class="col-md-2 text-center vcenter" style="font-size: 1.5em;">장소</label><input type="text" name="address" readonly="readonly" value="${foodZone.foodZoneName} : ${foodZone.foodZoneAddress}" class="col-md-8 form-control align-self-center" style="width : 50%;">
				</div>
				<div class="col-md-2"></div>
			</div>
			<div class="container" style="font-family: 'Sunflower', sans-serif;">
				<div class="col-md-2"></div>
				<div class="col-md-8 vcenter">
				<label class="col-md-2 text-center vcenter" style="font-size: 1.5em;">제목</label><input type="text" name="frTitle"class="col-md-8 form-control align-self-center" value="${fReview.frTitle }" style="width : 50%;">
				
				<div class="col-md-2" style="margin-top: 10px;">
					  <span class="star-input">
  <span class="input">
  	<c:if test="${fReview.frScore eq 1 }">
  		<input type="radio" name="frScore" id="p1" value="1" checked="checked"><label for="p1">1</label>
  		<input type="radio" name="frScore" id="p2" value="2"><label for="p2">2</label>
  		<input type="radio" name="frScore" id="p3" value="3"><label for="p3">3</label>
  		<input type="radio" name="frScore" id="p4" value="4"><label for="p4">4</label>
  		<input type="radio" name="frScore" id="p5" value="5"><label for="p5">5</label>
  	</c:if>
  	<c:if test="${fReview.frScore eq 2 }">
  		<input type="radio" name="frScore" id="p1" value="1"><label for="p1">1</label>
  		<input type="radio" name="frScore" id="p2" value="2" checked="checked"><label for="p2">2</label>
  		<input type="radio" name="frScore" id="p3" value="3"><label for="p3">3</label>
  		<input type="radio" name="frScore" id="p4" value="4"><label for="p4">4</label>
  		<input type="radio" name="frScore" id="p5" value="5"><label for="p5">5</label>
  	</c:if>
  	<c:if test="${fReview.frScore eq 3 }">
  		<input type="radio" name="frScore" id="p1" value="1"><label for="p1">1</label>
  		<input type="radio" name="frScore" id="p2" value="2"><label for="p2">2</label>
  		<input type="radio" name="frScore" id="p3" value="3" checked="checked"><label for="p3">3</label>
  		<input type="radio" name="frScore" id="p4" value="4"><label for="p4">4</label>
  		<input type="radio" name="frScore" id="p5" value="5"><label for="p5">5</label>
  	</c:if>
  	<c:if test="${fReview.frScore eq 4 }">
  		<input type="radio" name="frScore" id="p1" value="1"><label for="p1">1</label>
  		<input type="radio" name="frScore" id="p2" value="2"><label for="p2">2</label>
  		<input type="radio" name="frScore" id="p3" value="3"><label for="p3">3</label>
  		<input type="radio" name="frScore" id="p4" value="4" checked="checked"><label for="p4">4</label>
  		<input type="radio" name="frScore" id="p5" value="5"><label for="p5">5</label>
  	</c:if>
  	<c:if test="${fReview.frScore eq 5 }">
  		<input type="radio" name="frScore" id="p1" value="1"><label for="p1">1</label>
  		<input type="radio" name="frScore" id="p2" value="2"><label for="p2">2</label>
  		<input type="radio" name="frScore" id="p3" value="3"><label for="p3">3</label>
  		<input type="radio" name="frScore" id="p4" value="4"><label for="p4">4</label>
  		<input type="radio" name="frScore" id="p5" value="5" checked="checked"><label for="p5">5</label>
  	</c:if>
    
    
    
    
    

  </span>
  <output for="star-input"><input id="result" type="text" value="${fReview.frScore}" style="border: none; margin-top: -500px; font-size: 1.4em;" size="1"></output>
</span>
				</div>

			</div>
			<div class="col-md-2"></div>
			</div> 
			<div class="container" style="font-family: 'Sunflower', sans-serif;">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<label class="col-md-2 text-center vcenter" style="font-size: 1.5em;">내용</label><textarea name="frContent" class="col-md-6 form-control" cols="5" rows="10" style="margin: 0px; width: 564px; height: 325px; resize: none;">${fReview.frContent }</textarea>
				</div>
				<div class="col-md-2"></div>
			</div>
			<br>
			<div class="container" style="font-family: 'Sunflower', sans-serif;">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<label class="col-md-2 text-center vcenter" style="font-size: 1.5em;">사진</label>
					<input type="file" name="reloadFile">
				</div>
				<div class="col-md-2 align-self-left">
		
				

				</div>
			</div>
			<br><br>
			<div class="container" style="font-family: 'Sunflower', sans-serif; ">
				<div class="col-md-2"></div>
				<div class="col-md-8" style="margin-left: -30px;">
					<div class="col-md-4"></div>
					<button class="col-md-2 btn btn-default" style="height: 40px;" onclick="back();">목록으로</button>
					<div class="col-md-2"></div>
					<button type="submit" class=" col-md-2 btn btn-info" style="height: 40px;">수정하기</button>
				</div>
				<div class="col-md-2"></div>
			</div>
			
		</article>
		</form>
	</section>
	<script>
		function back(){
			location.href="foodZoneReviewListView.do?foodZoneKey="+${foodZoneKey};
		}
	</script>
	 <script>
     // star rating
	 var starRating = function(){
	   var $star = $(".star-input"),
	       $result = $star.find("output>input");
	   $(document)
	     .on("focusin", ".star-input>.input", function(){
	     $(this).addClass("focus");
	   })
	     .on("focusout", ".star-input>.input", function(){
	     var $this = $(this);
	     setTimeout(function(){
	       if($this.find(":focus").length === 0){
	         $this.removeClass("focus");
	       }
	     }, 100);
	   })
	     .on("change", ".star-input :radio", function(){
	     $("#result").text($(this).val());
	       console.log($(this).val());
	       var i = $(this).val();
	       $("#result").text('');
	       $("#result").val(i);
	   })
	     .on("mouseover", ".star-input label", function(){
	     /*$result.text($(this).text());*/
	   })
	     .on("mouseleave", ".star-input>.input", function(){
	    /* var $checked = $star.find(":checked");
	     if($checked.length === 0){
	       $result.text("0");
	     } else {
	       $result.text($checked.next().text());
	     }*/
	   });
	 };
	 starRating();
				</script>
</body>
</html>