package com.carping.spring.cart.service;

import java.util.ArrayList;
import java.util.Map;

import com.carping.spring.cart.domain.Cart;
import com.carping.spring.common.PageInfo;

public interface CartService {
	public ArrayList<Map<String, Object>> selectCartList( String memberId );		// 장바구니 로드화면
	public int deleteCart(int cartKey);
	public int deleteAllCart(String memberId);
	public int orderCart(Cart cart);
	public int updateCartList(Cart cart);
	public ArrayList<Map<String, Object>> selectOrderList( String memberId ); // 주문내역 로드화면
	public int checkItemKey(int itemKey);
	public int selectCartDetail( Cart cart );
}
