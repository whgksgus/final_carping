package com.carping.spring.place.store;

import java.util.ArrayList;

import com.carping.spring.common.PageInfo;
import com.carping.spring.common.Search;
import com.carping.spring.place.domain.Place;
import com.carping.spring.place.domain.PlaceReview;
import com.carping.spring.place.domain.PlaceReviewComment;

public interface PlaceReviewStore {
	public int getListCount();
	public ArrayList<Place> searchPlaceReview(Search search);
	public Place selectOne(int placeKey);
	public ArrayList<PlaceReview> selectPlaceReviewList(PageInfo pi, int placeKey);
	public PlaceReview selectPlaceReviewDetail(int prKey);
	public int insertPlaceReview(PlaceReview pr);
	public int updatePlaceReview(PlaceReview pr);
	public int deletePlaceReview(int prKey);
	public int insertPlaceReviewComment(PlaceReviewComment prc);
	public ArrayList<PlaceReviewComment> selectPlaceReviewCommentList(int prKey);
	public int deletePlaceReviewComment(int prcKey);
}
