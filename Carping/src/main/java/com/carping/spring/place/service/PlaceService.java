package com.carping.spring.place.service;

import java.util.ArrayList;

import com.carping.spring.common.Search;
import com.carping.spring.place.domain.PageInfo;
import com.carping.spring.place.domain.Place;
import com.carping.spring.place.domain.PlaceReview;

public interface PlaceService {
	public Place selectPlaceInfo(String placeName);
	public ArrayList<PlaceReview> selectPlaceReviewlist(int placeKey);
	public double selectPlaceReviewScoreAvg(int placeKey);
	public int insertPlace(Place place);
	public ArrayList<Place> selectPlaceList();
}
