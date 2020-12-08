package com.carping.spring.suggestion.service;

import java.util.ArrayList;

import com.carping.spring.common.PageInfo;
import com.carping.spring.common.Search;
import com.carping.spring.suggestion.domain.Answer;
import com.carping.spring.suggestion.domain.Suggestion;

public interface SuggestionService {
	public ArrayList<Suggestion> selectList(PageInfo pi);
	public Suggestion selectOne(int suggestionKey);
	public int registerSug(Suggestion suggestion);
	public int modifySug(Suggestion suggestion);
	public int deleteSug(Suggestion suggestion);
	public ArrayList<Suggestion> selectSearList(Search search);
	public int insertAnswer(Answer answer);
	public Suggestion selectAnswer(int suggestionKey);
	public int deleteAnswer(Answer answer);
}
