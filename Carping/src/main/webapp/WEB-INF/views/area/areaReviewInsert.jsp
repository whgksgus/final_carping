<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰게시판 - 리뷰 등록</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
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

.star-input>.input>label[for="a1"]{ 
    width: 20px;
    z-index: 10;
}
.star-input>.input>label[for="a2"]{ 
    width: 40px;
    z-index: 9;
}
.star-input>.input>label[for="a3"]{ 
    width: 60px;
    z-index: 8;
}
.star-input>.input>label[for="a4"]{ 
    width: 80px;
    z-index: 7;
}
.star-input>.input>label[for="a5"]{ 
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
<body>
	<jsp:include page="../common/nav.jsp"></jsp:include>
	<section style="width:100%; height:800px;">
	<div style="height:100px;"></div>
	<div align="center">
		<h2 style="font-family: 'Sunflower', sans-serif;">리뷰 작성</h2>
		<div style="width: 350px; border-bottom: 2px solid lightgray;"></div>
	</div>
	<br>
	<br>
	<form action="areaReviewInsert.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="areaKey" value="${area.areaKey }">
	<input type="hidden" name="memberId" value="${loginUser.memberId }">
	<article>
		<div class="container" style="font-family: 'Sunflower', sans-serif;">
			<div class="col-md-2"></div>
			<div class="col-md-8 vcenter">
				<label class="col-md-2 text-center vcenter"
					style="font-size: 1.5em;">장소</label><input type="text"
					name="address" readonly
					value="${area.areaName} : ${area.areaAddress}"
					class="col-md-8 form-control align-self-center"
					style="width: 50%;">
			</div>
			<div class="col-md-2"></div>
		</div>
		<div class="container" style="font-family: 'Sunflower', sans-serif;">
			<div class="col-md-2"></div>
			<div class="col-md-8 vcenter">
				<label class="col-md-2 text-center vcenter"
					style="font-size: 1.5em;">제목</label><input type="text"
					name="arTitle" class="col-md-8 form-control align-self-center"
					style="width: 50%;" required>

				<div class="col-md-2" style="margin-top: 10px;">
					<span class="star-input"> <span class="input"> <input
							type="radio" name="arScore" id="a1" value="1"><label
							for="a1">1</label> <input type="radio" name="arScore" id="a2"
							value="2"><label for="a2">2</label> <input type="radio"
							name="arScore" id="a3" value="3"><label for="a3">3</label>
							<input type="radio" name="arScore" id="a4" value="4"><label
							for="a4">4</label> <input type="radio" name="arScore" id="a5"
							value="5"><label for="a5">5</label>

					</span> <output for="star-input">
							<input id="result" type="hidden" value="0"
								style="border: none; margin-top: -500px; font-size: 1.4em;"
								size="1">
						</output>
					</span>
				</div>

			</div>
			<div class="col-md-2"></div>
		</div>
		<div class="container" style="font-family: 'Sunflower', sans-serif;">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<label class="col-md-2 text-center vcenter"
					style="font-size: 1.5em;">내용</label>
				<textarea name="arContent" class="col-md-6 form-control" cols="5"
					rows="10"
					style="margin: 0px; width: 564px; height: 325px; resize: none;" required></textarea>
			</div>
			<div class="col-md-2"></div>
		</div>
		<br>
		<div class="container" style="font-family: 'Sunflower', sans-serif;">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<label class="col-md-2 text-center vcenter"
					style="font-size: 1.5em;">사진</label> <input type="file"
					name="uploadFile">
			</div>
			<div class="col-md-2 align-self-left"></div>
		</div>
      <br><br>
			<div class="container" style="font-family: 'Sunflower', sans-serif; ">
				<div class="col-md-2"></div>
				<div class="col-md-8" style="margin-left: -30px;">
					<div class="col-md-4"></div>
					<c:url var="arList" value="areaReviewListView.do">
                        <c:param name="areaKey" value="${area.areaKey }"></c:param>
                    </c:url>
					<button type="button" class="col-md-2 btn btn-default" style="height: 40px;" onclick="back();">목록으로</button>
					<div class="col-md-2"></div>
					<button type="submit" class=" col-md-2 btn btn-info" style="height: 40px;">글쓰기</button>
				</div>
				<div class="col-md-2"></div>
			</div>
	</article>
	</form>
	</section>
	<!--footer-->
	<jsp:include page="../../../WEB-INF/views/common/footer.jsp"/>
	<script>
		function back() {
			location.href = "${arList}";
		}
	</script>
	<script>
		// star rating
		var starRating = function() {
			var $star = $(".star-input"), $result = $star.find("output>input");
			$(document).on("focusin", ".star-input>.input", function() {
				$(this).addClass("focus");
			}).on("focusout", ".star-input>.input", function() {
				var $this = $(this);
				setTimeout(function() {
					if ($this.find(":focus").length === 0) {
						$this.removeClass("focus");
					}
				}, 100);
			}).on("change", ".star-input :radio", function() {
				$("#result").text($(this).val());
				console.log($(this).val());
				var i = $(this).val();
				$("#result").text('');
				$("#result").val(i);
			}).on("mouseover", ".star-input label", function() {
				/*$result.text($(this).text());*/
			}).on("mouseleave", ".star-input>.input", function() {
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