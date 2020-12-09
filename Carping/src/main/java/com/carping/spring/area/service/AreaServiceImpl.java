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
	public Area selectAreaInfo(String areaAddress) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public AreaReview selectAreaReview(int arKey) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Place selectPlaceInfo(int placeKey) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public FoodZone selectFoodZoneInfo(int FoodZoneKey) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<AreaReview> selectAreaReviewList(PageInfo pi, int areaKey) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public double selectAreaReviewScoreAvg(int areaKey) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modifyAreaScoreAvg(int areaKey, double scoreAvg) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertArea(Area area) {
		// TODO Auto-generated method stub
		return 0;
	}

}
