package com.carping.spring.foodzone.domain;

public class BoardSearch {
	private String searchCondition;
	private String searchValue;
	private int foodZoneKey;
	
	public BoardSearch() {
		// TODO Auto-generated constructor stub
	}

	public BoardSearch(String searchCondition, String searchValue, int foodZoneKey) {
		super();
		this.searchCondition = searchCondition;
		this.searchValue = searchValue;
		this.foodZoneKey = foodZoneKey;
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

	public int getFoodZoneKey() {
		return foodZoneKey;
	}

	public void setFoodZoneKey(int foodZoneKey) {
		this.foodZoneKey = foodZoneKey;
	}

	@Override
	public String toString() {
		return "BoardSearch [searchCondition=" + searchCondition + ", searchValue=" + searchValue + ", foodZoneKey="
				+ foodZoneKey + "]";
	}
	
}
