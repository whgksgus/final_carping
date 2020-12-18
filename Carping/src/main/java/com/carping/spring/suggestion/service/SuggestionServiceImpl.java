package com.carping.spring.suggestion.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carping.spring.common.Search;
import com.carping.spring.suggestion.domain.Answer;
import com.carping.spring.suggestion.domain.PageInfo;
import com.carping.spring.suggestion.domain.Suggestion;
import com.carping.spring.suggestion.store.SuggestionStore;

@Service
public class SuggestionServiceImpl implements SuggestionService {

	@Autowired
	private SuggestionStore sStore;
	
	@Override
	public int getSugListCount() {
		return sStore.getSugListCount();
	}

	@Override
	public int getSugSearchList(Search search) {
		return sStore.getSugSearchList(search);
	}

	@Override
	public int sugCount(int suggestionKey) {
		return sStore.sugCount(suggestionKey);
	}
	
	@Override
	public ArrayList<Suggestion> selectList(PageInfo pi) {
		return sStore.selectList(pi);
	}

	@Override
	public Suggestion selectOne(int suggestionKey) {
		return sStore.selectOne(suggestionKey);
	}

	@Override
	public int insertSug(Suggestion suggestion) {
		return sStore.insertSug(suggestion);
	}

	@Override
	public int modifySug(Suggestion suggestion) {
		return sStore.modifySug(suggestion);
	}

	@Override
	public int deleteSug(int suggestionKey) {
		return sStore.deleteSug(suggestionKey);
	}

	@Override
	public ArrayList<Suggestion> selectSearList(PageInfo pi, Search search) {
		return sStore.selectSearList(pi, search);
	}

	@Override
	public int insertAnswer(Answer answer) {
		return sStore.insertAnswer(answer);
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
