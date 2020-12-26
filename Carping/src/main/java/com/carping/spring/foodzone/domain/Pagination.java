package com.carping.spring.foodzone.domain;

public class Pagination {
	
   public static PageInfo getPageInfo(int currentPage, int listCount) {
      PageInfo pi = null;
      int pageLimit = 10;   // 한 페이지에서 보여줄 네비게이션 수
      int maxPage;      
      int startPage;      
      int endPage;      
      int listLimit = 10; // 한 페이지에 보여줄 글 개수
      
      maxPage = (int)((double)listCount / listLimit + 0.9);
      
      startPage = (((int)((double)currentPage / pageLimit + 0.9)) - 1) * pageLimit + 1;
      
      endPage = startPage + pageLimit -1;

      if(maxPage < endPage) {
         endPage = maxPage;
      }
      
      pi = new PageInfo(currentPage, listLimit, pageLimit, startPage, endPage, listCount, maxPage);
      
      return pi;
   }
}