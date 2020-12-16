package com.carping.spring.area.domain;

public class BoardSearch {
	
	private String searchCondition;
	private String searchValue;
	private int areaKey;
	
	public BoardSearch() {}

	public BoardSearch(String searchCondition, String searchValue, int areaKey) {
		super();
		this.searchCondition = searchCondition;
		this.searchValue = searchValue;
		this.areaKey = areaKey;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}

	public int getAreaKey() {
		return areaKey;
	}

	public void setAreaKey(int areaKey) {
		this.areaKey = areaKey;
	}

	@Override
	public String toString() {
		return "BoardSearch [searchCondition=" + searchCondition + ", searchValue=" + searchValue + ", areaKey="
				+ areaKey + "]";
	}

	
	
	
}
