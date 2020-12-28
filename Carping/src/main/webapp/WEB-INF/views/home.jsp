<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Carping</title>
<!-- 상단 아이콘 -->
<link rel="shortcut icon" type="image/x-icon" href="resources/images/carpingLogo.jpg">
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
<!--banner Slider starts Here-->
<style>
	.wrap_center{
    width: 100%;
    height: 600px;
	}
	.containerBanner{
	    width: 100%;
	    height: 600px;
	    overflow: hidden;
	}
	.img_wrap{
	    width: 100%;
	    height: 600px;
	    position:absolute;
	    overflow: hidden;
	}
	
	/* 롤링 이미지 UL */
	.rollimgs {
	    list-style: none;
	    padding: 0;
	    margin: 0;
	}
	
	.rollimgs li{
    position: absolute;
    background-size: cover;
    width: 50%;
    height: 600px;
    left: 50%;
}
.rollimgs li img{
background-size: cover;
    width: 100%;
    height: 100%;
}
.rollimgs li.currentroll{
    left: 0;
    transition: left .5s ease-in-out, right .5s ease-in-out;
}
.rollimgs li.prevroll{
    left: -50%;
    transition: left .5s ease-in-out, right .5s ease-in-out;
}
.rollimgs.reverse li.prevroll{
    transition: none;
}
.rollimgs li.nextroll{
    left: 50%;
    display: block;
    transition: none;
}
.rollimgs.reverse li.nextroll{
    transition: left .5s ease-in-out, right .5s ease-in-out;
}
</style>
<script>
let banner = {
	    rollId: null,
	    interval: 2000,

	    //롤링 배너 초기화
	    rollInit: function (newinterval) {
	        if(parseInt(newinterval) > 0){
	            this.interval = newinterval;
	        }
	        //현재 배너
	        let firstitem = document.querySelector('.rollimgs li');
	        if(firstitem){
	            firstitem.classList.add('currentroll');
	        }
	        //다음 배너
	        let seconditem = document.querySelectorAll('.rollimgs li')[1];
	        if(seconditem){
	            seconditem.classList.add('nextroll');
	        }
	        //이전 배너
	        document.querySelector('.rollimgs li:last-child').classList.add('prevroll');
	        this.rollId = setInterval(this.rollNext, this.interval);//롤링 인터벌 호출
	    },
	    
	    //다음 배너 롤링
	    rollNext: function () {
	        if(document.querySelector('.prevroll')){
	            document.querySelector('.prevroll').classList.remove('prevroll');
	        }
	        if(document.querySelector('.currentroll')){
	            document.querySelector('.currentroll').classList.add('prevroll');
	            document.querySelector('.currentroll').classList.remove('currentroll');
	        }
	        if(document.querySelector('.nextroll')){
	            document.querySelector('.nextroll').classList.add('currentroll');
	            document.querySelector('.nextroll').classList.remove('nextroll');
	        }
	    //다음 이미지 있으면 다음 롤링 이미지로 선택, 없으면 첫번째 이미지를 롤링 이미지로 지정
	        if(document.querySelector('.currentroll').nextElementSibling){
	            document.querySelector('.currentroll').nextElementSibling.classList.add('nextroll');
	        }else{
	            document.querySelector('.rollimgs li').classList.add('nextroll');
	        }
	    }
	}
document.addEventListener('DOMContentLoaded', function(){
    banner.rollInit(4000); // 배너 롤링
});
</script>
   <!--banner Slider starts Here-->
<body>
<!--start-home-->
		<jsp:include page="../../WEB-INF/views/common/nav.jsp"/>
		<div style="height: 70px; display:block;"></div>
		<div class="wrap_center">
		    <div class="containerBanner">
		        <div class="img_wrap">
		            <ul class="rollimgs">
		                <li><img src="resources/images/carping1.jpg"></img></li>
						<li><img src="resources/images/carping2.jpg"></img></li>
						<li><img src="resources/images/carping3.jpg"></img></li>
						<li><img src="resources/images/carping4.jpg"></img></li>
		            </ul>
		        </div>
		      </div>

		 <div class="down" style="width:80px; height:50px;"><a class="scroll" href="#gallery" style="width:80px; height:50px;"><img style="width:80px; height:50px;" src="resources/images/down.png" alt=""></a></div>
	</div>
	<!--Gallery-->
	<div class="gallery" id="gallery">
		<div class="container" style="width:1640px;">
					<div class="gallery-grids" style="margin:0; padding:0;">
						<div class="col-md-4 col-sm-4 ggd baner-top small wow fadeInLeft animated" data-wow-delay=".5s" style="width:400px;">
							<a href="resources/images/my2.jpg" class="b-link-stripe b-animate-go  swipebox">
								<div style="height:400px;" class="gal-spin-effect vertical " onclick="location.href='areaInfoView.do'">
									<img style="height:400px;" src="resources/images/SeaSideCarping5main.jpg" alt=" " />
									<div class="gal-text-box">
										<div class="info-gal-con" onclick="location.href='areaInfoView.do'">
											<h4>차박 장소 추천</h4>
											<span class="separator"></span>
											<p>차박 어디로 가고싶으세요~!</p>
											<span class="separator"></span>
										</div>
									</div>
								</div>
							</a>
						</div>
						<div class="col-md-4 col-sm-4 ggd baner-top small wow fadeInLeft animated" data-wow-delay=".5s" style="width:400px;">
							<a href="resources/images/my2.jpg" class="b-link-stripe b-animate-go  swipebox">
								<div style="height:400px;" class="gal-spin-effect vertical " onclick="location.href='foodZoneView.do'">
									<img style="height:400px;" src="resources/images/foodImage.jpg" alt=" " />
									<div class="gal-text-box">
										<div class="info-gal-con" onclick="location.href='foodZoneView.do'">
											<h4>맛집 추천</h4>
											<span class="separator"></span>
											<p>여행과 맛집을 한번에~!</p>
											<span class="separator"></span>
										</div>
									</div>
								</div>
							</a>
						</div>
						<div class="col-md-4 col-sm-4 ggd baner-top small wow fadeInLeft animated" data-wow-delay=".5s" style="width:400px;">
							<a href="resources/images/my2.jpg" class="b-link-stripe b-animate-go  swipebox">
								<div style="height:400px;" class="gal-spin-effect vertical " onclick="location.href='tentListView.do'">
									<img style="height:400px;" src="resources/images/campingItemmain.jpg" alt=" " />
									<div class="gal-text-box">
										<div class="info-gal-con" onclick="location.href='tentListView.do'">
											<h4>차박 쇼핑몰</h4>
											<span class="separator"></span>
											<p>차박 준비하고 가세요~!</p>
											<span class="separator"></span>
										</div>
									</div>
								</div>
							</a>
						</div>
						<div class="col-md-4 col-sm-4 ggd baner-top small wow fadeInLeft animated" data-wow-delay=".5s" style="width:400px;">
							<a href="resources/images/my2.jpg" class="b-link-stripe b-animate-go  swipebox">
								<div style="height:400px;" class="gal-spin-effect vertical " onclick="location.href='reviewInfo.do'">
									<img style="height:400px;" src="resources/images/my4.jpg" alt=" " />
									<div class="gal-text-box">
										<div class="info-gal-con" onclick="location.href='reviewInfo.do'">
											<h4>리뷰게시판</h4>
											<span class="separator"></span>
											<p>리뷰 평가를 남겨주세요~!</p>
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
	<jsp:include page="../../WEB-INF/views/common/footer.jsp"/>
	<script src="resources/js/bootstrap.min.js"></script>
</body>
</html>