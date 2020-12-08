package com.carping.spring.suggestion.service;

import java.util.ArrayList;

import com.carping.spring.common.PageInfo;
import com.carping.spring.common.Search;
import com.carping.spring.suggestion.domain.Answer;
import com.carping.spring.suggestion.domain.Suggestion;
import com.carping.spring.suggestion.store.SuggestionStore;

public class SuggestionServiceImpl implements SuggestionService {

	private SuggestionStore sStore;
	
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
