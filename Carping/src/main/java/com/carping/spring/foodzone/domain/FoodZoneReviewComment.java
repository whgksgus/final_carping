 package com.carping.spring.foodzone.domain;

import java.sql.Date;

public class FoodZoneReviewComment {
	private int frcKey;
	private String frcContent;
	private int frKey;
	private String frcWriter;
	private Date frcRegDate;
	
	public FoodZoneReviewComment() {
		
	}

	public FoodZoneReviewComment(int frcKey, String frcContent, int frKey, String frcWriter, Date frcRegDate) {
		super();
		this.frcKey = frcKey;
		this.frcContent = frcContent;
		this.frKey = frKey;
		this.frcWriter = frcWriter;
		this.frcRegDate = frcRegDate;
	}

	public int getFrcKey() {
		return frcKey;
	}

	public void setFrcKey(int frcKey) {
		this.frcKey = frcKey;
	}

	public String getFrcContent() {
		return frcContent;
	}

	public void setFrcContent(String frcContent) {
		this.frcContent = frcContent;
	}

	public int getFrKey() {
		return frKey;
	}

	public void setFrKey(int frKey) {
		this.frKey = frKey;
	}

	public String getFrcWriter() {
		return frcWriter;
	}

	public void setFrcWriter(String frcWriter) {
		this.frcWriter = frcWriter;
	}

	public Date getFrcRegDate() {
		return frcRegDate;
	}

	public void setFrcRegDate(Date frcRegDate) {
		this.frcRegDate = frcRegDate;
	}

	@Override
	public String toString() {
		return "FoodZoneReviewComment [frcKey=" + frcKey + ", frcContent=" + frcContent + ", frKey=" + frKey
				+ ", frcWriter=" + frcWriter + ", frcRegDate=" + frcRegDate + "]";
	}
	
	
	
}
