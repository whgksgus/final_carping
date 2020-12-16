package com.carping.spring.place.domain;

public class BoardSearch {
	
	private String searchCondition;
	private String searchValue;
	private int placeKey;
	
	public BoardSearch() {}

	public BoardSearch(String searchCondition, String searchValue, int placeKey) {
		super();
		this.searchCondition = searchCondition;
		this.searchValue = searchValue;
		this.placeKey = placeKey;
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

	public int getPlaceKey() {
		return placeKey;
	}

	public void setPlaceKey(int placeKey) {
		this.placeKey = placeKey;
	}

	@Override
	public String toString() {
		return "BoardSearch [searchCondition=" + searchCondition + ", searchValue=" + searchValue + ", placeKey="
				+ placeKey + "]";
	}

	
	
	
}
