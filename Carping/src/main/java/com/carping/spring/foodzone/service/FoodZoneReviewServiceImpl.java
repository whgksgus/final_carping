package com.carping.spring.foodzone.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carping.spring.common.Search;
import com.carping.spring.foodzone.domain.BoardSearch;
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
	public ArrayList<FoodZone> searchFoodZone(PageInfo pi,Search search) {
		return fzrStore.searchFoodZone(pi, search);
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
		return fzrStore.insertFoodZoneReview(foodZoneReview);
	}

	@Override
	public int insertFoodZoneReviewComment(FoodZoneReviewComment frc) {
		return fzrStore.insertFoodZoneReviewComment(frc);
	}

	@Override
	public int updateFoodZoneReview(FoodZoneReview fzr) {
		return fzrStore.updateFoodZoneReview(fzr);
	}

	@Override
	public int deleteFoodZoneReview(int frKey) {
		return fzrStore.deleteFoodZoneReview(frKey);
	}

	@Override
	public ArrayList<FoodZoneReviewComment> selectFoodZoneReviewCommentList(int frcKey) {
		return fzrStore.selectFoodZoneReviewCommentList(frcKey);
	}

	@Override
	public int deleteFoodZoneReviewComment(int frcKey) {
		return fzrStore.deleteFoodZoneReviewComment(frcKey);
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

	@Override
	public ArrayList<FoodZoneReview> searchFoodZoneBoardReview(PageInfo pi, BoardSearch boardSearch) {
		return fzrStore.searchFoodZoneBoardReview(pi, boardSearch);
	}

	@Override
	public int getReviewListCount(Search search) {
		return fzrStore.getReviewListCount(search);
	}

}
