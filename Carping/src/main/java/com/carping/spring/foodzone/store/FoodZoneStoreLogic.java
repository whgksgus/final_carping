package com.carping.spring.foodzone.store;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.carping.spring.foodzone.domain.FoodZone;
import com.carping.spring.foodzone.domain.FoodZoneReview;
import com.carping.spring.foodzone.domain.Search;
import com.carping.spring.foodzone.domain.TakeOut;
@Repository
public class FoodZoneStoreLogic implements FoodZoneStore {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<FoodZone> searchFoodZone(Search search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public FoodZone selectFoodZoneInfo(String foodZoneName) {
		FoodZone foodZone = sqlSession.selectOne("FoodZoneMapper.selectOneFoodZone", foodZoneName);
		return foodZone;
	}
 
	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<FoodZoneReview> selectFoodZoneReviewList(int foodZoneKey) {
		return (ArrayList)sqlSession.selectList("FoodZoneMapper.selectReviewList", foodZoneKey);
	}

	@Override
	public double selectFoodZoneAvg(int foodZoneKey) {
		return sqlSession.selectOne("FoodZoneMapper.selectFoodZoneAvg", foodZoneKey);
	}

	@Override
	public int updateFoodZoneAvg(int foodZoneKey, double scoreAvg) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertFoodZone(FoodZone foodZone) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<FoodZone> selectFoodZoneList() {
		return (ArrayList)sqlSession.selectList("FoodZoneMapper.selectAll");
	}

	@Override
	public ArrayList<TakeOut> takeOutMenu(int foodZoneKey) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("FoodZoneMapper.takeOutMenuAll", foodZoneKey);
	}

}
