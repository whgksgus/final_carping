package com.carping.spring.board.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.carping.spring.board.domain.Board;
import com.carping.spring.board.domain.BoardReply;
import com.carping.spring.board.service.BoardService;
import com.carping.spring.common.Search;

@Controller
public class BoardController {
	@Autowired
	private BoardService bService;
	
	@RequestMapping(value="reviewInfo.do", method = RequestMethod.GET)
	public String boardInfoView() {
		return "reviewboard/reviewInfo";
	}
	
	public String boardWriteView() {
		return "";
	}
	
	public ModelAndView selectList(ModelAndView mv,
			@RequestParam(value="page",required = false)Integer page) {
		return mv;
	}
	
	public String selectOne(int boardKey) {
		return "";
	}
	
	public String insertBoard(Board board, Model model, HttpServletRequest request) {
		return "";
	}
	
	public String modifyBoard(Board board, Model model) {
		return "";
	}
	
	public String deleteBoard(int boardKey, Model model) {
		return "";
	}
	
	public String selectSearchList(Search search, Model model) {
		return "";
	}
	
	public String insertReply(BoardReply reply, Model model) {
		return "";
	}
	
	public String selectReplyList(int boardKey, Model model) {
		return "";
	}
	
	public String deleteReply(int boardKey, Model model) {
		return "";
	}
}
