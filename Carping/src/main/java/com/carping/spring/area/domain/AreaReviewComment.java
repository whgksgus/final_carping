package com.carping.spring.area.domain;

import java.sql.Date;

public class AreaReviewComment {
	private int arcKey;
	private int arKey;
	private String arcContent;
	private String arcWriter;
	private Date arcRegDate;
	
	public AreaReviewComment() {
		
	}

	public AreaReviewComment(int arcKey, int arKey, String arcContent, String arcWriter, Date arcRegDate) {
		super();
		this.arcKey = arcKey;
		this.arKey = arKey;
		this.arcContent = arcContent;
		this.arcWriter = arcWriter;
		this.arcRegDate = arcRegDate;
	}

	public int getArcKey() {
		return arcKey;
	}

	public void setArcKey(int arcKey) {
		this.arcKey = arcKey;
	}

	public int getArKey() {
		return arKey;
	}

	public void setArKey(int arKey) {
		this.arKey = arKey;
	}

	public String getArcContent() {
		return arcContent;
	}

	public void setArcContent(String arcContent) {
		this.arcContent = arcContent;
	}

	public String getArcWriter() {
		return arcWriter;
	}

	public void setArcWriter(String arcWriter) {
		this.arcWriter = arcWriter;
	}

	public Date getArcRegDate() {
		return arcRegDate;
	}

	public void setArcRegDate(Date arcRegDate) {
		this.arcRegDate = arcRegDate;
	}

	@Override
	public String toString() {
		return "AreaReviewComment [arcKey=" + arcKey + ", arKey=" + arKey + ", arcContent=" + arcContent
				+ ", arcWriter=" + arcWriter + ", arcRegDate=" + arcRegDate + "]";
	}

		
	
	
}
