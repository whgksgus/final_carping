<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Carping</title>
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

</head>
<body>
<!--start-home-->
		<div class="banner" id="home">
		<jsp:include page="../../WEB-INF/views/common/nav.jsp"/>
		<!--banner Slider starts Here-->
	  	<script src="resources/js/responsiveslides.min.js"></script>
			 <script>
			    // You can also use "$(window).load(function() {"
			    $(function () {
			      // Slideshow 4
			      $("#slider4").responsiveSlides({
			        auto: true,
			        pager:true,
			        nav:false,
			        speed: 500,
			        namespace: "callbacks",
			        before: function () {
			          $('.events').append("<li>before event fired.</li>");
			        },
			        after: function () {
			          $('.events').append("<li>after event fired.</li>");
			        }
			      });
			
			    });
			  </script>
	      <!--banner Slider starts Here-->

		 <div class="down"><a class="scroll" href="#gallery"><img src="resources/images/down.png" alt=""></a></div>
	</div>
	
	<!--Gallery-->
	<div class="gallery" id="gallery">
		<div class="container" style="width:1519px;">
					<div class="gallery-grids" style="margin:0; padding:0;">
						<div class="col-md-4 col-sm-4 ggd baner-top small wow fadeInLeft animated" data-wow-delay=".5s" style="width:360px;">
							<a href="resources/images/my2.jpg" class="b-link-stripe b-animate-go  swipebox">
								<div class="gal-spin-effect vertical " onclick="location.href='areaInfoView.do'">
									<img src="resources/images/my1.jpg" alt=" " />
									<div class="gal-text-box">
										<div class="info-gal-con" onclick="location.href='areaInfoView.do'">
											<h4>차박 장소 추천</h4>
											<span class="separator"></span>
											<p>차박차박~</p>
											<span class="separator"></span>
										</div>
									</div>
								</div>
							</a>
						</div>
						<div class="col-md-4 col-sm-4 ggd baner-top small wow fadeInLeft animated" data-wow-delay=".5s" style="width:360px;">
							<a href="resources/images/my2.jpg" class="b-link-stripe b-animate-go  swipebox">
								<div class="gal-spin-effect vertical ">
									<img src="resources/images/my2.jpg" alt=" " />
									<div class="gal-text-box">
										<div class="info-gal-con">
											<h4>맛집,명소 추천</h4>
											<span class="separator"></span>
											<p>맛있엉ㅎ</p>
											<span class="separator"></span>
										</div>
									</div>
								</div>
							</a>
						</div>
						<div class="col-md-4 col-sm-4 ggd baner-top small wow fadeInLeft animated" data-wow-delay=".5s" style="width:360px;">
							<a href="resources/images/my2.jpg" class="b-link-stripe b-animate-go  swipebox">
								<div class="gal-spin-effect vertical " onclick="location.href='tentListView.do'">
									<img src="resources/images/my3.jpg" alt=" " />
									<div class="gal-text-box">
										<div class="info-gal-con" onclick="location.href='tentListView.do'">
											<h4>차박물품쇼핑</h4>
											<span class="separator"></span>
											<p>질러 질러~</p>
											<span class="separator"></span>
										</div>
									</div>
								</div>
							</a>
						</div>
						<div class="col-md-4 col-sm-4 ggd baner-top small wow fadeInLeft animated" data-wow-delay=".5s" style="width:360px;">
							<a href="resources/images/my2.jpg" class="b-link-stripe b-animate-go  swipebox">
								<div class="gal-spin-effect vertical " onclick="location.href='reviewInfo.do'">
									<img src="resources/images/my4.jpg" alt=" " />
									<div class="gal-text-box">
										<div class="info-gal-con" onclick="location.href='reviewInfo.do'">
											<h4>후기게시판</h4>
											<span class="separator"></span>
											<p>후기쓰자!</p>
											<span class="separator"></span>
										</div>
									</div>
								</div>
							</a>
						</div>
		
						<!-- <div class="clearfix"> </div> -->
					</div>
				</div>
		</div>
	<!-- //gallery -->

	
<!--footer-->
		<div class="footer text-center">
						<div class="container">
									<p class="copy-right wow fadeInUp"  data-wow-duration="1s" data-wow-delay=".3s">&copy; 2016 Outdoors . All rights reserved | Design by <a href="http://w3layouts.com">W3layouts</a></p>
									<ul class="social wow slideInDown" data-wow-duration="1s" data-wow-delay=".3s">
										<li><a href="#" class="tw"></a></li>
										<li><a href="#" class="fb"> </a></li>
										<li><a href="#" class="in"> </a></li>
										<li><a href="#" class="dott"></a></li>
										 <div class="clearfix"></div>
									</ul>
					 </div>
	     </div>
		<!--start-smooth-scrolling-->
						<script type="text/javascript">
									$(document).ready(function() {
										/*
										var defaults = {
								  			containerID: 'toTop', // fading element id
											containerHoverID: 'toTopHover', // fading element hover id
											scrollSpeed: 1200,
											easingType: 'linear' 
								 		};
										*/
										
										$().UItoTop({ easingType: 'easeOutQuart' });
										
									});
								</script>
								<!--end-smooth-scrolling-->
		<a href="#home" id="toTop" class="scroll" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
	<script src="resources/js/bootstrap.min.js"></script>
</body>
</html>