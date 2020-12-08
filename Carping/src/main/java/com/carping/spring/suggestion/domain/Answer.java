package com.carping.spring.suggestion.domain;

import java.sql.Date;

public class Answer {
	private int answerKey;
	private String answerTitle;
	private String answerContent;
	private Date answerEnrollDate;
	private int suggestionKey;
	
	public Answer() {
		
	}

	public Answer(int answerKey, String answerTitle, String answerContent, Date answerEnrollDate, int suggestionKey) {
		super();
		this.answerKey = answerKey;
		this.answerTitle = answerTitle;
		this.answerContent = answerContent;
		this.answerEnrollDate = answerEnrollDate;
		this.suggestionKey = suggestionKey;
	}

	public int getAnswerKey() {
		return answerKey;
	}

	public void setAnswerKey(int answerKey) {
		this.answerKey = answerKey;
	}

	public String getAnswerTitle() {
		return answerTitle;
	}

	public void setAnswerTitle(String answerTitle) {
		this.answerTitle = answerTitle;
	}

	public String getAnswerContent() {
		return answerContent;
	}

	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}

	public Date getAnswerEnrollDate() {
		return answerEnrollDate;
	}

	public void setAnswerEnrollDate(Date answerEnrollDate) {
		this.answerEnrollDate = answerEnrollDate;
	}

	public int getSuggestionKey() {
		return suggestionKey;
	}

	public void setSuggestionKey(int suggestionKey) {
		this.suggestionKey = suggestionKey;
	}

	@Override
	public String toString() {
		return "Answer [answerKey=" + answerKey + ", answerTitle=" + answerTitle + ", answerContent=" + answerContent
				+ ", answerEnrollDate=" + answerEnrollDate + ", suggestionKey=" + suggestionKey + "]";
	}
	
	
}
