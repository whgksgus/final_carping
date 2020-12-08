package com.carping.spring.area.service;

import java.util.ArrayList;

import com.carping.spring.area.domain.Area;
import com.carping.spring.area.domain.AreaReview;
import com.carping.spring.area.domain.AreaReviewComment;
import com.carping.spring.area.store.AreaReviewStore;
import com.carping.spring.common.PageInfo;
import com.carping.spring.common.Search;

public class AreaReviewServiceImpl implements AreaReviewService {

	private AreaReviewStore arStore;
	
	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Area> searchAreaReview(Search search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<AreaReview> selectAreaReviewList(PageInfo pi, int areaKey) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public AreaReview selectAreaReviewDetail(int arKey) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertAreaReview(AreaReview ar) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateAreaReview(AreaReview ar) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteAreaReview(int arKey) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertAreaReviewComment(AreaReviewComment arc) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<AreaReviewComment> selectAreaReviewCommentList(int arKey) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteAreaReviewComment(int arcKey) {
		// TODO Auto-generated method stub
		return 0;
	}

}
