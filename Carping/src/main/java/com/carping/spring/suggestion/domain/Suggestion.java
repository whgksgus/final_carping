package com.carping.spring.suggestion.domain;

import java.sql.Date;

public class Suggestion {
	private int suggestionKey;
	private String suggestionTitle;
	private String suggestionContent;
	private Date suggestionEnrollDate;
	private Date suggestionModifyDate;
	private int suggestionCount;
	private String memberId;
	private int answerCheck;
	
	public Suggestion() {
		
	}

	public Suggestion(int suggestionKey, String suggestionTitle, String suggestionContent, Date suggestionEnrollDate,
			Date suggestionModifyDate, int suggestionCount, String memberId, int answerCheck) {
		super();
		this.suggestionKey = suggestionKey;
		this.suggestionTitle = suggestionTitle;
		this.suggestionContent = suggestionContent;
		this.suggestionEnrollDate = suggestionEnrollDate;
		this.suggestionModifyDate = suggestionModifyDate;
		this.suggestionCount = suggestionCount;
		this.memberId = memberId;
		this.answerCheck = answerCheck;
	}

	public int getSuggestionKey() {
		return suggestionKey;
	}

	public void setSuggestionKey(int suggestionKey) {
		this.suggestionKey = suggestionKey;
	}

	public String getSuggestionTitle() {
		return suggestionTitle;
	}

	public void setSuggestionTitle(String suggestionTitle) {
		this.suggestionTitle = suggestionTitle;
	}

	public String getSuggestionContent() {
		return suggestionContent;
	}

	public void setSuggestionContent(String suggestionContent) {
		this.suggestionContent = suggestionContent;
	}

	public Date getSuggestionEnrollDate() {
		return suggestionEnrollDate;
	}

	public void setSuggestionEnrollDate(Date suggestionEnrollDate) {
		this.suggestionEnrollDate = suggestionEnrollDate;
	}

	public Date getSuggestionModifyDate() {
		return suggestionModifyDate;
	}

	public void setSuggestionModifyDate(Date suggestionModifyDate) {
		this.suggestionModifyDate = suggestionModifyDate;
	}

	public int getSuggestionCount() {
		return suggestionCount;
	}

	public void setSuggestionCount(int suggestionCount) {
		this.suggestionCount = suggestionCount;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getAnswerCheck() {
		return answerCheck;
	}

	public void setAnswerCheck(int answerCheck) {
		this.answerCheck = answerCheck;
	}

	@Override
	public String toString() {
		return "Suggestion [suggestionKey=" + suggestionKey + ", suggestionTitle=" + suggestionTitle
				+ ", suggestionContent=" + suggestionContent + ", suggestionEnrollDate=" + suggestionEnrollDate
				+ ", suggestionModifyDate=" + suggestionModifyDate + ", suggestionCount=" + suggestionCount
				+ ", memberId=" + memberId + ", answerCheck=" + answerCheck + "]";
	}
	
}
