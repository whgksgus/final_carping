package com.carping.spring.board.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carping.spring.board.domain.Board;
import com.carping.spring.board.domain.BoardReply;
import com.carping.spring.board.domain.PageInfo;
import com.carping.spring.board.store.BoardStore;
import com.carping.spring.common.Search;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardStore bStore;
	
	@Override
	public ArrayList<Board> selectList(PageInfo pi) {
		return bStore.selectList(pi);
	}

	@Override
	public Board selectOne(int boardKey) {
		return bStore.selectOne(boardKey);
	}

	@Override
	public int registerBoard(Board board) {
		return bStore.registerBoard(board);
	}

	@Override
	public int modifyBoard(Board board) {
		return bStore.modifyBoard(board);
	}

	@Override
	public int deleteBoard(int boardKey) {
		return bStore.deleteBoard(boardKey);
	}

	@Override
	public ArrayList<Board> selectSearchList(PageInfo pi, Search search) {
		return bStore.selectSearchList(pi, search);
	}

	@Override
	public int insertReply(BoardReply reply) {
		return bStore.insertReply(reply);
	}

	@Override
	public ArrayList<BoardReply> selectReplyList(int boardKey) {
		return bStore.selectReplyList(boardKey);
	}

	@Override
	public int deleteReply(int brKey) {
		return bStore.deleteReply(brKey);
	}


	@Override
	public int getBoardListCount() {
		return bStore.getBoardListCount();
	}

	@Override
	public int getBoardSearchListCount(Search search) {
		return bStore.getBoardSearchListCount(search);
	}

}
