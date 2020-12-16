package com.carping.spring.member.domain;

public class FindPw {

	private String memberId;
	private String email;
	
	public FindPw() {}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public FindPw(String memberId, String email) {
		super();
		this.memberId = memberId;
		this.email = email;
	}
	
	
	
	
}
