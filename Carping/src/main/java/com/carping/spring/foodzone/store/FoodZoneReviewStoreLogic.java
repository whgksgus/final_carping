package com.carping.spring.foodzone.store;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.carping.spring.common.PageInfo;
import com.carping.spring.common.Search;
import com.carping.spring.foodzone.domain.FoodZone;
import com.carping.spring.foodzone.domain.FoodZoneReview;
import com.carping.spring.foodzone.domain.FoodZoneReviewComment;

public class FoodZoneReviewStoreLogic implements FoodZoneReviewStore {

	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<FoodZone> searchFoodZone(Search search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<FoodZoneReview> selectFoodZoneReviewList(int foodZoneKey, PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public FoodZoneReview selectFoodZoneReviewDetail(int frKey) {
		// TODO Auto-generated method stub
		return null;
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
	public int getListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

}
