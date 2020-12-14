package com.carping.spring.notice.domain;

public class Pagination {
   public static PageInfo getPageInfo(int currentPage, int listCount) {
      PageInfo pi = null;
      
      int pageLimit = 5;   // 한 페이지에서 보여줄 네비게이션 수
      int maxPage;      
      int startPage;      
      int endPage;      
      
      int noticeLimit = 10; // 한 페이지에 보여줄 공지글 갯수
      
      maxPage = (int)((double)listCount / noticeLimit + 0.9);
      
      startPage = (((int)((double)currentPage / pageLimit + 0.9)) - 1) * pageLimit + 1;
      
      endPage = startPage + pageLimit -1;

      if(maxPage < endPage) {
         endPage = maxPage;
      }
      
      pi = new PageInfo(currentPage, noticeLimit, pageLimit, startPage, endPage, listCount, maxPage);
      
      return pi;
   }
}