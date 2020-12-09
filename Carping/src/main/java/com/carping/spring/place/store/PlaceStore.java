package com.carping.spring.place.store;

import java.util.ArrayList;

import com.carping.spring.common.PageInfo;
import com.carping.spring.common.Search;
import com.carping.spring.place.domain.Place;
import com.carping.spring.place.domain.PlaceReview;

public interface PlaceStore {
	public ArrayList<Place> searchPlace(Search search);
	public Place selectPlaceInfo(String areaAddress);
	public ArrayList<PlaceReview> selectPlaceReviewlist(int placeKey, PageInfo pi);
	public int getListCount();
	public double selectPlaceReviewStoreAvg(int placeKey);
	public int updatePlaceScoreAvg(int placeKey, int scoreAvg);
	public int insertPlace(Place place);
	public ArrayList<Place> selectPlaceList();
}
