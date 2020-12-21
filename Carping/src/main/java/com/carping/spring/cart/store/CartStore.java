package com.carping.spring.cart.store;

import java.util.ArrayList;
import java.util.Map;

import com.carping.spring.cart.domain.Cart;
import com.carping.spring.common.PageInfo;

public interface CartStore {
	public ArrayList<Map<String, Object>> selectCartList( String memberId );
	public int deleteCart(int cartKey);
	public int deleteAllCart(String memberId);
	public int orderCart(Cart cart);
	public int updateCartList(Cart cart);
	public ArrayList<Cart> selectOrderList(PageInfo pi, String memberId);
	public int checkItemKey(int itemKey);
	public int selectCartDetail( Cart cart );
}
