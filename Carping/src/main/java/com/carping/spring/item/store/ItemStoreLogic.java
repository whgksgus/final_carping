 package com.carping.spring.item.store;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carping.spring.cart.domain.Cart;
import com.carping.spring.item.domain.Item;
import com.carping.spring.item.domain.PageInfo;
import com.carping.spring.item.domain.Search;

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
   
   public int checkItemKey( Map<String, Object> map ) {
	   return sqlSession.selectOne( "ItemMapper.checkItemKey", map );
   }
   
   public int updateCart( Cart cart ) {
	   return sqlSession.update( "ItemMapper.updateCart", cart );
   }

   @Override
   public ArrayList<Item> selectTentNew(PageInfo pi) {
	  int offset = (pi.getCurrentPage()-1) * pi.getItemLimit();
      RowBounds rowBounds = new RowBounds(offset, pi.getItemLimit());
      return (ArrayList)sqlSession.selectList("ItemMapper.selectTentNew", null, rowBounds);
   }

   @Override
   public ArrayList<Item> selectTentLow(PageInfo pi) {
	   int offset = (pi.getCurrentPage()-1) * pi.getItemLimit();
	   RowBounds rowBounds = new RowBounds(offset, pi.getItemLimit());
	   return (ArrayList)sqlSession.selectList("ItemMapper.selectTentLow", null, rowBounds);
   }

   @Override
   public ArrayList<Item> selectTentHigh(PageInfo pi) {
	   int offset = (pi.getCurrentPage()-1) * pi.getItemLimit();
	   RowBounds rowBounds = new RowBounds(offset, pi.getItemLimit());
	   return (ArrayList)sqlSession.selectList("ItemMapper.selectTentHigh", null, rowBounds);
   }

   @Override
   public ArrayList<Item> searchTentList(Search search, PageInfo pi) {
	   int offset = (pi.getCurrentPage()-1) * pi.getItemLimit();
	   RowBounds rowBounds = new RowBounds(offset, pi.getItemLimit());
	   return (ArrayList)sqlSession.selectList("ItemMapper.searchTent", search, rowBounds);
   }

   @Override
   public ArrayList<Item> selectCookList(PageInfo pi) {
	   int offset = (pi.getCurrentPage()-1) * pi.getItemLimit();
	   RowBounds rowBounds = new RowBounds(offset, pi.getItemLimit());
	   return (ArrayList)sqlSession.selectList("ItemMapper.selectCookList", null, rowBounds);
   }

   @Override
   public ArrayList<Item> selectCookNew(PageInfo pi) {
	   int offset = (pi.getCurrentPage()-1) * pi.getItemLimit();
	   RowBounds rowBounds = new RowBounds(offset, pi.getItemLimit());
	   return (ArrayList)sqlSession.selectList("ItemMapper.selectCookNew", null, rowBounds);
   }

   @Override
   public ArrayList<Item> selectCookLow(PageInfo pi) {
	   int offset = (pi.getCurrentPage()-1) * pi.getItemLimit();
	   RowBounds rowBounds = new RowBounds(offset, pi.getItemLimit());
	   return (ArrayList)sqlSession.selectList("ItemMapper.selectCookLow", null, rowBounds);
   }

   @Override
   public ArrayList<Item> selectCookHigh(PageInfo pi) {
	   int offset = (pi.getCurrentPage()-1) * pi.getItemLimit();
	   RowBounds rowBounds = new RowBounds(offset, pi.getItemLimit());
	   return (ArrayList)sqlSession.selectList("ItemMapper.selectCookHigh", null, rowBounds);
   }

   @Override
   public ArrayList<Item> searchCookList(Search search, PageInfo pi) {
	   int offset = (pi.getCurrentPage()-1) * pi.getItemLimit();
	   RowBounds rowBounds = new RowBounds(offset, pi.getItemLimit());
	   return (ArrayList)sqlSession.selectList("ItemMapper.searchCook", search, rowBounds);
   }

   @Override
   public ArrayList<Item> selectSleepList(PageInfo pi) {
	   int offset = (pi.getCurrentPage()-1) * pi.getItemLimit();
	   RowBounds rowBounds = new RowBounds(offset, pi.getItemLimit());
	   return (ArrayList)sqlSession.selectList("ItemMapper.selectSleepList", null, rowBounds);
   }

   @Override
   public ArrayList<Item> selectSleepNew(PageInfo pi) {
	   int offset = (pi.getCurrentPage()-1) * pi.getItemLimit();
	   RowBounds rowBounds = new RowBounds(offset, pi.getItemLimit());
	   return (ArrayList)sqlSession.selectList("ItemMapper.selectSleepNew", null, rowBounds);
   }

   @Override
   public ArrayList<Item> selectSleepLow(PageInfo pi) {
	   int offset = (pi.getCurrentPage()-1) * pi.getItemLimit();
	   RowBounds rowBounds = new RowBounds(offset, pi.getItemLimit());
	   return (ArrayList)sqlSession.selectList("ItemMapper.selectSleepLow", null, rowBounds);
   }

   @Override
   public ArrayList<Item> selectSleepHigh(PageInfo pi) {
	   int offset = (pi.getCurrentPage()-1) * pi.getItemLimit();
	   RowBounds rowBounds = new RowBounds(offset, pi.getItemLimit());
	   return (ArrayList)sqlSession.selectList("ItemMapper.selectSleepHigh", null, rowBounds);
   }

   @Override
   public ArrayList<Item> searchSleepList(Search search, PageInfo pi) {
	   int offset = (pi.getCurrentPage()-1) * pi.getItemLimit();
	   RowBounds rowBounds = new RowBounds(offset, pi.getItemLimit());
	   return (ArrayList)sqlSession.selectList("ItemMapper.searchSleep", search, rowBounds);
   }

   @Override
   public ArrayList<Item> selectEtcList(PageInfo pi) {
	   int offset = (pi.getCurrentPage()-1) * pi.getItemLimit();
	   RowBounds rowBounds = new RowBounds(offset, pi.getItemLimit());
	   return (ArrayList)sqlSession.selectList("ItemMapper.selectEtcList", null, rowBounds);
   }

   @Override
   public ArrayList<Item> selectEtcNew(PageInfo pi) {
	   int offset = (pi.getCurrentPage()-1) * pi.getItemLimit();
	   RowBounds rowBounds = new RowBounds(offset, pi.getItemLimit());
	   return (ArrayList)sqlSession.selectList("ItemMapper.selectEtcNew", null, rowBounds);
   }

   @Override
   public ArrayList<Item> selectEtcLow(PageInfo pi) {
	   int offset = (pi.getCurrentPage()-1) * pi.getItemLimit();
	   RowBounds rowBounds = new RowBounds(offset, pi.getItemLimit());
	   return (ArrayList)sqlSession.selectList("ItemMapper.selectEtcLow", null, rowBounds);
   }

   @Override
   public ArrayList<Item> selectEtcHigh(PageInfo pi) {
	   int offset = (pi.getCurrentPage()-1) * pi.getItemLimit();
	   RowBounds rowBounds = new RowBounds(offset, pi.getItemLimit());
	   return (ArrayList)sqlSession.selectList("ItemMapper.selectEtcHigh", null, rowBounds);
   }

   @Override
   public ArrayList<Item> searchEtcList(Search search, PageInfo pi) {
	   int offset = (pi.getCurrentPage()-1) * pi.getItemLimit();
	   RowBounds rowBounds = new RowBounds(offset, pi.getItemLimit());
	   return (ArrayList)sqlSession.selectList("ItemMapper.searchEtc", search, rowBounds);
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