package com.carping.spring.place.domain;

public class Place {
	private int placeKey;
	private String placeName;
	private String placeAddress;
	private String placeGeoCode;
	private String placeGS25;
	private String placeToilet;
	private String placeParking;
	private String placeImage;
	private String placeEtc;
	private double scoreAvg;
	
	public Place() {
		
	}

	public Place(int placeKey, String placeName, String placeAddress, String placeGeoCode, String placeGS25,
			String placeToilet, String placeParking, String placeImage, String placeEtc, double scoreAvg) {
		super();
		this.placeKey = placeKey;
		this.placeName = placeName;
		this.placeAddress = placeAddress;
		this.placeGeoCode = placeGeoCode;
		this.placeGS25 = placeGS25;
		this.placeToilet = placeToilet;
		this.placeParking = placeParking;
		this.placeImage = placeImage;
		this.placeEtc = placeEtc;
		this.scoreAvg = scoreAvg;
	}



	public int getPlaceKey() {
		return placeKey;
	}

	public void setPlaceKey(int placeKey) {
		this.placeKey = placeKey;
	}

	public String getPlaceName() {
		return placeName;
	}

	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}

	public String getPlaceAddress() {
		return placeAddress;
	}

	public void setPlaceAddress(String placeAddress) {
		this.placeAddress = placeAddress;
	}

	public String getPlaceGeoCode() {
		return placeGeoCode;
	}

	public void setPlaceGeoCode(String placeGeoCode) {
		this.placeGeoCode = placeGeoCode;
	}

	public String getPlaceGS25() {
		return placeGS25;
	}

	public void setPlaceGS25(String placeGS25) {
		this.placeGS25 = placeGS25;
	}

	public String getPlaceToilet() {
		return placeToilet;
	}

	public void setPlaceToilet(String placeToilet) {
		this.placeToilet = placeToilet;
	}

	public String getPlaceParking() {
		return placeParking;
	}

	public void setPlaceParking(String placeParking) {
		this.placeParking = placeParking;
	}

	public String getPlaceImage() {
		return placeImage;
	}

	public void setPlaceImage(String placeImage) {
		this.placeImage = placeImage;
	}

	public String getPlaceEtc() {
		return placeEtc;
	}

	public void setPlaceEtc(String placeEtc) {
		this.placeEtc = placeEtc;
	}

	public double getScoreAvg() {
		return scoreAvg;
	}

	public void setScoreAvg(double scoreAvg) {
		this.scoreAvg = scoreAvg;
	}

	@Override
	public String toString() {
		return "Place [placeKey=" + placeKey + ", placeName=" + placeName + ", placeAddress=" + placeAddress
				+ ", placeGeoCode=" + placeGeoCode + ", placeGS25=" + placeGS25 + ", placeToilet=" + placeToilet
				+ ", placeParking=" + placeParking + ", placeImage=" + placeImage + ", placeEtc=" + placeEtc
				+ ", scoreAvg=" + scoreAvg + "]";
	}
	
}
