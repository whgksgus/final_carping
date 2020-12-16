package com.carping.spring.foodzone.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carping.spring.common.Search;
import com.carping.spring.foodzone.domain.FoodZone;
import com.carping.spring.foodzone.domain.FoodZoneReview;
import com.carping.spring.foodzone.domain.FoodZoneReviewComment;
import com.carping.spring.foodzone.domain.PageInfo;

import com.carping.spring.foodzone.store.FoodZoneReviewStore;
@Service
public class FoodZoneReviewServiceImpl implements FoodZoneReviewService {
	@Autowired
	private FoodZoneReviewStore fzrStore;
	
	@Override
	public ArrayList<FoodZone> searchFoodZone(Search search) {
		return fzrStore.searchFoodZone(search);
	}

	@Override
	public ArrayList<FoodZoneReview> selectFoodZoneReviewList(int foodZoneKey, PageInfo pi) {
		return fzrStore.selectFoodZoneReviewList(foodZoneKey, pi);
	}

	@Override
	public FoodZoneReview selectFoodZoneReviewDetail(int frKey) {
		return fzrStore.selectFoodZoneReviewDetail(frKey);
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
		return fzrStore.getListCount(foodZoneKey);
	}

	@Override
	public int foodZoneReviewHits(int frKey) {
		// TODO Auto-generated method stub
		return fzrStore.foodZoneReviewHits(frKey);
	}

}
