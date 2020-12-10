package com.carping.spring.area.domain;

public class Area {
	private int areaKey;
	private String areaName;
	private String areaAddress;
	private String areaGeoCode;
	private int areaGS25;
	private int areaToilet;
	private int areaSink;
	private int areaPool;
	private String areaImage;
	private String areaEtc;
	private int foodZoneKey;
	private int placeKey;
	private double scoreAvg;
	
	public Area() {
		
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

	public String getAreaGeoCode() {
		return areaGeoCode;
	}

	public void setAreaGeoCode(String areaGeoCode) {
		this.areaGeoCode = areaGeoCode;
	}

	public int getAreaGS25() {
		return areaGS25;
	}

	public void setAreaGS25(int areaGS25) {
		this.areaGS25 = areaGS25;
	}

	public int getAreaToilet() {
		return areaToilet;
	}

	public void setAreaToilet(int areaToilet) {
		this.areaToilet = areaToilet;
	}

	public int getAreaSink() {
		return areaSink;
	}

	public void setAreaSink(int areaSink) {
		this.areaSink = areaSink;
	}

	public int getAreaPool() {
		return areaPool;
	}

	public void setAreaPool(int areaPool) {
		this.areaPool = areaPool;
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

	public void setScoreAvg(double scoreAvg) {
		this.scoreAvg = scoreAvg;
	}

	public Area(int areaKey, String areaName, String areaAddress, String areaGeoCode, int areaGS25, int areaToilet,
			int areaSink, int areaPool, String areaImage, String areaEtc, int foodZoneKey, int placeKey,
			double scoreAvg) {
		super();
		this.areaKey = areaKey;
		this.areaName = areaName;
		this.areaAddress = areaAddress;
		this.areaGeoCode = areaGeoCode;
		this.areaGS25 = areaGS25;
		this.areaToilet = areaToilet;
		this.areaSink = areaSink;
		this.areaPool = areaPool;
		this.areaImage = areaImage;
		this.areaEtc = areaEtc;
		this.foodZoneKey = foodZoneKey;
		this.placeKey = placeKey;
		this.scoreAvg = scoreAvg;
	}

	@Override
	public String toString() {
		return "Area [areaKey=" + areaKey + ", areaName=" + areaName + ", areaAddress=" + areaAddress + ", areaGeoCode="
				+ areaGeoCode + ", areaGS25=" + areaGS25 + ", areaToilet=" + areaToilet + ", areaSink=" + areaSink
				+ ", areaPool=" + areaPool + ", areaImage=" + areaImage + ", areaEtc=" + areaEtc + ", foodZoneKey="
				+ foodZoneKey + ", placeKey=" + placeKey + ", scoreAvg=" + scoreAvg + "]";
	}

	
	
	
}
