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
	private PlaceReviewStore pStore;
	
	@Override
	public int getPlaceListCount(int placeKey) {
		return pStore.getPlaceListCount(placeKey);
	}

	@Override
	public int getReviewListCount(Search search) {
		return pStore.getReviewListCount(search);
	}
	
	
	@Override
	public int getSearchReviewListCount(BoardSearch boardSearch) {
		return pStore.getSearchReviewListCount(boardSearch);
	}
	
	@Override
	public int placeReviewHits(int prKey) {
		return pStore.placeReviewHits(prKey);
	}

	@Override
	public ArrayList<Place> searchPlaceReview(PageInfo pi, Search search) {
		return pStore.searchPlaceReview(pi, search);
	}
	
	@Override
	public ArrayList<PlaceReview> searchPlaceBoardReview(PageInfo pi, BoardSearch boardSearch) {
		return pStore.searchPlaceBoardReview(pi, boardSearch);
	}

	@Override
	public ArrayList<PlaceReview> selectPlaceReviewList(PageInfo pi, int placeKey) {
		return pStore.selectPlaceReviewList(pi, placeKey);
	}

	@Override
	public PlaceReview selectPlaceReviewDetail(int prKey) {
		return pStore.selectPlaceReviewDetail(prKey);
	}

	@Override
	public int insertPlaceReview(PlaceReview pr) {
		return pStore.insertPlaceReview(pr);
	}

	@Override
	public int updatePlaceReview(PlaceReview pr) {
		return pStore.updatePlaceReview(pr);
	}

	@Override
	public int deletePlaceReview(int prKey) {
		return pStore.deletePlaceReview(prKey);
	}

	@Override
	public int insertPlaceReviewComment(PlaceReviewComment prc) {
		return pStore.insertPlaceReviewComment(prc);
	}

	@Override
	public ArrayList<PlaceReviewComment> selectPlaceReviewCommentList(int prKey) {
		return pStore.selectPlaceReviewCommentList(prKey);
	}

	@Override
	public int deletePlaceReviewComment(int prcKey) {
		return pStore.deletePlaceReviewComment(prcKey);
	}

	@Override
	public Place selectOne(int placeKey) {
		return pStore.selectOne(placeKey);
	}

}
