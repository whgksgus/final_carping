package com.carping.spring.place.service;

import java.util.ArrayList;

import com.carping.spring.common.Search;
import com.carping.spring.place.domain.PageInfo;
import com.carping.spring.place.domain.Place;
import com.carping.spring.place.domain.PlaceReview;

public interface PlaceService {
	public ArrayList<Place> searchPlace(Search search);
	public Place selectPlaceInfo(String areaAddress);
	public ArrayList<PlaceReview> selectPlaceReviewlist(int placeKey, PageInfo pi);
	public int getListCount();
	public double selectPlaceReviewStoreAvg(int placeKey);
	public int modifyPlaceScoreAvg(int placeKey, int scoreAvg);
	public int insertPlace(Place place);
	public ArrayList<Place> selectPlaceList();
}
