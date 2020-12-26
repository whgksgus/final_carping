package com.carping.spring.foodzone.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carping.spring.foodzone.domain.BoardSearch;
import com.carping.spring.foodzone.domain.FoodZone;
import com.carping.spring.foodzone.domain.FoodZoneReview;
import com.carping.spring.foodzone.domain.Search;
import com.carping.spring.foodzone.domain.TakeOut;
import com.carping.spring.foodzone.domain.TakeOutReserve;
import com.carping.spring.foodzone.domain.Tor;
import com.carping.spring.foodzone.store.FoodZoneStore;

@Service
public class FoodZoneServiceImpl implements FoodZoneService {
	@Autowired
	private FoodZoneStore fzStore;

	@Override
	public FoodZone selectFoodZoneInfo(String foodZoneName) {
		// TODO Auto-generated method stub
		return fzStore.selectFoodZoneInfo(foodZoneName);
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
	public int insertFoodZone(FoodZone foodZone) {
		return fzStore.insertFoodZone(foodZone);
	}

	@Override
	public ArrayList<FoodZone> selectFoodZoneList() {
		return fzStore.selectFoodZoneList();
	}

	@Override
	public ArrayList<TakeOut> selectTakeOutMenu(int foodZoneKey) {
		return fzStore.takeOutMenu(foodZoneKey);
	}

	@Override
	public FoodZone selectFoodZoneInfoByKey(int foodZoneKey) {
		return fzStore.selectFoodZoneInfoByKey(foodZoneKey);
	}

	@Override
	public TakeOut selectTakeOut(TakeOut takeOut) {
		return fzStore.selectTakeOut(takeOut);
	}

	@Override
	public int insertTakeout(TakeOutReserve tor) {
		int result = fzStore.insertTakeout(tor);
		
		return result;
	}

	@Override
	public ArrayList<Tor> selectTakeOutReserve(String memberId) {
		// TODO Auto-generated method stub
		return fzStore.selectTakeOutReserve(memberId);
	}

	@Override
	public int getSearchReviewListCount(BoardSearch boardSearch) {
		return fzStore.getSearchReviewListCount(boardSearch);
	}

	@Override
	public ArrayList<FoodZone> searchMenuFoodZone(String foodZoneName) {
		// TODO Auto-generated method stub
		return fzStore.searchMenuFoodZone(foodZoneName);
	}

	@Override
	public int insertMenu(TakeOut takeOut) {
		return fzStore.insertMenu(takeOut);
	}



}
