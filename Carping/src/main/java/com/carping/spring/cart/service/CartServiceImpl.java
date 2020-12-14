package com.carping.spring.cart.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carping.spring.cart.domain.Cart;
import com.carping.spring.cart.store.CartStore;
import com.carping.spring.common.PageInfo;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private CartStore cStore;
	
	@Override
	public ArrayList<Map<String, Object>> selectCartList() {
		return cStore.selectCartList();
	}
	
	@Override
	public int checkItemKey( int itemKey ) {
		return cStore.checkItemKey(itemKey);
		
	}

	@Override
	public int deleteCart(int cartKey) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteAllCart(String memberId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int orderCart(Cart cart) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateCartList(String memberId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Cart> selectOrderList(PageInfo pi, String memberId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectCartDetail(int itemKey) {
		return cStore.selectCartDetail(itemKey);
	}

}
