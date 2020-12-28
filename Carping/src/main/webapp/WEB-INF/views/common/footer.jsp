<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
<body>
<!--footer-->
		<div class="footer text-center">
						<div class="container">
									<p class="copy-right wow fadeInUp"  data-wow-duration="1s" data-wow-delay=".3s">&copy; 2020 Carping . All rights reserved</p>
									<ul class="social wow slideInDown" data-wow-duration="1s" data-wow-delay=".3s">
										<li><a href="#" class="tw"></a></li>
										<li><a href="#" class="fb"> </a></li>
										<li><a href="#" class="in"> </a></li>
										<li><a href="#" class="dott"></a></li>
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
</body>
</html>