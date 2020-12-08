package com.carping.spring.board.domain;

import java.sql.Date;

public class BoardReply {
	private int brKey;
	private String brContent;
	private int boardKey;
	private String brWriter;
	private Date brRegDate;
	private String brStatus;
	
	public BoardReply() {
		
	}

	public BoardReply(int brKey, String brContent, int boardKey, String brWriter, Date brRegDate, String brStatus) {
		super();
		this.brKey = brKey;
		this.brContent = brContent;
		this.boardKey = boardKey;
		this.brWriter = brWriter;
		this.brRegDate = brRegDate;
		this.brStatus = brStatus;
	}

	public int getBrKey() {
		return brKey;
	}

	public void setBrKey(int brKey) {
		this.brKey = brKey;
	}

	public String getBrContent() {
		return brContent;
	}

	public void setBrContent(String brContent) {
		this.brContent = brContent;
	}

	public int getBoardKey() {
		return boardKey;
	}

	public void setBoardKey(int boardKey) {
		this.boardKey = boardKey;
	}

	public String getBrWriter() {
		return brWriter;
	}

	public void setBrWriter(String brWriter) {
		this.brWriter = brWriter;
	}

	public Date getBrRegDate() {
		return brRegDate;
	}

	public void setBrRegDate(Date brRegDate) {
		this.brRegDate = brRegDate;
	}

	public String getBrStatus() {
		return brStatus;
	}

	public void setBrStatus(String brStatus) {
		this.brStatus = brStatus;
	}

	@Override
	public String toString() {
		return "BoardReply [brKey=" + brKey + ", brContent=" + brContent + ", boardKey=" + boardKey + ", brWriter="
				+ brWriter + ", brRegDate=" + brRegDate + ", brStatus=" + brStatus + "]";
	}

	
	
}
