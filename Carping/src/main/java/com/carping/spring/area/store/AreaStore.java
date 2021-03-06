package com.carping.spring.area.store;

import java.util.ArrayList;

import com.carping.spring.area.domain.Area;
import com.carping.spring.area.domain.AreaReview;
import com.carping.spring.common.PageInfo;
import com.carping.spring.common.Search;
import com.carping.spring.foodzone.domain.FoodZone;
import com.carping.spring.place.domain.Place;

public interface AreaStore {
	 public ArrayList<Area> searchArea(Search search);
	 public Area selectAreaInfo(String areaAddress);
	 public AreaReview selectAreaReview(int arKey);
	 public Place selectPlaceInfo(int placeKey);
	 public FoodZone selectFoodZoneInfo(int FoodZoneKey);
	 public int getListCount();
	 public ArrayList<AreaReview> selectAreaReviewList(PageInfo pi, int areaKey);
	 public int selectAreaReviewScoreAvg(int areaKey);
	 public int updateAreaScoreAvg(int areaKey, int scoreAvg);
	 public int insertArea(Area area);
}
 