package com.carping.spring.foodzone.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carping.spring.common.PageInfo;
import com.carping.spring.common.Search;
import com.carping.spring.foodzone.domain.FoodZone;
import com.carping.spring.foodzone.domain.FoodZoneReview;
import com.carping.spring.foodzone.domain.TakeOut;
import com.carping.spring.foodzone.store.FoodZoneStore;

@Service
public class FoodZoneServiceImpl implements FoodZoneService {
	@Autowired
	private FoodZoneStore fzStore;
	
	@Override
	public ArrayList<FoodZone> searchFoodZone(Search search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public FoodZone selectFoodZoneInfo(String foodZoneName) {
		// TODO Auto-generated method stub
		return fzStore.selectFoodZoneInfo(foodZoneName);
	}

	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<FoodZoneReview> selectFoodZoneReviewList(int foodZoneKey) {
		// TODO Auto-generated method stub
		return fzStore.selectFoodZoneReviewList(foodZoneKey);
	}

	@Override
	public double selectFoodZoneAvg(int foodZoneKey) {
		return fzStore.selectFoodZoneAvg(foodZoneKey);
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

	@Override
	public ArrayList<FoodZone> selectFoodZoneList() {
		return fzStore.selectFoodZoneList();
	}

	@Override
	public ArrayList<TakeOut> selectTakeOutMenu(int foodZoneKey) {
		return fzStore.takeOutMenu(foodZoneKey);
	}

}
