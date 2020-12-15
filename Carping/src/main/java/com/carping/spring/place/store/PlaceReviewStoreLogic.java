package com.carping.spring.place.store;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carping.spring.common.Search;
import com.carping.spring.place.domain.BoardSearch;
import com.carping.spring.place.domain.PageInfo;
import com.carping.spring.place.domain.Place;
import com.carping.spring.place.domain.PlaceReview;
import com.carping.spring.place.domain.PlaceReviewComment;

@Repository
public class PlaceReviewStoreLogic implements PlaceReviewStore {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int getPlaceListCount(int placeKey) {
		return sqlSession.selectOne("PlaceMapper.getplaceReviewListCount", placeKey);
	}
	
	@Override
	public int getReviewListCount(Search search) {	
		return sqlSession.selectOne("PlaceMapper.getplaceListCount", search);
	}
	
	@Override
	public int getSearchReviewListCount(BoardSearch boardSearch) {
		int result = sqlSession.selectOne("PlaceMapper.searchBoardListCount", boardSearch);
		return result;
	}
	
	@Override
	public int placeReviewHits(int prKey) {
		return sqlSession.update("PlaceMapper.placeReviewHits", prKey);
	}
 
	@Override
	public ArrayList<Place> searchPlaceReview(PageInfo pi, Search search) {
		int offset = (pi.getCurrentPage() - 1) * pi.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getListLimit());
		return (ArrayList)sqlSession.selectList("PlaceMapper.searchList", search, rowBounds);
	}
	
	@Override
	public ArrayList<PlaceReview> searchPlaceBoardReview(PageInfo pi, BoardSearch boardSearch) {
		int offset = (pi.getCurrentPage() - 1) * pi.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getListLimit());
		return (ArrayList)sqlSession.selectList("PlaceMapper.searchBoardList", boardSearch, rowBounds);
	}

	@Override
	public ArrayList<PlaceReview> selectPlaceReviewList(PageInfo pi, int placeKey) {
		int offset = (pi.getCurrentPage() - 1) * pi.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getListLimit());
		return (ArrayList)sqlSession.selectList("PlaceMapper.selectPlaceReviewList", placeKey, rowBounds);
	}

	@Override
	public PlaceReview selectPlaceReviewDetail(int prKey) {
		return sqlSession.selectOne("PlaceMapper.PlaceReviewDetail", prKey);
	}

	@Override
	public int insertPlaceReview(PlaceReview pr) {
		return sqlSession.insert("PlaceMapper.insertPlaceReview", pr);
	}

	@Override
	public int updatePlaceReview(PlaceReview pr) {
		return sqlSession.update("PlaceMapper.updatePlaceReview", pr);
	}

	@Override
	public int deletePlaceReview(int prKey) {
		return sqlSession.delete("PlaceMapper.deletePlaceReview", prKey);
	}

	@Override
	public int insertPlaceReviewComment(PlaceReviewComment prc) {
		return sqlSession.insert("PlaceMapper.prCommentAdd", prc);
	}

	@Override
	public ArrayList<PlaceReviewComment> selectPlaceReviewCommentList(int prKey) {
		return (ArrayList)sqlSession.selectList("PlaceMapper.prCommentList", prKey);
	}

	@Override
	public int deletePlaceReviewComment(int prcKey) {
		return sqlSession.delete("PlaceMapper.prCommentDelete", prcKey);
	}

	@Override
	public Place selectOne(int placeKey) {
		return sqlSession.selectOne("PlaceMapper.selectOne", placeKey);
	}

}
