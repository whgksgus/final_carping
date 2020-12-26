package com.carping.spring.foodzone.store;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carping.spring.foodzone.domain.BoardSearch;
import com.carping.spring.foodzone.domain.FoodZone;
import com.carping.spring.foodzone.domain.FoodZoneReview;
import com.carping.spring.foodzone.domain.Search;
import com.carping.spring.foodzone.domain.TakeOut;
import com.carping.spring.foodzone.domain.TakeOutReserve;
import com.carping.spring.foodzone.domain.Tor;
@Repository
public class FoodZoneStoreLogic implements FoodZoneStore {
	@Autowired
	private SqlSessionTemplate sqlSession;


	@Override
	public FoodZone selectFoodZoneInfo(String foodZoneName) {
		FoodZone foodZone = sqlSession.selectOne("FoodZoneMapper.selectOneFoodZone", foodZoneName);
		return foodZone;
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
	public int insertFoodZone(FoodZone foodZone) {
		return sqlSession.insert("FoodZoneMapper.adminInsertFoodZone", foodZone);
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

	@Override
	public FoodZone selectFoodZoneInfoByKey(int foodZoneKey) {
		return sqlSession.selectOne("FoodZoneMapper.selectFoodZoneInfoByKey", foodZoneKey);
	}

	@Override
	public TakeOut selectTakeOut(TakeOut takeOut) {
		return sqlSession.selectOne("FoodZoneMapper.selectTakeOut",takeOut);
	}

	@Override
	public int insertTakeout(TakeOutReserve tor) {
		int result = sqlSession.insert("FoodZoneMapper.insertTakeOut", tor);
		return result;
	}

	@Override
	public ArrayList<Tor> selectTakeOutReserve(String memberId) {
		// TODO Auto-generated method stub
		 return (ArrayList)sqlSession.selectList("FoodZoneMapper.selectTakeOutReserve", memberId);
	}

	@Override
	public int getSearchReviewListCount(BoardSearch boardSearch) {
		return sqlSession.selectOne("FoodZoneMapper.searchBoardListCount", boardSearch);
	}

	@Override
	public ArrayList<FoodZone> searchMenuFoodZone(String foodZoneName) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("FoodZoneMapper.searchMenuFoodZoneList", foodZoneName);
	}

	@Override
	public int insertMenu(TakeOut takeOut) {
		// TODO Auto-generated method stub
		return sqlSession.insert("FoodZoneMapper.insertMenu", takeOut);
	}

}
