package com.carping.spring.area.store;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.carping.spring.area.domain.Area;
import com.carping.spring.area.domain.AreaReview;
import com.carping.spring.common.PageInfo;
import com.carping.spring.common.Search;
import com.carping.spring.foodzone.domain.FoodZone;
import com.carping.spring.place.domain.Place;

public class AreaStoreLogic implements AreaStore {

	private SqlSessionTemplate sqlSession;
	
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
	public int selectAreaReviewScoreAvg(int areaKey) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateAreaScoreAvg(int areaKey, int scoreAvg) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertArea(Area area) {
		// TODO Auto-generated method stub
		return 0;
	}

}
