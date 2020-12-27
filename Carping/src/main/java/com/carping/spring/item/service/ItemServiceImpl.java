package com.carping.spring.item.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carping.spring.cart.domain.Cart;
import com.carping.spring.item.domain.Item;
import com.carping.spring.item.domain.PageInfo;
import com.carping.spring.item.domain.Search;
import com.carping.spring.item.store.ItemStore;

@Service
public class ItemServiceImpl implements ItemService {

	@Autowired 
	private ItemStore iStore;
	
	@Override
	public int getListCount() {
		return iStore.getListCount();
	}
	
	@Override
	public int getSearchCount(Search search) {
		return iStore.getSearchCount(search);
	}

	@Override
	public ArrayList<Item> selectTentList(PageInfo pi) {
		return iStore.selectTentList(pi);
	}

	@Override
	public ArrayList<Item> selectTentNew(PageInfo pi) {
		return iStore.selectTentNew(pi);
	}

	@Override
	public ArrayList<Item> selectTentLow(PageInfo pi) {
		return iStore.selectTentLow(pi);
	}

	@Override
	public ArrayList<Item> selectTentHigh(PageInfo pi) {
		return iStore.selectTentHigh(pi);
	}

	@Override
	public ArrayList<Item> searchTentList(Search search, PageInfo pi) {
		return iStore.searchTentList(search, pi);
	}

	@Override
	public ArrayList<Item> selectCookList(PageInfo pi) {
		return iStore.selectCookList(pi);
	}

	@Override
	public ArrayList<Item> selectCookNew(PageInfo pi) {
		return iStore.selectCookNew(pi);
	}

	@Override
	public ArrayList<Item> selectCookLow(PageInfo pi) {
		return iStore.selectCookLow(pi);
	}

	@Override
	public ArrayList<Item> selectCookHigh(PageInfo pi) {
		return iStore.selectCookHigh(pi);
	}

	@Override
	public ArrayList<Item> searchCookList(Search search, PageInfo pi) {
		return iStore.searchCookList(search, pi);
	}
	
	@Override
	public ArrayList<Item> selectSleepList(PageInfo pi) {
		return iStore.selectSleepList(pi);
	}

	@Override
	public ArrayList<Item> selectSleepNew(PageInfo pi) {
		return iStore.selectSleepNew(pi);
	}

	@Override
	public ArrayList<Item> selectSleepLow(PageInfo pi) {
		return iStore.selectSleepLow(pi);
	}

	@Override
	public ArrayList<Item> selectSleepHigh(PageInfo pi) {
		return iStore.selectSleepHigh(pi);
	}

	@Override
	public ArrayList<Item> searchSleepList(Search search, PageInfo pi) {
		return iStore.searchSleepList(search, pi);
	}

	@Override
	public ArrayList<Item> selectEtcList(PageInfo pi) {
		return iStore.selectEtcList(pi);
	}

	@Override
	public ArrayList<Item> selectEtcNew(PageInfo pi) {
		return iStore.selectEtcNew(pi);
	}

	@Override
	public ArrayList<Item> selectEtcLow(PageInfo pi) {
		return iStore.selectEtcLow(pi);
	}

	@Override
	public ArrayList<Item> selectEtcHigh(PageInfo pi) {
		return iStore.selectEtcHigh(pi);
	}

	@Override
	public ArrayList<Item> searchEtcList(Search search, PageInfo pi) {
		return iStore.searchEtcList(search, pi);
	}

	@Override
	public int insertCart(Cart cart) {
		return iStore.insertCart(cart);
	}

	@Override
	public Item selectItemDetail(int itemKey) {
		return iStore.selectItemDetail(itemKey);
	}

	@Override
	public int checkItemKey( Map<String, Object> map ) {
		return iStore.checkItemKey( map );
	}

	@Override
	public int updateCart(Cart cart) {
		return iStore.updateCart( cart );
	}
	
	@Override
	public Cart insertOrder(Cart cart) {
		// TODO Auto-generated method stub
		return null;
	}

}
