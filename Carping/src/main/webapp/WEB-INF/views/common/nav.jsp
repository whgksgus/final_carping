<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Outdoors Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola web design" />
<script type="applisalonion/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="resources/css/bootstrap.css" rel='stylesheet'
	type='text/css' />
<!-- Custom Theme files -->
<link href="resources/css/iconeffects.css" rel='stylesheet'
	type='text/css' />
<link href="resources/css/style.css" rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="resources/css/swipebox.css">
<script src="resources/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="resources/js/move-top.js"></script>
<script type="text/javascript" src="resources/js/easing.js"></script>
<!--/web-font-->
<link
	href='//fonts.googleapis.com/css?family=PT+Sans:400,400italic,700,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='//fonts.googleapis.com/css?family=Merriweather+Sans:400,300,700'
	rel='stylesheet' type='text/css'>
<!--/script-->
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
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
<link href="resources/css/animate.css" rel="stylesheet" type="text/css"
	media="all">
<script src="resources/js/wow.min.js"></script>
<script>
       new WOW().init();
   </script>
</head>
<body>
	<div class="header-bottom">
		<div class="container">
			<div class="fixed-header">
				<!-- logo -->
				<div class="logo">
					<a href="index.jsp"><h1>Carping</h1></a>
				</div>
				<!-- //logo -->
				<div class="top-menu">
					<span class="menu"> </span>
					<nav class="link-effect-4" id="link-effect-4">
						<ul>
							<li class="active"><a data-hover="Home" href="index.jsp">Home</a>

							</li>
							<li><a data-hover="추천장소" href="#" class="scroll">추천장소</a>
								<ul class="subNav">
									<li style="float: left;"><a
										style="display: block; padding: 1px 5px;" href="areaInfoView.do">차박 장소
											정보</a></li>
									<li style="float: left;"><a
										style="display: block; padding: 1px 5px;" href="foodZoneView.do">맛집 정보</a></li>
									<li style="float: left;"><a
										style="display: block; padding: 1px 5px;" href="placeView.do">명소 정보</a></li>
								</ul></li>
							<li><a data-hover="쇼핑몰" href="tentListView.do" class="scroll">쇼핑몰</a></li>
							<li><a data-hover="커뮤니티" href="#" class="scroll">커뮤니티</a>
								<ul class="subNav">
									<li style="float: left;"><a
										style="display: block; padding: 1px 5px;" href="#">자유 게시판</a></li>
									<li style="float: left;"><a
										style="display: block; padding: 1px 5px;" href="reviewInfo.do">리뷰 게시판</a></li>
								</ul></li>
							<li><a data-hover="마이페이지" href="#" class="scroll">마이페이지</a>
								<ul class="subNav">
									<li style="float: left;"><a
										style="display: block; padding: 1px 5px;" href="#">구매내역</a></li>
									<li style="float: left;"><a
										style="display: block; padding: 1px 5px;" href="#">회원정보 수정</a></li>
									<li style="float: left;"><a
										style="display: block; padding: 1px 5px;" href="#">회원탈퇴</a></li>
									<li style="float: left;"><a
										style="display: block; padding: 1px 5px;" href="areaInsertView.do">장소추가</a></li>
								</ul></li>
							<li><a data-hover="고객센터" href="#" class="scroll">고객센터</a>
								<ul class="subNav">
									<li style="float: left;"><a
										style="display: block; padding: 1px 5px;" href="#">공지사항</a></li>
									<li style="float: left;"><a
										style="display: block; padding: 1px 5px;" href="sugList.do">건의사항</a></li>
								</ul></li>
						</ul>
					</nav>
				<button class="loginBtn" onclick="location.href='login.do';">로그인</button>
				<button class="enrollBtn" onclick="location.href='enroll.do';">회원가입</button>
				</div>
				<!-- script-for-menu -->
				<script>
                           $("span.menu").click(function(){
                              $(".top-menu ul").slideToggle("slow" , function(){
                              });
                           });
                        </script>
				<!-- script-for-menu -->

				<div class="clearfix"></div>
				<script>
            $(document).ready(function() {
                var navoffeset=$(".header-bottom").offset().top;
                $(window).scroll(function(){
                  var scrollpos=$(window).scrollTop(); 
                  if(scrollpos >=navoffeset){
                     $(".header-bottom").addClass("fixed");
                  }else{
                     $(".header-bottom").removeClass("fixed");
                  }
                });
                
            });
            </script>
			</div>
		</div>
	</div>
</body>
</html>