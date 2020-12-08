package com.carping.spring.board.service;

import java.util.ArrayList;

import com.carping.spring.board.domain.Board;
import com.carping.spring.board.domain.BoardReply;
import com.carping.spring.common.PageInfo;
import com.carping.spring.common.Search;

public interface BoardService {
	public ArrayList<Board> selectList(PageInfo pi);
	public Board selectOne(int boardKey);
	public int registerBoard(Board board);
	public int modifyBoard(Board board);
	public int deleteBoard(int boardKey);
	public ArrayList<Board> selectSearchList(Search search);
	public int insertReply(BoardReply reply);
	public ArrayList<BoardReply> selectReplyList(int boardKey);
	public int deleteReply(BoardReply reply);
}
