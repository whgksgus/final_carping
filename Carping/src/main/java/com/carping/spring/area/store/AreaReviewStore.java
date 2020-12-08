package com.carping.spring.area.store;

import java.util.ArrayList;

import com.carping.spring.area.domain.Area;
import com.carping.spring.area.domain.AreaReview;
import com.carping.spring.area.domain.AreaReviewComment;
import com.carping.spring.common.PageInfo;
import com.carping.spring.common.Search;

public interface AreaReviewStore {
	public int getListCount();
	public ArrayList<Area> searchAreaReview(Search search);
	public ArrayList<AreaReview> selectAreaReviewList(PageInfo pi, int areaKey);
	public AreaReview selectAreaReviewDetail(int arKey);
	public int insertAreaReview(AreaReview ar);
	public int updateAreaReview(AreaReview ar);
	public int deleteAreaReview(int arKey);
	public int insertAreaReviewComment(AreaReviewComment arc);
	public ArrayList<AreaReviewComment> selectAreaReviewCommentList(int arKey);
	public int deleteAreaReviewComment(int arcKey);
}
