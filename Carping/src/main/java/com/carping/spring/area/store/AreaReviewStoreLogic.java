package com.carping.spring.area.store;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carping.spring.area.domain.Area;
import com.carping.spring.area.domain.AreaReview;
import com.carping.spring.area.domain.AreaReviewComment;
import com.carping.spring.area.domain.BoardSearch;

@Repository
public class AreaReviewStoreLogic implements AreaReviewStore {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getAreaListCount(int areaKey) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getReviewListCount(com.carping.spring.area.domain.Search search) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getSearchReviewListCount(BoardSearch boardSearch) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int areaReviewHits(int arKey) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Area> searchAreaReview(com.carping.spring.area.domain.PageInfo pi,
			com.carping.spring.area.domain.Search search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<AreaReview> searchAreaBoardReview(com.carping.spring.area.domain.PageInfo pi,
			BoardSearch boardSearch) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Area selectOne(int areaKey) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Area> selectAreaReviewList(com.carping.spring.area.domain.PageInfo pi, int areaKey) {
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
