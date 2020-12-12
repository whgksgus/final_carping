package com.carping.spring.place.domain;

import java.sql.Date;

public class PlaceReview {
	private int prKey;
	private int placeKey;
	private int prScore;
	private String prTitle;
	private String prContent;
	private Date prRegDate;
	private int prHits;
	private String prPhoto;
	private String memberId;
	
	public PlaceReview() {}

	public PlaceReview(int prKey, int placeKey, int prScore, String prTitle, String prContent, Date prRegDate,
			int prHits, String prPhoto, String memberId) {
		super();
		this.prKey = prKey;
		this.placeKey = placeKey;
		this.prScore = prScore;
		this.prTitle = prTitle;
		this.prContent = prContent;
		this.prRegDate = prRegDate;
		this.prHits = prHits;
		this.prPhoto = prPhoto;
		this.memberId = memberId;
	}

	public int getPrKey() {
		return prKey;
	}

	public void setPrKey(int prKey) {
		this.prKey = prKey;
	}

	public int getPlaceKey() {
		return placeKey;
	}

	public void setPlaceKey(int placeKey) {
		this.placeKey = placeKey;
	}

	public int getPrScore() {
		return prScore;
	}

	public void setPrScore(int prScore) {
		this.prScore = prScore;
	}

	public String getPrTitle() {
		return prTitle;
	}

	public void setPrTitle(String prTitle) {
		this.prTitle = prTitle;
	}

	public String getPrContent() {
		return prContent;
	}

	public void setPrContent(String prContent) {
		this.prContent = prContent;
	}

	public Date getPrRegDate() {
		return prRegDate;
	}

	public void setPrRegDate(Date prRegDate) {
		this.prRegDate = prRegDate;
	}

	public int getPrHits() {
		return prHits;
	}

	public void setPrHits(int prHits) {
		this.prHits = prHits;
	}

	public String getPrPhoto() {
		return prPhoto;
	}

	public void setPrPhoto(String prPhoto) {
		this.prPhoto = prPhoto;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "PlaceReview [prKey=" + prKey + ", placeKey=" + placeKey + ", prScore=" + prScore + ", prTitle="
				+ prTitle + ", prContent=" + prContent + ", prRegDate=" + prRegDate + ", prHits=" + prHits
				+ ", prPhoto=" + prPhoto + ", memberId=" + memberId + "]";
	}
	
	

	}
