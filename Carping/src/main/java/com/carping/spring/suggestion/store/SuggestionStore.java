 package com.carping.spring.suggestion.store;

import java.util.ArrayList;

import com.carping.spring.common.Search;
import com.carping.spring.suggestion.domain.Answer;
import com.carping.spring.suggestion.domain.PageInfo;
import com.carping.spring.suggestion.domain.Suggestion;

public interface SuggestionStore {
	public int getSugListCount();
	public int getSugSearchList(Search search);
	public int sugCount(int suggestionKey);
	public ArrayList<Suggestion> selectList(PageInfo pi);
	public Suggestion selectOne(int suggestionKey);
	public int insertSug(Suggestion suggestion);
	public int modifySug(Suggestion suggestion);
	public int deleteSug(int suggestionKey);
	public ArrayList<Suggestion> selectSearList(PageInfo pi, Search search);
	public int insertAnswer(Answer answer);
	public Suggestion selectAnswer(int suggestionKey);
	public int deleteAnswer(Answer answer);
}
