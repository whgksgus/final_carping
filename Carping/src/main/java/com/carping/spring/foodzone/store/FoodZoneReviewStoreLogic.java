package com.carping.spring.foodzone.store;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carping.spring.common.Search;
import com.carping.spring.foodzone.domain.FoodZone;
import com.carping.spring.foodzone.domain.FoodZoneReview;
import com.carping.spring.foodzone.domain.FoodZoneReviewComment;
import com.carping.spring.foodzone.domain.PageInfo;

@Repository
public class FoodZoneReviewStoreLogic implements FoodZoneReviewStore {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<FoodZone> searchFoodZone(Search search) {
		return (ArrayList)sqlSession.selectList("FoodZoneMapper.searchList", search);
	}

	@Override
	public ArrayList<FoodZoneReview> selectFoodZoneReviewList(int foodZoneKey, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getListLimit());
		return (ArrayList)sqlSession.selectList("FoodZoneMapper.selectFoodZoneReviewList", foodZoneKey, rowBounds);
	}

	@Override
	public FoodZoneReview selectFoodZoneReviewDetail(int frKey) {
		return sqlSession.selectOne("FoodZoneMapper.foodZoneReviewDetail", frKey);
	}

	@Override
	public int insertFoodZoneReview(FoodZoneReview foodZoneReview) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertFoodZoneReviewComment(FoodZoneReviewComment frc) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateFoodZoneReview(FoodZoneReview fzr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteFoodZoneReview(int frKey) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<FoodZoneReviewComment> selectFoodZoneReviewCommentList(int frcKey) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteFoodZoneReviewComment(int frcKey) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getListCount(int foodZoneKey) {
		return sqlSession.selectOne("FoodZoneMapper.getFoodZoneReviewListCount", foodZoneKey);
	}

	@Override
	public int foodZoneReviewHits(int frKey) {
		return sqlSession.update("FoodZoneMapper.foodZoneReviewHits",frKey);
	}
	
}
