<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Carping - 쇼핑몰</title>
</head>
<style>
	#wrapper{
		width: 100%;
		height: 1000px;
	}
	
	a { text-decoration:none;
	color: black; } 
	
    #title {
        text-align: center;
        font-size: 30px;
        font-weight: bold;
    }

    #item_sortby {
        float: left;
        width: 100%;
        text-align: right;
        font-size: 15px;
        color: black;

    }

    #sortby {
        margin: 0px 10px;
    }

    #sortby:hover {
        font-weight: bold;
    }
    
     #item {
        margin: 20px 47px;
    }

    #item_img {
        width: 350px;
        height: 350px;
    }

    #item_img:hover {
        transition-duration: 0.5s;
        transform: scale(0.95);
    }

    #item_name {
        margin-top: 5px;
        font-size: 20px;
        
    }

    #item_price {
        font-size: 15px;
    }
    

</style>
<body>
   <div id="wrapper">
   
      <div id="contents">

         <legend id="title">차박텐트 상품목록</legend>
         <br>
   
            <hr>
         <div id="item_sortby">
            <a href="#"><span id="sortby">최신순</span></a>| 
            <a href="#"><span id="sortby">낮은가격순</span></a>| 
            <a href="#"><span id="sortby">높은가격순</span></a>
         </div>
         <br>
        
           <div id="item" style="width:1300px; height:550px; float:left; padding-left: 100px; padding-right:100px;">
                <c:forEach items="${iList }" var="item">
                        	<c:url var="iDetail" value="itemDetail.do">
                        		<c:param name="itemKey" value="${item.itemKey }"></c:param>
                        	</c:url>
                           <div id="item_img" style="width:300px; height:400px; float:left; padding-left:10px; padding-right:10px; text-align:center;">

                            <a href="${iDetail }"> 
                           	<img src="${item.itemImage}" style="width: 300px; height: 300px;"></a><br>
                         	<a href="${iDetail }">${item.itemName }</a>
                          	<br>
                          <fmt:formatNumber value="${item.itemPrice }" pattern="#,###"/>원
                          
                        </div>
          			</c:forEach>
          </div>
   
             <br><br><br><br><br><br><br><br><br><br><br><br><br><br>
            <table>
            <tr align="center" height="20">
			<td colspan="6">
				<!-- 이전 -->
				<c:if test="${pi.currentPage <= 1 }">
					[이전]&nbsp;
				</c:if>
				<c:if test="${pi.currentPage > 1 }">
					<c:url var="before" value="tentListView.do">
						<c:param name="page" value="${pi.currentPage -1 }"></c:param>
					</c:url>			
					<a href="${before }">[이전]</a>&nbsp;
				</c:if>
				<!-- 페이지 -->
				<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
					<c:if test="${p eq pi.currentPage }">
						<font style="color:red;">[${p }]</font>
					</c:if>
					<c:url var="pagination" value="tentListView.do">
						<c:param name="page" value="${p }"></c:param>
					</c:url>
					<c:if test="${p ne pi.currentPage }">
						<a href="${pagination }">${p }</a>&nbsp;
					</c:if>
				</c:forEach>
				<!-- 다음 -->
				<c:if test="${pi.currentPage >= pi.maxPage }">
					[다음]&nbsp;
				</c:if>
				<c:if test="${pi.currentPage < pi.maxPage }">
					<c:url var="after" value="tentListView.do">
						<c:param name="page" value="${pi.currentPage + 1 }"></c:param>
					</c:url>
					<a href="${after }">[다음]</a>&nbsp;
				</c:if>
			</td>
		</tr>
	</table>
         <br>
		<br><br><br><br><br><br><br><br><br><br><br><br><br>
      <br>
      <hr>
   </div>  

   </div>
</body>

</html>
