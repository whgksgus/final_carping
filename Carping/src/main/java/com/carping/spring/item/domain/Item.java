package com.carping.spring.item.domain;

import java.sql.Date;

public class Item {
	private String itemImage;
	private String itemInfo;
	private int itemPrice;
	private String itemName;
	private int itemKey;
	private String itemCategory;
	private Date itemRegDate;
	
	public Item() {
	}

	public Item(String itemImage, String itemInfo, int itemPrice, String itemName, int itemKey, String itemCategory,
			Date itemRegDate) {
		super();
		this.itemImage = itemImage;
		this.itemInfo = itemInfo;
		this.itemPrice = itemPrice;
		this.itemName = itemName;
		this.itemKey = itemKey;
		this.itemCategory = itemCategory;
		this.itemRegDate = itemRegDate;
	}

	public String getItemImage() {
		return itemImage;
	}

	public void setItemImage(String itemImage) {
		this.itemImage = itemImage;
	}

	public String getItemInfo() {
		return itemInfo;
	}

	public void setItemInfo(String itemInfo) {
		this.itemInfo = itemInfo;
	}

	public int getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(int itemPrice) {
		this.itemPrice = itemPrice;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public int getItemKey() {
		return itemKey;
	}

	public void setItemKey(int itemKey) {
		this.itemKey = itemKey;
	}

	public String getItemCategory() {
		return itemCategory;
	}

	public void setItemCategory(String itemCategory) {
		this.itemCategory = itemCategory;
	}

	public Date getItemRegDate() {
		return itemRegDate;
	}

	public void setItemRegDate(Date itemRegDate) {
		this.itemRegDate = itemRegDate;
	}

	@Override
	public String toString() {
		return "Item [itemImage=" + itemImage + ", itemInfo=" + itemInfo + ", itemPrice=" + itemPrice + ", itemName="
				+ itemName + ", itemKey=" + itemKey + ", itemCategory=" + itemCategory + ", itemRegDate=" + itemRegDate
				+ "]";
	}
	
	
}
