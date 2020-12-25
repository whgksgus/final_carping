package com.carping.spring.place.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.carping.spring.common.Search;
import com.carping.spring.place.domain.BoardSearch;
import com.carping.spring.place.domain.PageInfo;
import com.carping.spring.place.domain.Place;
import com.carping.spring.place.domain.PlaceReview;
import com.carping.spring.place.domain.PlaceReviewComment;
import com.carping.spring.place.store.PlaceReviewStore;

@Service
public class PlaceReviewServiceImpl implements PlaceReviewService {

	@Autowired
	private PlaceReviewStore prStore;
	
	@Override
	public int getPlaceListCount(int placeKey) {
		return prStore.getPlaceListCount(placeKey);
	}

	@Override
	public int getReviewListCount(Search search) {
		return prStore.getReviewListCount(search);
	}
	
	
	@Override
	public int getSearchReviewListCount(BoardSearch boardSearch) {
		return prStore.getSearchReviewListCount(boardSearch);
	}
	
	@Override
	public int placeReviewHits(int prKey) {
		return prStore.placeReviewHits(prKey);
	}

	@Override
	public ArrayList<Place> searchPlaceReview(PageInfo pi, Search search) {
		return prStore.searchPlaceReview(pi, search);
	}
	
	@Override
	public ArrayList<PlaceReview> searchPlaceBoardReview(PageInfo pi, BoardSearch boardSearch) {
		return prStore.searchPlaceBoardReview(pi, boardSearch);
	}

	@Override
	public ArrayList<PlaceReview> selectPlaceReviewList(PageInfo pi, int placeKey) {
		return prStore.selectPlaceReviewList(pi, placeKey);
	}

	@Override
	public PlaceReview selectPlaceReviewDetail(int prKey) {
		return prStore.selectPlaceReviewDetail(prKey);
	}

	@Override
	public int insertPlaceReview(PlaceReview pr) {
		return prStore.insertPlaceReview(pr);
	}

	@Override
	public int updatePlaceReview(PlaceReview pr) {
		return prStore.updatePlaceReview(pr);
	}

	@Override
	public int deletePlaceReview(int prKey) {
		return prStore.deletePlaceReview(prKey);
	}

	@Override
	public int insertPlaceReviewComment(PlaceReviewComment prc) {
		return prStore.insertPlaceReviewComment(prc);
	}

	@Override
	public ArrayList<PlaceReviewComment> selectPlaceReviewCommentList(int prKey) {
		return prStore.selectPlaceReviewCommentList(prKey);
	}

	@Override
	public int deletePlaceReviewComment(int prcKey) {
		return prStore.deletePlaceReviewComment(prcKey);
	}

	@Override
	public Place selectOne(int placeKey) {
		return prStore.selectOne(placeKey);
	}

}
