package com.carping.spring.board.store;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.carping.spring.board.domain.Board;
import com.carping.spring.board.domain.BoardReply;
import com.carping.spring.common.PageInfo;
import com.carping.spring.common.Search;

public class BoardStoreLogic implements BoardStore {

	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Board> selectList(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Board selectOne(int boardKey) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int registerBoard(Board board) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modifyBoard(Board board) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBoard(int boardKey) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Board> selectSearchList(Search search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertReply(BoardReply reply) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<BoardReply> selectReplyList(int boardKey) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteReply(BoardReply reply) {
		// TODO Auto-generated method stub
		return 0;
	}

}
