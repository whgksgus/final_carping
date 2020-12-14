package com.carping.spring.area.store;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carping.spring.area.domain.Area;
import com.carping.spring.area.domain.AreaReview;
import com.carping.spring.common.PageInfo;
import com.carping.spring.common.Search;
import com.carping.spring.foodzone.domain.FoodZone;
import com.carping.spring.place.domain.Place;

@Repository
public class AreaStoreLogic implements AreaStore {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Area> searchArea(Search search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Area selectAreaInfo(String areaName) {
		Area area = sqlSession.selectOne("AreaMapper.selectArea", areaName);
		return area;
	}

	@Override
	public AreaReview selectAreaReview(int arKey) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Place selectPlaceInfo(int placeKey) {
		System.out.println(placeKey);
		return sqlSession.selectOne("AreaMapper.selectP", placeKey);
	}

	@Override
	public FoodZone selectFoodZoneInfo(int foodZoneKey) {
		return sqlSession.selectOne("AreaMapper.selectFz", foodZoneKey);
	}

	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		return 0;
	} 

	@Override
	public ArrayList<AreaReview> selectAreaReviewList(int areaKey) {
		return (ArrayList)sqlSession.selectList("AreaMapper.selectArList", areaKey);
	}

	@Override
	public double selectAreaReviewScoreAvg(int areaKey) {
		return sqlSession.selectOne("AreaMapper.selectAreaAvg", areaKey);
	}

	@Override
	public int updateAreaScoreAvg(int areaKey, int scoreAvg) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertArea(Area area) {
		return sqlSession.insert("AreaMapper.insertArea", area);
	}

	@Override
	public ArrayList<Area> selectAreaList() {
		return (ArrayList)sqlSession.selectList("AreaMapper.selectList");
	}

	@Override
	public ArrayList<FoodZone> selectFoodZoneList(String areaAddress) {
		return (ArrayList)sqlSession.selectList("AreaMapper.selectFzList", areaAddress);
	}

	@Override
	public ArrayList<Place> selectPlaceList(String areaAddress) {
		return (ArrayList)sqlSession.selectList("AreaMapper.selectPList", areaAddress);
	}

}
