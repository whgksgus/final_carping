package com.carping.spring.place.service;

import java.util.ArrayList;

import com.carping.spring.common.Search;
import com.carping.spring.place.domain.BoardSearch;
import com.carping.spring.place.domain.PageInfo;
import com.carping.spring.place.domain.Place;
import com.carping.spring.place.domain.PlaceReview;
import com.carping.spring.place.domain.PlaceReviewComment;

public interface PlaceReviewService {
	public int getPlaceListCount(int placeKey);
	public int getReviewListCount(Search search);
	public int getSearchReviewListCount(BoardSearch boardSearch);
	public int placeReviewHits(int prKey);
	public ArrayList<Place> searchPlaceReview(PageInfo pi, Search search);
	public ArrayList<PlaceReview> searchPlaceBoardReview(PageInfo pi, BoardSearch boardSearch);
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
