package com.carping.spring.area.service;

import java.util.ArrayList;

import com.carping.spring.area.domain.Area;
import com.carping.spring.area.domain.AreaReview;
import com.carping.spring.common.PageInfo;
import com.carping.spring.common.Search;
import com.carping.spring.foodzone.domain.FoodZone;
import com.carping.spring.place.domain.Place;

public interface AreaService {
	 public ArrayList<Area> searchArea(Search search);
	 public Area selectAreaInfo(String areaName);
	 public AreaReview selectAreaReview(int arKey);
	 public Place selectPlaceInfo(int placeKey);
	 public FoodZone selectFoodZoneInfo(int FoodZoneKey);
	 public int getListCount();
	 public ArrayList<AreaReview> selectAreaReviewList(PageInfo pi, int areaKey);
	 public double selectAreaReviewScoreAvg(int areaKey);
	 public int modifyAreaScoreAvg(int areaKey, double scoreAvg);
	 public int insertArea(Area area);
	 public ArrayList<Area> selectAreaList();
}
