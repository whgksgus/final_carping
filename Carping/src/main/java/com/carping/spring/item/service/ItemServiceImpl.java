package com.carping.spring.item.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carping.spring.cart.domain.Cart;
import com.carping.spring.item.domain.PageInfo;
import com.carping.spring.common.Search;
import com.carping.spring.item.domain.Item;
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
	public ArrayList<Item> selectTentList(PageInfo pi) {
		return iStore.selectTentList(pi);
	}

	@Override
	public ArrayList<Item> selectTentNew(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Item> selectTentLow(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Item> selectTentHigh(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Item> searchTentList(PageInfo pi, Search search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Item> selectCookList(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Item> selectCookNew(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Item> selectCookLow(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Item> selectCookHigh(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Item> searchCookList(PageInfo pi, Search search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Item> selectSleepList(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Item> selectSleepNew(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Item> selectSleepLow(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Item> selectSleepHigh(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Item> searchSleepList(PageInfo pi, Search search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Item> selectEtcList(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Item> selectEtcNew(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Item> selectEtcLow(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Item> selectEtcHigh(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Item> searchEtcList(PageInfo pi, Search search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertCart(Cart cart) {
		return iStore.insertCart(cart);
	}

	@Override
	public Cart insertOrder(Cart cart) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Item selectItemDetail(int itemKey) {
		return iStore.selectItemDetail(itemKey);
	}

}
