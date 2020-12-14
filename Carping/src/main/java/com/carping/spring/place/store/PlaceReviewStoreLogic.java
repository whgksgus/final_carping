package com.carping.spring.place.store;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carping.spring.common.PageInfo;
import com.carping.spring.common.Search;
import com.carping.spring.place.domain.Place;
import com.carping.spring.place.domain.PlaceReview;
import com.carping.spring.place.domain.PlaceReviewComment;

@Repository
public class PlaceReviewStoreLogic implements PlaceReviewStore {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		return 0;
	}
 
	@Override
	public ArrayList<Place> searchPlaceReview(Search search) {
		return (ArrayList)sqlSession.selectList("PlaceMapper.searchList", search);
	}

	@Override
	public ArrayList<PlaceReview> selectPlaceReviewList(PageInfo pi, int placeKey) {
		return (ArrayList)sqlSession.selectList("PlaceMapper.selectPlaceReviewList", placeKey);
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
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Place selectOne(int placeKey) {
		return sqlSession.selectOne("PlaceMapper.selectOne", placeKey);
	}

}
