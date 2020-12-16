package com.carping.spring.member.domain;

public class FindId {

	private String memberName;
	private String phone;
	
	
	public FindId() {}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public FindId(String memberName, String phone) {
		super();
		this.memberName = memberName;
		this.phone = phone;
	}
	
	
	
}
