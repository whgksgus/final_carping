package com.carping.spring.area.domain;

import java.sql.Date;

public class AreaReview {
	private int arKey;
	private String arTitle;
	private String arContent;
	private int arScore;
	private Date arRegDate;
	private int arHits;
	private String arPhoto;
	private int areaKey;
	
	public AreaReview() {
		
	}

	public AreaReview(int arKey, String arTitle, String arContent, int arScore, Date arRegDate, int arHits,
			String arPhoto, int areaKey) {
		super();
		this.arKey = arKey;
		this.arTitle = arTitle;
		this.arContent = arContent;
		this.arScore = arScore;
		this.arRegDate = arRegDate;
		this.arHits = arHits;
		this.arPhoto = arPhoto;
		this.areaKey = areaKey;
	}

	public int getArKey() {
		return arKey;
	}

	public void setArKey(int arKey) {
		this.arKey = arKey;
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

	public int getAreaKey() {
		return areaKey;
	}

	public void setAreaKey(int areaKey) {
		this.areaKey = areaKey;
	}

	@Override
	public String toString() {
		return "AreaReview [arKey=" + arKey + ", arTitle=" + arTitle + ", arContent=" + arContent + ", arScore="
				+ arScore + ", arRegDate=" + arRegDate + ", arHits=" + arHits + ", arPhoto=" + arPhoto + ", areaKey="
				+ areaKey + "]";
	}
	
	
	
}
