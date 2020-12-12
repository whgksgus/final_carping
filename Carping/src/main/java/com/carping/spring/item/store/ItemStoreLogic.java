 package com.carping.spring.item.store;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carping.spring.cart.domain.Cart;
import com.carping.spring.common.Search;
import com.carping.spring.item.domain.Item;
import com.carping.spring.item.domain.PageInfo;

@Repository
public class ItemStoreLogic implements ItemStore {

   @Autowired
   private SqlSessionTemplate sqlSession;
   
   @Override
   public int getListCount() {
      return sqlSession.selectOne("ItemMapper.getListCount");
   }

   @Override
   public ArrayList<Item> selectTentList(PageInfo pi) {
      int offset = (pi.getCurrentPage()-1) * pi.getItemLimit();
      RowBounds rowBounds = new RowBounds(offset, pi.getItemLimit());
      return (ArrayList)sqlSession.selectList("ItemMapper.selectTentList", null, rowBounds);
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
	   return sqlSession.insert("ItemMapper.insertCart", cart);
   }

   @Override
   public Cart insertOrder(Cart cart) {
	   // TODO Auto-generated method stub
	      return null;
   }

   @Override
   public Item selectItemDetail(int itemKey) {
	   return sqlSession.selectOne("ItemMapper.selectItemDetail", itemKey);
   }

}