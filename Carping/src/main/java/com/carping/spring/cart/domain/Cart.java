 package com.carping.spring.cart.domain;

import java.sql.Date;

public class Cart {
	private int cartKey;
	private int cartQuantity;
	private String cartStatus;
	private int itemKey;
	private Date cartOrderDate;
	private String memberId;

	public Cart() {
		
	}
	
	public Cart(int cartQuantity, int itemKey, String memberId) {
		super();
		this.cartQuantity = cartQuantity;
		this.itemKey = itemKey;
		this.memberId = memberId;
	}

	public Cart(int cartKey, int cartQuantity, String cartStatus, int itemKey, Date cartOrderDate, String memberId) {
		super();
		this.cartKey = cartKey;
		this.cartQuantity = cartQuantity;
		this.cartStatus = cartStatus;
		this.itemKey = itemKey;
		this.cartOrderDate = cartOrderDate;
		this.memberId = memberId;
	}

	public int getCartKey() {
		return cartKey;
	}

	public void setCartKey(int cartKey) {
		this.cartKey = cartKey;
	}

	public int getCartQuantity() {
		return cartQuantity;
	}

	public void setCartQuantity(int cartQuantity) {
		this.cartQuantity = cartQuantity;
	}

	public String getCartStatus() {
		return cartStatus;
	}

	public void setCartStatus(String cartStatus) {
		this.cartStatus = cartStatus;
	}

	public int getItemKey() {
		return itemKey;
	}

	public void setItemKey(int itemKey) {
		this.itemKey = itemKey;
	}

	public Date getCartOrderDate() {
		return cartOrderDate;
	}

	public void setCartOrderDate(Date cartOrderDate) {
		this.cartOrderDate = cartOrderDate;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "Cart [cartKey=" + cartKey + ", cartQuantity=" + cartQuantity + ", cartStatus=" + cartStatus
				+ ", itemKey=" + itemKey + ", cartOrderDate=" + cartOrderDate + ", memberId=" + memberId + "]";
	}
	
	
	
}
