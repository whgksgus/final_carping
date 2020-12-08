package com.carping.spring.place.store;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.carping.spring.common.PageInfo;
import com.carping.spring.common.Search;
import com.carping.spring.place.domain.Place;
import com.carping.spring.place.domain.PlaceReview;

public class PlaceStoreLogic implements PlaceStore {

	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Place> searchPlace(Search search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Place selectPlaceInfo(String areaAddress) {
		// TODO Auto-generated method stub
		return null;
	}

	
	@Override
	public ArrayList<PlaceReview> selectPlaceReviewlist(int placeKey, PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public double selectPlaceReviewStoreAvg(int placeKey) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updatePlaceScoreAvg(int placeKey, int scoreAvg) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertPlace(Place place) {
		// TODO Auto-generated method stub
		return 0;
	}

}
