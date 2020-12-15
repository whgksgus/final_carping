package com.carping.spring.cart.store;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carping.spring.cart.domain.Cart;
import com.carping.spring.common.PageInfo;

@Repository
public class CartStoreLogic implements CartStore {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Map<String, Object>> selectCartList() {
		return (ArrayList) sqlSession.selectList("CartMapper.selectCartList");
	}

	@Override
	public int deleteCart(int cartKey) {
		return sqlSession.delete( "CartMapper.deleteCart", cartKey );
	}

	@Override
	public int checkItemKey(int itemKey) {
		return sqlSession.selectOne("CartMapper.checkItemKey", itemKey );
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
	public int updateCartList(Cart cart) {
		return sqlSession.update( "CartMapper.updateCartList", cart );
	}

	@Override
	public ArrayList<Cart> selectOrderList(PageInfo pi, String memberId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectCartDetail(int itemKey) {
		return sqlSession.selectOne( "CartMapper.selectCartDetail", itemKey );
	}

}
