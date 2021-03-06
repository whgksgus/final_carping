package com.carping.spring.foodzone.store;

import java.util.ArrayList;

import com.carping.spring.common.PageInfo;
import com.carping.spring.common.Search;
import com.carping.spring.foodzone.domain.FoodZone;
import com.carping.spring.foodzone.domain.FoodZoneReview;

public interface FoodZoneStore {
	public ArrayList<FoodZone> searchFoodZone(Search search);
	public FoodZone selectFoodZoneInfo(String foodZoneAddress);
	public int getListCount();
	public ArrayList<FoodZoneReview> selectFoodZoneReviewList(int foodZoneKey, PageInfo pi);
	public double selectFoodZoneAvg(int foodZoneKey);
	public int updateFoodZoneAvg(int foodZoneKey, double scoreAvg);
	public int insertFoodZone(FoodZone foodZone);
}
