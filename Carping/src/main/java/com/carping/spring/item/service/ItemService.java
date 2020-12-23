package com.carping.spring.item.service;

import java.util.ArrayList;
import java.util.Map;

import com.carping.spring.cart.domain.Cart;
import com.carping.spring.item.domain.Item;
import com.carping.spring.item.domain.PageInfo;
import com.carping.spring.item.domain.Search;

public interface ItemService {
	public int getListCount();
	public ArrayList<Item> selectTentList(PageInfo pi);
	public ArrayList<Item> selectTentNew(PageInfo pi);
	public ArrayList<Item> selectTentLow(PageInfo pi);
	public ArrayList<Item> selectTentHigh(PageInfo pi);
	public ArrayList<Item> searchTentList(Search search, PageInfo pi);
	public ArrayList<Item> selectCookList(PageInfo pi);
	public ArrayList<Item> selectCookNew(PageInfo pi);
	public ArrayList<Item> selectCookLow(PageInfo pi);
	public ArrayList<Item> selectCookHigh(PageInfo pi);
	public ArrayList<Item> searchCookList(Search search, PageInfo pi);
	public ArrayList<Item> selectSleepList(PageInfo pi);
	public ArrayList<Item> selectSleepNew(PageInfo pi);
	public ArrayList<Item> selectSleepLow(PageInfo pi);
	public ArrayList<Item> selectSleepHigh(PageInfo pi);
	public ArrayList<Item> searchSleepList(Search search, PageInfo pi);
	public ArrayList<Item> selectEtcList(PageInfo pi);
	public ArrayList<Item> selectEtcNew(PageInfo pi);
	public ArrayList<Item> selectEtcLow(PageInfo pi); 
	public ArrayList<Item> selectEtcHigh(PageInfo pi);
	public ArrayList<Item> searchEtcList(Search search, PageInfo pi);
	public Item selectItemDetail(int itemKey);
	public int insertCart(Cart cart);
	public int updateCart( Cart cart );
	public int checkItemKey( Map<String, Object> map );
	public Cart insertOrder(Cart cart);
}
