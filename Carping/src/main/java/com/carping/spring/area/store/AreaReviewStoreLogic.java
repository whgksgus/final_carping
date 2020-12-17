package com.carping.spring.area.store;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carping.spring.area.domain.Area;
import com.carping.spring.area.domain.AreaReview;
import com.carping.spring.area.domain.AreaReviewComment;
import com.carping.spring.area.domain.BoardSearch;
import com.carping.spring.area.domain.PageInfo;
import com.carping.spring.common.Search;

@Repository
public class AreaReviewStoreLogic implements AreaReviewStore {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getAreaListCount(int areaKey) {
		return sqlSession.selectOne("AreaMapper.getAreaReviewListCount", areaKey);
	}

	@Override
	public int getReviewListCount(Search search) {
		return sqlSession.selectOne("AreaMapper.getAreaListCount", search);
	}

	@Override
	public int getSearchReviewListCount(BoardSearch boardSearch) {
		return sqlSession.selectOne("AreaMapper.searchBoardListCount", boardSearch);
	}

	@Override
	public int areaReviewHits(int arKey) {
		return sqlSession.update("AreaMapper.areaReviewHits", arKey);
	}

	@Override
	public ArrayList<Area> searchAreaReview(PageInfo pi,
			Search search) {
		int offset = (pi.getCurrentPage() - 1) * pi.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getListLimit());
		return (ArrayList)sqlSession.selectList("AreaMapper.searchList", search, rowBounds);
	}

	@Override
	public ArrayList<AreaReview> searchAreaBoardReview(PageInfo pi,
			BoardSearch boardSearch) {
		int offset = (pi.getCurrentPage() - 1) * pi.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getListLimit());
		return (ArrayList)sqlSession.selectList("AreaMapper.searchBoardList", boardSearch, rowBounds);
	}

	@Override
	public Area selectOne(int areaKey) {
		return sqlSession.selectOne("AreaMapper.selectOne", areaKey);
	}

	@Override
	public ArrayList<AreaReview> selectAreaReviewList(PageInfo pi, int areaKey) {
		int offset = (pi.getCurrentPage() - 1) * pi.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getListLimit());
		return (ArrayList)sqlSession.selectList("AreaMapper.selectAreaReviewList", areaKey, rowBounds);
	}

	@Override
	public AreaReview selectAreaReviewDetail(int arKey) {
		return sqlSession.selectOne("AreaMapper.AreaReviewDetail", arKey);
	}

	@Override
	public int insertAreaReview(AreaReview ar) {
		return sqlSession.insert("AreaMapper.insertAreaReview", ar);
	}

	@Override
	public int updateAreaReview(AreaReview ar) {
		return sqlSession.update("AreaMapper.updateAreaReview", ar);
	}

	@Override
	public int deleteAreaReview(int arKey) {
		return sqlSession.delete("AreaMapper.deleteAreaReview", arKey);
	}

	@Override
	public int insertAreaReviewComment(AreaReviewComment arc) {
		return sqlSession.insert("AreaMapper.arCommentAdd", arc);
	}

	@Override
	public ArrayList<AreaReviewComment> selectAreaReviewCommentList(int arKey) {
		return (ArrayList)sqlSession.selectList("AreaMapper.arCommentList", arKey);
	}

	@Override
	public int deleteAreaReviewComment(int arcKey) {
		return sqlSession.delete("AreaMapper.arCommentDelete", arcKey);
	}
	
	
	
	}
