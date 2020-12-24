package com.carping.spring.place.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carping.spring.common.Search;
import com.carping.spring.place.domain.PageInfo;
import com.carping.spring.place.domain.Place;
import com.carping.spring.place.domain.PlaceReview;
import com.carping.spring.place.store.PlaceStore;

@Service
public class PlaceServiceImpl implements PlaceService {

	@Autowired
	private PlaceStore pStore;

	@Override
	public Place selectPlaceInfo(String placeName) {
		return pStore.selectPlaceInfo(placeName);
	}


	@Override
	public ArrayList<PlaceReview> selectPlaceReviewlist(int placeKey) {
		return pStore.selectPlaceReviewlist(placeKey);
	}

	@Override
	public double selectPlaceReviewScoreAvg(int placeKey) {
		return pStore.selectPlaceReviewScoreAvg(placeKey);
	}

	@Override
	public int insertPlace(Place place) {
		return pStore.insertPlace(place);
	}

	@Override
	public ArrayList<Place> selectPlaceList() {
		return pStore.selectPlaceList();
	}

}
