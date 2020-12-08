package com.carping.spring.cart.store;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.carping.spring.cart.domain.Cart;
import com.carping.spring.common.PageInfo;

public class CartStoreLogic implements CartStore {

	private SqlSessionTemplate sqlSession;
	
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
