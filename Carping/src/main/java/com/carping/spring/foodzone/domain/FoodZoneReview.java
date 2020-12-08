package com.carping.spring.foodzone.domain;

import java.sql.Date;

public class FoodZoneReview {
	private int frKey;
	private int foodZoneKey;
	private String frScore;
	private String frTitle;
	private String frContent;
	private Date frRegDate;
	private int frHits;
	private String frPhoto;
	private String memberId;
	
	public FoodZoneReview() {
		
	}

	public FoodZoneReview(int frKey, int foodZoneKey, String frScore, String frTitle, String frContent, Date frRegDate,
			int frHits, String frPhoto, String memberId) {
		super();
		this.frKey = frKey;
		this.foodZoneKey = foodZoneKey;
		this.frScore = frScore;
		this.frTitle = frTitle;
		this.frContent = frContent;
		this.frRegDate = frRegDate;
		this.frHits = frHits;
		this.frPhoto = frPhoto;
		this.memberId = memberId;
	}

	public int getFrKey() {
		return frKey;
	}

	public void setFrKey(int frKey) {
		this.frKey = frKey;
	}

	public int getFoodZoneKey() {
		return foodZoneKey;
	}

	public void setFoodZoneKey(int foodZoneKey) {
		this.foodZoneKey = foodZoneKey;
	}

	public String getFrScore() {
		return frScore;
	}

	public void setFrScore(String frScore) {
		this.frScore = frScore;
	}

	public String getFrTitle() {
		return frTitle;
	}

	public void setFrTitle(String frTitle) {
		this.frTitle = frTitle;
	}

	public String getFrContent() {
		return frContent;
	}

	public void setFrContent(String frContent) {
		this.frContent = frContent;
	}

	public Date getFrRegDate() {
		return frRegDate;
	}

	public void setFrRegDate(Date frRegDate) {
		this.frRegDate = frRegDate;
	}

	public int getFrHits() {
		return frHits;
	}

	public void setFrHits(int frHits) {
		this.frHits = frHits;
	}

	public String getFrPhoto() {
		return frPhoto;
	}

	public void setFrPhoto(String frPhoto) {
		this.frPhoto = frPhoto;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "FoodZoneReview [frKey=" + frKey + ", foodZoneKey=" + foodZoneKey + ", frScore=" + frScore + ", frTitle="
				+ frTitle + ", frContent=" + frContent + ", frRegDate=" + frRegDate + ", frHits=" + frHits
				+ ", frPhoto=" + frPhoto + ", memberId=" + memberId + "]";
	}
	
	
	
}
