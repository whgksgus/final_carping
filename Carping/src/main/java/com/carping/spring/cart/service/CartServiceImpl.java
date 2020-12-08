package com.carping.spring.cart.service;

import java.util.ArrayList;

import com.carping.spring.cart.domain.Cart;
import com.carping.spring.cart.store.CartStore;
import com.carping.spring.common.PageInfo;

public class CartServiceImpl implements CartService {

	private CartStore cStore;
	
	@Override
	public ArrayList<Cart> selectCartList() {
		// TODO Auto-generated method stub
		return null;
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

}
