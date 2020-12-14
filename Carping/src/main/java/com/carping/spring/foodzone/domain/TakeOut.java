package com.carping.spring.foodzone.domain;

public class TakeOut {
	private int takeOutKey;
	private int foodZoneKey;
	private String takeOutMenu;
	private int takeOutMenuPrice;
	private String takeOutMenuPhoto;
	
	public TakeOut() {
		// TODO Auto-generated constructor stub
	}

	public TakeOut(int takeOutKey, int foodZoneKey, String takeOutMenu, int takeOutMenuPrice, String takeOutMenuPhoto) {
		super();
		this.takeOutKey = takeOutKey;
		this.foodZoneKey = foodZoneKey;
		this.takeOutMenu = takeOutMenu;
		this.takeOutMenuPrice = takeOutMenuPrice;
		this.takeOutMenuPhoto = takeOutMenuPhoto;
	}

	public int getTakeOutKey() {
		return takeOutKey;
	}

	public void setTakeOutKey(int takeOutKey) {
		this.takeOutKey = takeOutKey;
	}

	public int getFoodZoneKey() {
		return foodZoneKey;
	}

	public void setFoodZoneKey(int foodZoneKey) {
		this.foodZoneKey = foodZoneKey;
	}

	public String getTakeOutMenu() {
		return takeOutMenu;
	}

	public void setTakeOutMenu(String takeOutMenu) {
		this.takeOutMenu = takeOutMenu;
	}

	public int getTakeOutMenuPrice() {
		return takeOutMenuPrice;
	}

	public void setTakeOutMenuPrice(int takeOutMenuPrice) {
		this.takeOutMenuPrice = takeOutMenuPrice;
	}

	public String getTakeOutMenuPhoto() {
		return takeOutMenuPhoto;
	}

	public void setTakeOutMenuPhoto(String takeOutMenuPhoto) {
		this.takeOutMenuPhoto = takeOutMenuPhoto;
	}

	@Override
	public String toString() {
		return "TakeOut [takeOutKey=" + takeOutKey + ", foodZoneKey=" + foodZoneKey + ", takeOutMenu=" + takeOutMenu
				+ ", takeOutMenuPrice=" + takeOutMenuPrice + ", takeOutMenuPhoto=" + takeOutMenuPhoto + "]";
	}
	
	
}
