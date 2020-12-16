package com.carping.spring.foodzone.domain;

import java.sql.Date;

public class TakeOutReserve {
	private int torKey;
	private String memberId;
	private int takeOutKey;
	private int foodZoneKey;
	private int torEa;
	private int torPrice;
	private String torRegDate;
	private int torTotalPrice;
	
	
	public TakeOutReserve() {
		// TODO Auto-generated constructor stub
	}


	public TakeOutReserve(int torKey, String memberId, int takeOutKey, int foodZoneKey, int torEa, int torPrice,
			String torRegDate, int torTotalPrice) {
		super();
		this.torKey = torKey;
		this.memberId = memberId;
		this.takeOutKey = takeOutKey;
		this.foodZoneKey = foodZoneKey;
		this.torEa = torEa;
		this.torPrice = torPrice;
		this.torRegDate = torRegDate;
		this.torTotalPrice = torTotalPrice;
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


	public int getFoodZoneKey() {
		return foodZoneKey;
	}


	public void setFoodZoneKey(int foodZoneKey) {
		this.foodZoneKey = foodZoneKey;
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


	public String getTorRegDate() {
		return torRegDate;
	}


	public void setTorRegDate(String torRegDate) {
		this.torRegDate = torRegDate;
	}


	public int getTorTotalPrice() {
		return torTotalPrice;
	}


	public void setTorTotalPrice(int torTotalPrice) {
		this.torTotalPrice = torTotalPrice;
	}


	@Override
	public String toString() {
		return "TakeOutReserve [torKey=" + torKey + ", memberId=" + memberId + ", takeOutKey=" + takeOutKey
				+ ", foodZoneKey=" + foodZoneKey + ", torEa=" + torEa + ", torPrice=" + torPrice + ", torRegDate="
				+ torRegDate + ", torTotalPrice=" + torTotalPrice + "]";
	}


}
