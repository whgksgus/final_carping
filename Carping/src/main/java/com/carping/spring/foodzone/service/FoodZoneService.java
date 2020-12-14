package com.carping.spring.foodzone.service;

import java.util.ArrayList;

import com.carping.spring.common.PageInfo;
import com.carping.spring.common.Search;
import com.carping.spring.foodzone.domain.FoodZone;
import com.carping.spring.foodzone.domain.FoodZoneReview;
import com.carping.spring.foodzone.domain.TakeOut;

public interface FoodZoneService {
	public ArrayList<FoodZone> searchFoodZone(Search search);
	public FoodZone selectFoodZoneInfo(String foodZoneName);
	public int getListCount();
	public ArrayList<FoodZoneReview> selectFoodZoneReviewList(int foodZoneKey);
	public double selectFoodZoneAvg(int foodZoneKey);
	public ArrayList<TakeOut> selectTakeOutMenu(int foodZoneKey);
	public int modifyFoodZoneAvg(int foodZoneKey, double scoreAvg);
	public int insertFoodZone(FoodZone foodZone);
	public ArrayList<FoodZone> selectFoodZoneList();
	
}
