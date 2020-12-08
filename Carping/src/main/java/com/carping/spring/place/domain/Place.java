package com.carping.spring.place.domain;

public class Place {
	private int placeKey;
	private String placeName;
	private String placeAddress;
	private String placeXCode;
	private String placeYCode;
	private String placeGS25;
	private String placeImage;
	private String placeEtc;
	private double scoreAvg;
	
	public Place() {
		
	}

	public Place(int placeKey, String placeName, String placeAddress, String placeXCode, String placeYCode,
			String placeGS25, String placeImage, String placeEtc, double scoreAvg) {
		super();
		this.placeKey = placeKey;
		this.placeName = placeName;
		this.placeAddress = placeAddress;
		this.placeXCode = placeXCode;
		this.placeYCode = placeYCode;
		this.placeGS25 = placeGS25;
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

	public String getPlaceXCode() {
		return placeXCode;
	}

	public void setPlaceXCode(String placeXCode) {
		this.placeXCode = placeXCode;
	}

	public String getPlaceYCode() {
		return placeYCode;
	}

	public void setPlaceYCode(String placeYCode) {
		this.placeYCode = placeYCode;
	}

	public String getPlaceGS25() {
		return placeGS25;
	}

	public void setPlaceGS25(String placeGS25) {
		this.placeGS25 = placeGS25;
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
				+ ", placeXCode=" + placeXCode + ", placeYCode=" + placeYCode + ", placeGS25=" + placeGS25
				+ ", placeImage=" + placeImage + ", placeEtc=" + placeEtc + ", scoreAvg=" + scoreAvg + "]";
	}
	
	
	
}
