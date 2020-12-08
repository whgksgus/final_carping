 package com.carping.spring.place.domain;

import java.sql.Date;

public class PlaceReviewComment {
	private int prcKey;
	private String prcContent;
	private int prKey;
	private String prcWriter;
	private Date prcRegDate;
	
	public PlaceReviewComment() {
		
	}

	public PlaceReviewComment(int prcKey, String prcContent, int prKey, String prcWriter, Date prcRegDate) {
		super();
		this.prcKey = prcKey;
		this.prcContent = prcContent;
		this.prKey = prKey;
		this.prcWriter = prcWriter;
		this.prcRegDate = prcRegDate;
	}

	public int getPrcKey() {
		return prcKey;
	}

	public void setPrcKey(int prcKey) {
		this.prcKey = prcKey;
	}

	public String getPrcContent() {
		return prcContent;
	}

	public void setPrcContent(String prcContent) {
		this.prcContent = prcContent;
	}

	public int getPrKey() {
		return prKey;
	}

	public void setPrKey(int prKey) {
		this.prKey = prKey;
	}

	public String getPrcWriter() {
		return prcWriter;
	}

	public void setPrcWriter(String prcWriter) {
		this.prcWriter = prcWriter;
	}

	public Date getPrcRegDate() {
		return prcRegDate;
	}

	public void setPrcRegDate(Date prcRegDate) {
		this.prcRegDate = prcRegDate;
	}

	@Override
	public String toString() {
		return "PlaceReviewComment [prcKey=" + prcKey + ", prcContent=" + prcContent + ", prKey=" + prKey
				+ ", prcWriter=" + prcWriter + ", prcRegDate=" + prcRegDate + "]";
	}
	
	
	
}
