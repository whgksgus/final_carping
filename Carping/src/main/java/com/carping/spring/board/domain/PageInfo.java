package com.carping.spring.board.domain;

public class PageInfo {
	private int currentPage;
	private int ListLimit;
	private int pageLimit;
	private int startPage;
	private int endPage;
	private int listCount;
	private int maxPage;
	
	public PageInfo() {
		// TODO Auto-generated constructor stub
	}

	public PageInfo(int currentPage, int listLimit, int pageLimit, int startPage, int endPage, int listCount,
			int maxPage) {
		super();
		this.currentPage = currentPage;
		ListLimit = listLimit;
		this.pageLimit = pageLimit;
		this.startPage = startPage;
		this.endPage = endPage;
		this.listCount = listCount;
		this.maxPage = maxPage;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getListLimit() {
		return ListLimit;
	}

	public void setListLimit(int listLimit) {
		ListLimit = listLimit;
	}

	public int getPageLimit() {
		return pageLimit;
	}

	public void setPageLimit(int pageLimit) {
		this.pageLimit = pageLimit;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	@Override
	public String toString() {
		return "PageInfo [currentPage=" + currentPage + ", ListLimit=" + ListLimit + ", pageLimit=" + pageLimit
				+ ", startPage=" + startPage + ", endPage=" + endPage + ", listCount=" + listCount + ", maxPage="
				+ maxPage + "]";
	}
	
	
}
