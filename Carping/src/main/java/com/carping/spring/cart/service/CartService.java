package com.carping.spring.cart.service;

import java.util.ArrayList;

import com.carping.spring.cart.domain.Cart;
import com.carping.spring.common.PageInfo;

public interface CartService {
	public ArrayList<Cart> selectCartList();
	public int deleteCart(int cartKey);
	public int deleteAllCart(String memberId);
	public int orderCart(Cart cart);
	public int updateCartList(String memberId);
	public ArrayList<Cart> selectOrderList(PageInfo pi, String memberId);
}
