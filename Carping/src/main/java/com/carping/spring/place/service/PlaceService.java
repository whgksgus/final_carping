package com.carping.spring.place.service;

import java.util.ArrayList;

import com.carping.spring.common.Search;
import com.carping.spring.place.domain.PageInfo;
import com.carping.spring.place.domain.Place;
import com.carping.spring.place.domain.PlaceReview;

public interface PlaceService {
	public ArrayList<Place> searchPlace(Search search);
	public Place selectPlaceInfo(String placeName);
	public ArrayList<PlaceReview> selectPlaceReviewlist(int placeKey);
	public int getListCount();
	public double selectPlaceReviewScoreAvg(int placeKey);
	public int modifyPlaceScoreAvg(int placeKey, int scoreAvg);
	public int insertPlace(Place place);
	public ArrayList<Place> selectPlaceList();
}
