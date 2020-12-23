package com.carping.spring.suggestion.service;

import java.util.ArrayList;

import com.carping.spring.common.Search;
import com.carping.spring.suggestion.domain.Answer;
import com.carping.spring.suggestion.domain.PageInfo;
import com.carping.spring.suggestion.domain.Suggestion;

public interface SuggestionService {
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
	public Answer selectAnswer(int suggestionKey);
	public int updateAnswer(Answer answer);
	public int deleteAnswer(int suggestionKey);
	public int updateOne(int suggestionKey);
	public int updateZero(int suggestionKey);
}
