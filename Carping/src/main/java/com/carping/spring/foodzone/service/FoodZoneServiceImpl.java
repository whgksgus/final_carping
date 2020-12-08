package com.carping.spring.foodzone.service;

import java.util.ArrayList;

import com.carping.spring.common.PageInfo;
import com.carping.spring.common.Search;
import com.carping.spring.foodzone.domain.FoodZone;
import com.carping.spring.foodzone.domain.FoodZoneReview;
import com.carping.spring.foodzone.store.FoodZoneStore;

public class FoodZoneServiceImpl implements FoodZoneService {

	private FoodZoneStore fzStore;
	
	@Override
	public ArrayList<FoodZone> searchFoodZone(Search search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public FoodZone selectFoodZoneInfo(String foodZoneAddress) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<FoodZoneReview> selectFoodZoneReviewList(int foodZoneKey, PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public double selectFoodZoneAvg(int foodZoneKey) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modifyFoodZoneAvg(int foodZoneKey, double scoreAvg) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertFoodZone(FoodZone foodZone) {
		// TODO Auto-generated method stub
		return 0;
	}

}
