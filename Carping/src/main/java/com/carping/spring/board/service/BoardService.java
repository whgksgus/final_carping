package com.carping.spring.board.service;

import java.util.ArrayList;

import com.carping.spring.board.domain.Board;
import com.carping.spring.board.domain.BoardReply;
import com.carping.spring.board.domain.PageInfo;
import com.carping.spring.common.Search;

public interface BoardService {
	public ArrayList<Board> selectList(PageInfo pi);
	public int updateCount(int boardKey);
	public Board selectOne(int boardKey);
	public int registerBoard(Board board);
	public int modifyBoard(Board board);
	public int deleteBoard(int boardKey);
	public ArrayList<Board> selectSearchList(PageInfo pi, Search search);
	public int insertReply(BoardReply reply);
	public ArrayList<BoardReply> selectReplyList(int boardKey);
	public int deleteReply(int brKey);
	public int getBoardListCount();
	public int getBoardSearchListCount(Search search);
}
