package com.carping.spring.foodzone.store;

import java.util.ArrayList;

import com.carping.spring.common.Search;
import com.carping.spring.foodzone.domain.BoardSearch;
import com.carping.spring.foodzone.domain.FoodZone;
import com.carping.spring.foodzone.domain.FoodZoneReview;
import com.carping.spring.foodzone.domain.FoodZoneReviewComment;
import com.carping.spring.foodzone.domain.PageInfo;


public interface FoodZoneReviewStore {
	public ArrayList<FoodZone> searchFoodZone(Search search);
	public ArrayList<FoodZoneReview> selectFoodZoneReviewList(int foodZoneKey, PageInfo pi);
	public FoodZoneReview selectFoodZoneReviewDetail(int frKey);
	public int insertFoodZoneReview(FoodZoneReview foodZoneReview);
	public int insertFoodZoneReviewComment(FoodZoneReviewComment frc);
	public int updateFoodZoneReview(FoodZoneReview fzr);
	public int deleteFoodZoneReview(int frKey);
	public ArrayList<FoodZoneReviewComment> selectFoodZoneReviewCommentList(int frcKey);
	public int deleteFoodZoneReviewComment(int frcKey);
	public int getListCount(int foodZoneKey);
	public int foodZoneReviewHits(int frKey);
	public ArrayList<FoodZoneReview> searchFoodZoneBoardReview(PageInfo pi, BoardSearch boardSearch);
}
