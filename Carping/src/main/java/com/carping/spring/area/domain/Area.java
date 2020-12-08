package com.carping.spring.area.domain;

public class Area {
	private int areaKey;
	private String areaName;
	private String areaAddress;
	private String areaXCode;
	private String areaYCode;
	private String areaGS25;
	private String areaImage;
	private String areaEtc;
	private int foodZoneKey;
	private int placeKey;
	private double scoreAvg;
	
	public Area() {
		
	}

	public Area(int areaKey, String areaName, String areaAddress, String areaXCode, String areaYCode, String areaGS25,
			String areaImage, String areaEtc, int foodZoneKey, int placeKey, double scoreAvg) {
		super();
		this.areaKey = areaKey;
		this.areaName = areaName;
		this.areaAddress = areaAddress;
		this.areaXCode = areaXCode;
		this.areaYCode = areaYCode;
		this.areaGS25 = areaGS25;
		this.areaImage = areaImage;
		this.areaEtc = areaEtc;
		this.foodZoneKey = foodZoneKey;
		this.placeKey = placeKey;
		this.scoreAvg = scoreAvg;
	}

	public int getAreaKey() {
		return areaKey;
	}

	public void setAreaKey(int areaKey) {
		this.areaKey = areaKey;
	}

	public String getAreaName() {
		return areaName;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}

	public String getAreaAddress() {
		return areaAddress;
	}

	public void setAreaAddress(String areaAddress) {
		this.areaAddress = areaAddress;
	}

	public String getAreaXCode() {
		return areaXCode;
	}

	public void setAreaXCode(String areaXCode) {
		this.areaXCode = areaXCode;
	}

	public String getAreaYCode() {
		return areaYCode;
	}

	public void setAreaYCode(String areaYCode) {
		this.areaYCode = areaYCode;
	}

	public String getAreaGS25() {
		return areaGS25;
	}

	public void setAreaGS25(String areaGS25) {
		this.areaGS25 = areaGS25;
	}

	public String getAreaImage() {
		return areaImage;
	}

	public void setAreaImage(String areaImage) {
		this.areaImage = areaImage;
	}

	public String getAreaEtc() {
		return areaEtc;
	}

	public void setAreaEtc(String areaEtc) {
		this.areaEtc = areaEtc;
	}

	public int getFoodZoneKey() {
		return foodZoneKey;
	}

	public void setFoodZoneKey(int foodZoneKey) {
		this.foodZoneKey = foodZoneKey;
	}

	public int getPlaceKey() {
		return placeKey;
	}

	public void setPlaceKey(int placeKey) {
		this.placeKey = placeKey;
	}

	public double getScoreAvg() {
		return scoreAvg;
	}

	public void setScoreAvg(int scoreAvg) {
		this.scoreAvg = scoreAvg;
	}

	@Override
	public String toString() {
		return "Area [areaKey=" + areaKey + ", areaName=" + areaName + ", areaAddress=" + areaAddress + ", areaXCode="
				+ areaXCode + ", areaYCode=" + areaYCode + ", areaGS25=" + areaGS25 + ", areaImage=" + areaImage
				+ ", areaEtc=" + areaEtc + ", foodZoneKey=" + foodZoneKey + ", placeKey=" + placeKey + ", scoreAvg="
				+ scoreAvg + "]";
	}
	
	
	
}
