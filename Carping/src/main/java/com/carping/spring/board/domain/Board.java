package com.carping.spring.board.domain;

import java.sql.Date;

public class Board {
	private int boardKey;
	private String boardTitle;
	private String boardContent;
	private Date boardEnrollDate;
	private Date boardModifyDate;
	private int boardCount;
	private String memberId;
	
	public Board() {
		
	}

	public Board(int boardKey, String boardTitle, String boardContent, Date boardEnrollDate, Date boardModifyDate,
			int boardCount, String memberId) {
		super();
		this.boardKey = boardKey;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardEnrollDate = boardEnrollDate;
		this.boardModifyDate = boardModifyDate;
		this.boardCount = boardCount;
		this.memberId = memberId;
	}

	public int getBoardKey() {
		return boardKey;
	}

	public void setBoardKey(int boardKey) {
		this.boardKey = boardKey;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public Date getBoardEnrollDate() {
		return boardEnrollDate;
	}

	public void setBoardEnrollDate(Date boardEnrollDate) {
		this.boardEnrollDate = boardEnrollDate;
	}

	public Date getBoardModifyDate() {
		return boardModifyDate;
	}

	public void setBoardModifyDate(Date boardModifyDate) {
		this.boardModifyDate = boardModifyDate;
	}

	public int getBoardCount() {
		return boardCount;
	}

	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "Board [boardKey=" + boardKey + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", boardEnrollDate=" + boardEnrollDate + ", boardModifyDate=" + boardModifyDate + ", boardCount="
				+ boardCount + ", memberId=" + memberId + "]";
	}
	
	
}
