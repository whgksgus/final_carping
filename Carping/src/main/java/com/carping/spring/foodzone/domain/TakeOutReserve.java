package com.carping.spring.foodzone.domain;

import java.sql.Date;

public class TakeOutReserve {
	private int torKey;
	private String memberId;
	private int takeOutKey;
	private int torEa;
	private int torPrice;
	private Date torRegDate;
	private String torTime;
	
	public TakeOutReserve() {
		// TODO Auto-generated constructor stub
	}

	public TakeOutReserve(int torKey, String memberId, int takeOutKey, int torEa, int torPrice, Date torRegDate,
			String torTime) {
		super();
		this.torKey = torKey;
		this.memberId = memberId;
		this.takeOutKey = takeOutKey;
		this.torEa = torEa;
		this.torPrice = torPrice;
		this.torRegDate = torRegDate;
		this.torTime = torTime;
	}

	public int getTorKey() {
		return torKey;
	}

	public void setTorKey(int torKey) {
		this.torKey = torKey;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getTakeOutKey() {
		return takeOutKey;
	}

	public void setTakeOutKey(int takeOutKey) {
		this.takeOutKey = takeOutKey;
	}

	public int getTorEa() {
		return torEa;
	}

	public void setTorEa(int torEa) {
		this.torEa = torEa;
	}

	public int getTorPrice() {
		return torPrice;
	}

	public void setTorPrice(int torPrice) {
		this.torPrice = torPrice;
	}

	public Date getTorRegDate() {
		return torRegDate;
	}

	public void setTorRegDate(Date torRegDate) {
		this.torRegDate = torRegDate;
	}

	public String getTorTime() {
		return torTime;
	}

	public void setTorTime(String torTime) {
		this.torTime = torTime;
	}

	@Override
	public String toString() {
		return "TakeOutReserve [torKey=" + torKey + ", memberId=" + memberId + ", takeOutKey=" + takeOutKey + ", torEa="
				+ torEa + ", torPrice=" + torPrice + ", torRegDate=" + torRegDate + ", torTime=" + torTime + "]";
	}
	
}
