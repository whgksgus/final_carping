package com.carping.spring.area.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carping.spring.area.domain.Area;
import com.carping.spring.area.domain.AreaReview;
import com.carping.spring.area.store.AreaStore;
import com.carping.spring.common.PageInfo;
import com.carping.spring.common.Search;
import com.carping.spring.foodzone.domain.FoodZone;
import com.carping.spring.place.domain.Place;

@Service
public class AreaServiceImpl implements AreaService {

	@Autowired
	private AreaStore aStore;
	
	@Override
	public ArrayList<Area> searchArea(Search search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Area selectAreaInfo(String areaName) {
		return aStore.selectAreaInfo(areaName);
	}

	@Override
	public AreaReview selectAreaReview(int arKey) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Place selectPlaceInfo(int placeKey) {
		return aStore.selectPlaceInfo(placeKey);
	}

	@Override
	public FoodZone selectFoodZoneInfo(int foodZoneKey) {
		return aStore.selectFoodZoneInfo(foodZoneKey);
	}

	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<AreaReview> selectAreaReviewList(int areaKey) {
		return aStore.selectAreaReviewList(areaKey);
	}

	@Override
	public double selectAreaReviewScoreAvg(int areaKey) {
		return aStore.selectAreaReviewScoreAvg(areaKey);
	}

	@Override
	public int modifyAreaScoreAvg(int areaKey, double scoreAvg) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertArea(Area area) {
		return aStore.insertArea(area);
	}

	@Override
	public ArrayList<Area> selectAreaList() {
		return aStore.selectAreaList();
	}

	@Override
	public ArrayList<FoodZone> selectFoodZoneList(String areaAddress) {
		return aStore.selectFoodZoneList(areaAddress);
	}

	@Override
	public ArrayList<Place> selectPlaceList(String areaAddress) {
		return aStore.selectPlaceList(areaAddress);
	}

}
