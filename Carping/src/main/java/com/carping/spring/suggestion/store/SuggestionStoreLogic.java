package com.carping.spring.suggestion.store;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carping.spring.common.Search;
import com.carping.spring.suggestion.domain.Answer;
import com.carping.spring.suggestion.domain.PageInfo;
import com.carping.spring.suggestion.domain.Suggestion;

@Repository
public class SuggestionStoreLogic implements SuggestionStore {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int getSugListCount() {
		return sqlSession.selectOne("Suggestion.getSugListCount");
	}

	@Override
	public int getSugSearchList(Search search) {
		int result = sqlSession.selectOne("Suggestion.getSearchList", search);
		return result;
	}

	@Override
	public int sugCount(int suggestionKey) {
		return sqlSession.update("Suggestion.sugHitsCount", suggestionKey);
	}
	
	@Override
	public ArrayList<Suggestion> selectList(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getListLimit());
		return (ArrayList)sqlSession.selectList("Suggestion.selectList", null, rowBounds);
	}


	@Override
	public Suggestion selectOne(int suggestionKey) {
		return sqlSession.selectOne("Suggestion.selectOne", suggestionKey);
	}

	@Override
	public int insertSug(Suggestion suggestion) {
		return sqlSession.insert("Suggestion.insertSug", suggestion);
	}

	@Override
	public int modifySug(Suggestion suggestion) {
		return sqlSession.update("Suggestion.updateSug", suggestion);
	}

	@Override
	public int deleteSug(int suggestionKey) {
		return sqlSession.delete("Suggestion.deleteSug", suggestionKey);
	}

	@Override
	public ArrayList<Suggestion> selectSearList(PageInfo pi, Search search) {
		int offset = (pi.getCurrentPage() - 1) * pi.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getListLimit());
		return (ArrayList)sqlSession.selectList("Suggestion.searchSugList", search, rowBounds);
	}

	@Override
	public int insertAnswer(Answer answer) {
		return sqlSession.insert("Suggestion.insertAnswer", answer);
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
