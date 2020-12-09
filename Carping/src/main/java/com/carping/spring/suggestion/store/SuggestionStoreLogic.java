package com.carping.spring.suggestion.store;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carping.spring.common.PageInfo;
import com.carping.spring.common.Search;
import com.carping.spring.suggestion.domain.Answer;
import com.carping.spring.suggestion.domain.Suggestion;

@Repository
public class SuggestionStoreLogic implements SuggestionStore {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Suggestion> selectList(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Suggestion selectOne(int suggestionKey) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int registerSug(Suggestion suggestion) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modifySug(Suggestion suggestion) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteSug(Suggestion suggestion) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Suggestion> selectSearList(Search search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertAnswer(Answer answer) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Suggestion selectAnswer(int suggestionKey) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteAnswer(Answer answer) {
		// TODO Auto-generated method stub
		return 0;
	}


}
