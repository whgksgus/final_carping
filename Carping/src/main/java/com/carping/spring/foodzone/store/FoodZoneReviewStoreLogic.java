package com.carping.spring.foodzone.store;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carping.spring.common.Search;
import com.carping.spring.foodzone.domain.BoardSearch;
import com.carping.spring.foodzone.domain.FoodZone;
import com.carping.spring.foodzone.domain.FoodZoneReview;
import com.carping.spring.foodzone.domain.FoodZoneReviewComment;
import com.carping.spring.foodzone.domain.PageInfo;

@Repository
public class FoodZoneReviewStoreLogic implements FoodZoneReviewStore {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<FoodZone> searchFoodZone(PageInfo pi,Search search) {
		int offset = (pi.getCurrentPage() - 1) * pi.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getListLimit());
		return (ArrayList)sqlSession.selectList("FoodZoneMapper.searchList", search, rowBounds);
	}

	@Override
	public ArrayList<FoodZoneReview> selectFoodZoneReviewList(int foodZoneKey, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getListLimit());
		return (ArrayList)sqlSession.selectList("FoodZoneMapper.selectFoodZoneReviewList", foodZoneKey, rowBounds);
	}

	@Override
	public FoodZoneReview selectFoodZoneReviewDetail(int frKey) {
		return sqlSession.selectOne("FoodZoneMapper.foodZoneReviewDetail", frKey);
	}

	@Override
	public int insertFoodZoneReview(FoodZoneReview foodZoneReview) {
		return sqlSession.insert("FoodZoneMapper.insertFoodZone",foodZoneReview);
	}

	@Override
	public int insertFoodZoneReviewComment(FoodZoneReviewComment frc) {
		return sqlSession.insert("FoodZoneMapper.insertFoodZoneReviewComment", frc);
	}

	@Override
	public int updateFoodZoneReview(FoodZoneReview fzr) {
		return sqlSession.update("FoodZoneMapper.updateFoodZoneReview", fzr);
	}

	@Override
	public int deleteFoodZoneReview(int frKey) {
		return sqlSession.delete("FoodZoneMapper.deleteFoodZoneReview", frKey);
	}

	@Override
	public ArrayList<FoodZoneReviewComment> selectFoodZoneReviewCommentList(int frcKey) {
		return (ArrayList)sqlSession.selectList("FoodZoneMapper.selectReviewComment", frcKey);
	}

	@Override
	public int deleteFoodZoneReviewComment(int frcKey) {
		return sqlSession.delete("FoodZoneMapper.deleteReviewComment", frcKey);
	}

	@Override
	public int getListCount(int foodZoneKey) {
		return sqlSession.selectOne("FoodZoneMapper.getFoodZoneReviewListCount", foodZoneKey);
	}

	@Override
	public int foodZoneReviewHits(int frKey) {
		return sqlSession.update("FoodZoneMapper.foodZoneReviewHits",frKey);
	}

	@Override
	public ArrayList<FoodZoneReview> searchFoodZoneBoardReview(PageInfo pi, BoardSearch boardSearch) {
		int offset = (pi.getCurrentPage() - 1) * pi.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getListLimit());
		return (ArrayList)sqlSession.selectList("FoodZoneMapper.selectBoardList", boardSearch, rowBounds);
	}

	@Override
	public int getReviewListCount(Search search) {
		return sqlSession.selectOne("FoodZoneMapper.getReviewListCount", search);
	}
	
}
