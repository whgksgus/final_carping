package com.carping.spring.place.store;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.carping.spring.common.PageInfo;
import com.carping.spring.common.Search;
import com.carping.spring.place.domain.Place;
import com.carping.spring.place.domain.PlaceReview;
import com.carping.spring.place.domain.PlaceReviewComment;

public class PlaceReviewStoreLogic implements PlaceReviewStore {

	private SqlSessionTemplate sqlSession;
	
	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		return 0;
	}
 
	@Override
	public ArrayList<Place> searchPlaceReview(Search search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<PlaceReview> selectPlaceReviewList(PageInfo pi, int placeKey) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PlaceReview selectPlaceReviewDetail(int prKey) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertPlaceReview(PlaceReview pr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updatePlaceReview(PlaceReview pr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deletePlaceReview(int prKey) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertPlaceReviewComment(PlaceReviewComment prc) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<PlaceReviewComment> selectPlaceReviewCommentList(int prKey) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deletePlaceReviewComment(int prcKey) {
		// TODO Auto-generated method stub
		return 0;
	}

}
