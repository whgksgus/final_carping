package com.carping.spring.cart.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carping.spring.cart.domain.Cart;
import com.carping.spring.cart.store.CartStore;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private CartStore cStore;
	
	@Override
	public ArrayList<Map<String, Object>> selectCartList( String memberId ) {
		return cStore.selectCartList( memberId );
	}
	
	@Override
	public int checkItemKey( int itemKey ) {
		return cStore.checkItemKey(itemKey);
		
	}

	@Override
	public int deleteCart(int cartKey) {
		return cStore.deleteCart(cartKey);
	}

	@Override
	public int deleteAllCart(Cart cart) {
		return cStore.deleteAllCart( cart );
	}

	@Override
	public int orderCart(Cart cart) {
		return cStore.orderCart(cart);
	}

	@Override
	public int updateCartList(Cart cart) {
		return cStore.updateCartList(cart);
	}

	@Override
	public ArrayList<Map<String, Object>> selectOrderList(String memberId) {
		return cStore.selectOrderList(memberId);
	}

	@Override
	public int selectCartDetail( Cart cart ) {
		return cStore.selectCartDetail( cart );
	}

}
