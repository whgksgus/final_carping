package com.carping.spring.area.domain;

import java.sql.Date;

public class AreaReview {
	private int arKey;
	private int areaKey;
	private String arTitle;
	private String arContent;
	private int arScore;
	private Date arRegDate;
	private int arHits;
	private String arPhoto;
	private String memberId; 
	
	public AreaReview() {
		
	}

	public int getArKey() {
		return arKey;
	}

	public void setArKey(int arKey) {
		this.arKey = arKey;
	}

	public int getAreaKey() {
		return areaKey;
	}

	public void setAreaKey(int areaKey) {
		this.areaKey = areaKey;
	}

	public String getArTitle() {
		return arTitle;
	}

	public void setArTitle(String arTitle) {
		this.arTitle = arTitle;
	}

	public String getArContent() {
		return arContent;
	}

	public void setArContent(String arContent) {
		this.arContent = arContent;
	}

	public int getArScore() {
		return arScore;
	}

	public void setArScore(int arScore) {
		this.arScore = arScore;
	}

	public Date getArRegDate() {
		return arRegDate;
	}

	public void setArRegDate(Date arRegDate) {
		this.arRegDate = arRegDate;
	}

	public int getArHits() {
		return arHits;
	}

	public void setArHits(int arHits) {
		this.arHits = arHits;
	}

	public String getArPhoto() {
		return arPhoto;
	}

	public void setArPhoto(String arPhoto) {
		this.arPhoto = arPhoto;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public AreaReview(int arKey, int areaKey, String arTitle, String arContent, int arScore, Date arRegDate, int arHits,
			String arPhoto, String memberId) {
		super();
		this.arKey = arKey;
		this.areaKey = areaKey;
		this.arTitle = arTitle;
		this.arContent = arContent;
		this.arScore = arScore;
		this.arRegDate = arRegDate;
		this.arHits = arHits;
		this.arPhoto = arPhoto;
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "AreaReview [arKey=" + arKey + ", areaKey=" + areaKey + ", arTitle=" + arTitle + ", arContent="
				+ arContent + ", arScore=" + arScore + ", arRegDate=" + arRegDate + ", arHits=" + arHits + ", arPhoto="
				+ arPhoto + ", memberId=" + memberId + "]";
	}

	
	
	
}
