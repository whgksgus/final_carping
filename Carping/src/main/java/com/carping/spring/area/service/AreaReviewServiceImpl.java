package com.carping.spring.area.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carping.spring.area.domain.Area;
import com.carping.spring.area.domain.AreaReview;
import com.carping.spring.area.domain.AreaReviewComment;
import com.carping.spring.area.domain.BoardSearch;
import com.carping.spring.area.domain.PageInfo;
import com.carping.spring.area.store.AreaReviewStore;
import com.carping.spring.common.Search;

@Service
public class AreaReviewServiceImpl implements AreaReviewService {

	@Autowired
	private AreaReviewStore arStore;

	@Override
	public int getAreaListCount(int areaKey) {
		return arStore.getAreaListCount(areaKey);
	}

	@Override
	public int getReviewListCount(Search search) {
		return arStore.getReviewListCount(search);
	}

	@Override
	public int getSearchReviewListCount(BoardSearch boardSearch) {
		return arStore.getSearchReviewListCount(boardSearch);
	}

	@Override
	public int areaReviewHits(int arKey) {
		return arStore.areaReviewHits(arKey);
	}

	@Override
	public ArrayList<Area> searchAreaReview(PageInfo pi, Search search) {
		return arStore.searchAreaReview(pi, search);
	}

	@Override
	public ArrayList<AreaReview> searchAreaBoardReview(PageInfo pi, BoardSearch boardSearch) {
		return arStore.searchAreaBoardReview(pi, boardSearch);
	}

	@Override
	public Area selectOne(int areaKey) {
		return arStore.selectOne(areaKey);
	}

	@Override
	public ArrayList<AreaReview> selectAreaReviewList(PageInfo pi, int areaKey) {
		return arStore.selectAreaReviewList(pi, areaKey);
	}

	@Override
	public AreaReview selectAreaReviewDetail(int arKey) {
		return arStore.selectAreaReviewDetail(arKey);
	}

	@Override
	public int insertAreaReview(AreaReview ar) {
		return arStore.insertAreaReview(ar);
	}

	@Override
	public int updateAreaReview(AreaReview ar) {
		return arStore.updateAreaReview(ar);
	}

	@Override
	public int deleteAreaReview(int arKey) {
		return arStore.deleteAreaReview(arKey);
	}

	@Override
	public int insertAreaReviewComment(AreaReviewComment arc) {
		return arStore.insertAreaReviewComment(arc);
	}

	@Override
	public ArrayList<AreaReviewComment> selectAreaReviewCommentList(int arKey) {
		return arStore.selectAreaReviewCommentList(arKey);
	}

	@Override
	public int deleteAreaReviewComment(int arcKey) {
		return arStore.deleteAreaReviewComment(arcKey);
	}
	
	
}
