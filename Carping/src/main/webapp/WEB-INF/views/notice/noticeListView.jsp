<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 상단 아이콘 -->
<link rel="shortcut icon" type="image/x-icon" href="resources/images/carpingLogo.jpg">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
   href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap"
   rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<title>공지사항</title>
</head>

<body>
   <jsp:include page="../common/nav.jsp" />

   <c:if test="${loginUser.memberId == 'admin' }">
      <div align="center">
         <button onclick="location.href='noticeWriteView.do'">글쓰기</button>
      </div>
   </c:if>
   
   <div style="width:100%; height:850px;">
   <div style="height:100px;"></div>
   <div align="center">
      <h2 style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="h2">공지사항</h2>
      <div style="width: 350px; border-bottom: 2px solid lightgray;"></div><br>
         <div class="container">
            <div class="col-md-1"></div>
            <div class="col-md-10">
   
   <table class="table table-striped">
                  <tr>
         <th style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="col-md-1 test-center">글번호</th>
         <th style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="col-md-5 test-center">제목</th>
         <th style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="col-md-1 test-center">작성자</th>
         <th style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="col-md-1 test-center">조회수</th>
         <th style="font-family: 'Sunflower', sans-serif; font-weight:bold;" class="col-md-2 test-center">작성일</th>
         </tr>
         <c:forEach items="${nList }" var="notice">
<tr>
               <td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">${notice.nKey }
               </td>
                  <c:url var="nDetail" value="noticeDetail.do">
                     <c:param name="nKey" value="${notice.nKey }"></c:param>
                  </c:url> 
               <td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">
               <a href="${nDetail }">${notice.nTitle }</a></td>
               <td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">${notice.memberId }</td>
               <td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">
               ${notice.nCount }</td>
               <td style="font-family: 'Sunflower', sans-serif; font-weight:bold;">
               ${notice.nWriteDate }
               </td>
</tr>
         </c:forEach>
</table>
   <br>
   <br>
   <br>
   <table style="width: 100%; text-align: center; padding-top: 300px;">
      <tr align="center" height="20">
         <td colspan="6">
            <!-- 이전 --> 
            <c:if test="${pi.currentPage <= 1 }">
               ◀&nbsp;
            </c:if> <c:if test="${pi.currentPage > 1 }">
               <c:url var="before" value="noticeListView.do">
                  <c:param name="page" value="${pi.currentPage -1 }"></c:param>
               </c:url>
               <a href="${before }">◀</a>&nbsp;
            </c:if> 
            
            <!-- 페이지 -->
             <c:forEach var="p" begin="${pi.startPage }"
               end="${pi.endPage }">
               <c:if test="${p eq pi.currentPage }">
                  <font style="font-weight: bold;">${p }</font>
               </c:if>
               <c:url var="pagination" value="noticeList.do">
                  <c:param name="page" value="${p }"></c:param>
               </c:url>
               <c:if test="${p ne pi.currentPage }">
                  <a href="${pagination }">${p }</a>&nbsp;
               </c:if>
            </c:forEach> <!-- 다음 --> <c:if test="${pi.currentPage >= pi.maxPage }">
               ▶&nbsp;
            </c:if> <c:if test="${pi.currentPage < pi.maxPage }">
               <c:url var="next" value="noticeList.do">
                  <c:param name="page" value="${pi.currentPage + 1 }"></c:param>
               </c:url>
               <a href="${next }">▶</a>&nbsp;
            </c:if>
         </td>
      </tr>
   </table>
   <br>
   <br>
   <br>
      <form action="noticeSearch.do" method="get">
      <div style="margin-left:700px;">
      <select class="form-control col-sm-2" style="width:120px; font-family: 'Sunflower', sans-serif; font-weight:bold;" id="searchCondition" name="searchCondition">
            <option value="all" <c:if test="${search.searchCondition == 'all' }">selected</c:if>>전체</option>
            <option value="title" <c:if test="${search.searchCondition == 'title' }">selected</c:if>>제목</option>
            <option value="content" <c:if test="${search.searchCondition == 'content' }">selected</c:if>>내용</option>
         </select>&nbsp;&nbsp;
      <input type="text" class="form-control col-sm-1" id="searchValue" name="searchValue" style="font-family: 'Sunflower', sans-serif; font-weight:bold; width:300px;" value="${search.searchValue }" required/>
      <input type="submit" class="btn btn-default col-sm-1" style="font-family: 'Sunflower', sans-serif; font-weight:bold; width:80px;" value="검색" id="search"/>
   </div>
         
      </form>
   </div>
   </div>
   <!--footer-->
   <jsp:include page="../../../WEB-INF/views/common/footer.jsp"/>
</body>
</html>