package com.carping.spring.foodzone.domain;

public class FoodZone {
	private int foodZoneKey;
	private String foodZoneName;
	private String foodZoneAddress;
	private String foodZoneGeoCode;
	private String foodZonePhone;
	private String foodZoneImage;
	private String foodZoneEtc;
	private double scoreAvg;
	
	public FoodZone() {
		
	}

	public FoodZone(int foodZoneKey, String foodZoneName, String foodZoneAddress, String foodZoneGeoCode,
			String foodZonePhone, String foodZoneImage, String foodZoneEtc, double scoreAvg) {
		super();
		this.foodZoneKey = foodZoneKey;
		this.foodZoneName = foodZoneName;
		this.foodZoneAddress = foodZoneAddress;
		this.foodZoneGeoCode = foodZoneGeoCode;
		this.foodZonePhone = foodZonePhone;
		this.foodZoneImage = foodZoneImage;
		this.foodZoneEtc = foodZoneEtc;
		this.scoreAvg = scoreAvg;
	}

	public int getFoodZoneKey() {
		return foodZoneKey;
	}

	public void setFoodZoneKey(int foodZoneKey) {
		this.foodZoneKey = foodZoneKey;
	}

	public String getFoodZoneName() {
		return foodZoneName;
	}

	public void setFoodZoneName(String foodZoneName) {
		this.foodZoneName = foodZoneName;
	}

	public String getFoodZoneAddress() {
		return foodZoneAddress;
	}

	public void setFoodZoneAddress(String foodZoneAddress) {
		this.foodZoneAddress = foodZoneAddress;
	}

	public String getFoodZoneGeoCode() {
		return foodZoneGeoCode;
	}

	public void setFoodZoneGeoCode(String foodZoneGeoCode) {
		this.foodZoneGeoCode = foodZoneGeoCode;
	}

	public String getFoodZonePhone() {
		return foodZonePhone;
	}

	public void setFoodZonePhone(String foodZonePhone) {
		this.foodZonePhone = foodZonePhone;
	}

	public String getFoodZoneImage() {
		return foodZoneImage;
	}

	public void setFoodZoneImage(String foodZoneImage) {
		this.foodZoneImage = foodZoneImage;
	}

	public String getFoodZoneEtc() {
		return foodZoneEtc;
	}

	public void setFoodZoneEtc(String foodZoneEtc) {
		this.foodZoneEtc = foodZoneEtc;
	}

	public double getScoreAvg() {
		return scoreAvg;
	}

	public void setScoreAvg(double scoreAvg) {
		this.scoreAvg = scoreAvg;
	}

	@Override
	public String toString() {
		return "FoodZone [foodZoneKey=" + foodZoneKey + ", foodZoneName=" + foodZoneName + ", foodZoneAddress="
				+ foodZoneAddress + ", foodZoneGeoCode=" + foodZoneGeoCode + ", foodZonePhone=" + foodZonePhone
				+ ", foodZoneImage=" + foodZoneImage + ", foodZoneEtc=" + foodZoneEtc + ", scoreAvg=" + scoreAvg + "]";
	}


	
	
}
