<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>장소 추가</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="keywords" content="Outdoors Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
	Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola web design" />
	<script type="applisalonion/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	<link href="resources/css/bootstrap.css" rel='stylesheet' type='text/css' />
	<!-- Custom Theme files -->
	<link href="resources/css/iconeffects.css" rel='stylesheet' type='text/css' />
	<link href="resources/css/style.css" rel='stylesheet' type='text/css' />	
	<link rel="stylesheet" href="resources/css/swipebox.css">
	<script src="resources/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="resources/js/move-top.js"></script>
	<script type="text/javascript" src="resources/js/easing.js"></script>
	<!--/web-font-->
		<link href='//fonts.googleapis.com/css?family=PT+Sans:400,400italic,700,700italic' rel='stylesheet' type='text/css'>
		<link href='//fonts.googleapis.com/css?family=Merriweather+Sans:400,300,700' rel='stylesheet' type='text/css'>
	<!--/script-->
	<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},900);
				});
			});
	</script>
	<!-- swipe box js -->
	<script src="resources/js/jquery.swipebox.min.js"></script> 
	    <script type="text/javascript">
			jQuery(function($) {
				$(".swipebox").swipebox();
			});
	</script>
	<!-- //swipe box js -->
	<!--animate-->
	<link href="resources/css/animate.css" rel="stylesheet" type="text/css" media="all">
	<script src="resources/js/wow.min.js"></script>
	<script>
		 new WOW().init();
	</script>
	<!-- Google Fonts(poor story) -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap" rel="stylesheet">
	
	<style>
		span{
			font-family: 'Poor story', cursive;
			font-size: 1.6em;
			color: black;
		}
	
		
	</style>
</head>
<body>
	<jsp:include page="../common/nav.jsp"/>
	<div class="blogs" id="blogs">
		<div class="container">
		    <h3 class="tittle" style="font-family: 'Poor story', cursive;">장소 추가</h3>
		    <p class="wel-text wow fadeInDown"  data-wow-duration=".8s" data-wow-delay=".4s"></p>
				<div class="inst-grids">
					<a href="areaInsertView.do">
					<div class="col-md-4 blog-gd-w3ls" style="text-align: center;">
					<span>차박 장소</span>
						<img src="resources/images/ReviewCarCampingImage.jpg" height="100%">
						<!-- <div class="date-w3">
							<h4><span class="big"></span>차박 장소</h4>
						</div> -->
						<div class="blog-description-w3agile">
							<h5>차박 장소를 등록해주세요.</h5>
						 </div>
					</div></a>
					<a href="#">
					<div class="col-md-4 blog-gd-w3ls" style="text-align: center;">
					<span>맛집</span>
						<img src="resources/images/ReviewFoodImage.jpg" height="100%">
						<!-- <div class="date-w3">
							<h4><span class="big"></span>맛집</h4>
						</div> -->
						<div class="blog-description-w3agile">
							<h5>차박 장소 주변 맛집을 등록해주세요.</h5>
						 </div>
					</div></a>
					<a href="placeInsertView.do">
					<div class="col-md-4 blog-gd-w3ls" style="text-align: center;">
					<span>명소</span>
						<img src="resources/images/b3.jpg">
						<!-- <div class="date-w3">
							<h4><span class="big"></span>명소</h4>
						</div> -->
						<div class="blog-description-w3agile">
							<h5>차박 장소 주변 명소를 등록해주세요.</h5>
						 </div>
					</div></a>

					<div class="clearfix"> </div>		
				</div>

		</div>
	</div>
</body>
</html>