<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세보기</title>
<!-- 상단 아이콘 -->
<link rel="shortcut icon" type="image/x-icon" href="resources/images/carpingLogo.jpg">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" type='text/css' href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>

<body>
	<jsp:include page="../common/nav.jsp"></jsp:include>
	<section style="width:100%; height:900px;">
		<div style="height:100px;"></div>
		<div align="center">
			<h2 class="h2" style="font-weight:bold; font-family: 'Sunflower', sans-serif;">공지사항 상세보기</h2>
			<div style="width: 350px; border-bottom: 2px solid lightgray;"></div>
		</div>
		<br><br>
		
		
		<article>
			<div class="container" style="font-family:'Sunflower', sans-serif;">
				<div class="col-md-2"></div>
				<div class="col-md-8 vcenter">
					<label class="col-md-2 text-center vcenter" style="font-size: 1.5em;">제목</label>
					<input type="text" value="${notice.nTitle}" class="col-md-8 form-control align-self-center" readonly style="width : 564px;">
				</div>
				
				<br><br>
				
				<div class="col-md-2"></div>
			</div>
		
			<div class="container" style="font-family: 'Sunflower', sans-serif;">
				<div class="col-md-2"></div>
				<div class="col-md-8 vcenter">
					<label class="col-md-2 text-center vcenter" style="font-size: 1.5em;">내용</label>
					<textarea class="col-md-6 form-control" cols="5" rows="10" style="margin: 0px; width: 564px; height: 300px;resize: none;" readonly>${notice.nContent }</textarea>
				</div>
				<div class="col-md-1"></div>
			</div>
		
			
				<br><br>
				
				
				<!-- 여기서부터는 버튼 url 등등임  -->
				<div class="container" style="font-family: 'Sunflower', sans-serif;"></div>
            	<div class="col-md-2"></div>
            	<div class="col-md-5" style="margin-left:100px;">
	            	<div class="col-md-4"></div>
	            	
	            	<!-- 관리자 아닐때(목록만) -->
	            	<c:if test="${loginUser.memberId ne 'admin'}">
	            	<c:url var="nList" value="noticeList.do"></c:url>
					<button class="col-md-2 btn btn-default" style="height: 40px; font-family: 'Sunflower', sans-serif; font-weight:bold; margin-left:190px;" onclick="back();">목록으로</button>
					<div class="col-md-1"></div>
					</c:if>
					
					<c:if test="${loginUser.memberId eq 'admin' }">
		            	<c:url var="nList" value="noticeList.do"></c:url>
						<button class="col-md-2 btn btn-default" style="height: 40px; font-family: 'Sunflower', sans-serif; font-weight:bold;" onclick="back();">목록으로</button>
						<div class="col-md-1"></div>
					</c:if>
					
					<c:url var="nUpdate" value="noticeUpdateView.do">
						<c:param name="nKey" value="${notice.nKey }"></c:param>
					</c:url>
					
					<c:if test="${loginUser.memberId eq 'admin'}">
					<button class="col-md-2 btn btn-default" style="height: 40px; font-family: 'Sunflower', sans-serif; font-weight:bold;" onclick="return nUpdate();">수정</button></c:if>
					<div class="col-md-1"></div>
					
					<c:url var="nDelete" value="noticeDelete.do">
						<c:param name="nKey" value="${notice.nKey }"></c:param>
					</c:url>
					
					<c:if test="${loginUser.memberId eq 'admin'}">
						<button class="col-md-2 btn btn-danger" style="height: 40px; font-family: 'Sunflower', sans-serif; font-weight:bold;" onclick= "return nDelete();">삭제</button>
					</c:if>
				</div>
				<br><br><br>
				
				<div class="col-md-2"></div>
				<div class="col-md-5" style="margin-left:100px;">
	            	<div class="col-md-4"></div>
					<div class="col-md-1"></div>
				</div>
					<div class="col-md-2"></div>
               </article>
			</section><br><br><br>
	
    <!--footer-->
	<jsp:include page="../../../WEB-INF/views/common/footer.jsp"/>
	
	<script>
	function back(){
		location.href="${nList}";
	}
	
	function nUpdate(){
		location.href='${nUpdate}';
	}
		
	function nDelete(){
		var question = confirm("공지사항을 삭제하시겠습니까?");
		if(question){
			location.href='${nDelete}';
			return true;
		}else{
			return false;
		}
	}
	</script>
</body>
</html>