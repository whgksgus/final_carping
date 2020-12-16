package com.carping.spring.foodzone.store;

import java.util.ArrayList;


import com.carping.spring.foodzone.domain.FoodZone;
import com.carping.spring.foodzone.domain.FoodZoneReview;
import com.carping.spring.foodzone.domain.Search;
import com.carping.spring.foodzone.domain.TakeOut;
import com.carping.spring.foodzone.domain.TakeOutReserve;

public interface FoodZoneStore {
	public ArrayList<FoodZone> searchFoodZone(Search search);
	public FoodZone selectFoodZoneInfo(String foodZoneName);
	public int getListCount();
	public ArrayList<FoodZoneReview> selectFoodZoneReviewList(int foodZoneKey);
	public double selectFoodZoneAvg(int foodZoneKey);
	public int updateFoodZoneAvg(int foodZoneKey, double scoreAvg);
	public int insertFoodZone(FoodZone foodZone);
	public ArrayList<FoodZone> selectFoodZoneList();
	public ArrayList<TakeOut> takeOutMenu(int foodZoneKey);
	public FoodZone selectFoodZoneInfoByKey(int foodZoneKey);
	public TakeOut selectTakeOut(TakeOut takeOut);
	public int insertTakeout(TakeOutReserve tor);
}
