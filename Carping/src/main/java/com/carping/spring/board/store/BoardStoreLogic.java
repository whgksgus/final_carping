package com.carping.spring.board.store;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;

import com.carping.spring.board.domain.Board;
import com.carping.spring.board.domain.BoardReply;
import com.carping.spring.board.domain.PageInfo;
import com.carping.spring.common.Search;

@Repository
public class BoardStoreLogic implements BoardStore {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Board> selectList(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getListLimit());
		return (ArrayList)sqlSession.selectList("BoardMapper.selectList", null, rowBounds);
				
	}

	@Override
	public Board selectOne(int boardKey) {
		return sqlSession.selectOne("BoardMapper.selectOne", boardKey);
	}

	@Override
	public int registerBoard(Board board) {
		return sqlSession.insert("BoardMapper.insertBoard", board);
	}

	@Override
	public int modifyBoard(Board board) {
		return sqlSession.update("BoardMapper.updateBoard", board);
	}

	@Override
	public int deleteBoard(int boardKey) {
		return sqlSession.delete("BoardMapper.deleteBoard", boardKey);
	}

	@Override
	public ArrayList<Board> selectSearchList(PageInfo pi, Search search) {
		int offset = (pi.getCurrentPage() - 1) * pi.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getListLimit());
		return (ArrayList)sqlSession.selectList("BoardMapper.searchBoardList", search, rowBounds);
	}

	@Override
	public int insertReply(BoardReply reply) {
		return sqlSession.insert("BoardMapper.insertReply", reply);
	}

	@Override
	public ArrayList<BoardReply> selectReplyList(int boardKey) {
		return (ArrayList)sqlSession.selectList("BoardMapper.selectReplyList", boardKey);
	}

	@Override
	public int deleteReply(int brKey) {
		return sqlSession.delete("BoardMapper.deleteReply", brKey);
	}

	@Override
	public int getBoardListCount() {
		return sqlSession.selectOne("BoardMapper.getBoardListCount");
	}

	@Override
	public int getBoardSearchListCount(Search search) {
		return sqlSession.selectOne("BoardMapper.searchListCount", search);
	}

}
