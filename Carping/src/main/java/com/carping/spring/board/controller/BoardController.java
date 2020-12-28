package com.carping.spring.board.controller;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.carping.spring.board.domain.Board;
import com.carping.spring.board.domain.BoardReply;
import com.carping.spring.board.domain.PageInfo;
import com.carping.spring.board.domain.Pagination;
import com.carping.spring.board.service.BoardService;
import com.carping.spring.common.Search;
import com.carping.spring.member.domain.Member;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
public class BoardController {
	@Autowired
	private BoardService bService;
	
	@RequestMapping(value="reviewInfo.do", method = RequestMethod.GET)
	public String boardInfoView() {
		return "reviewboard/reviewInfo";
	}
	
	@RequestMapping(value="BoardInsertForm.do", method = RequestMethod.GET)
	public String boardWriteView() {
		return "board/boardInsertView";
	}
	
	@RequestMapping(value="BoardInfo.do", method = RequestMethod.GET)
	public ModelAndView selectList(ModelAndView mv,
			@RequestParam(value="page",required = false)Integer page) {
		int currentPage = (page != null) ? page : 1;
		int listCount = bService.getBoardListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		int pageNum = listCount - (currentPage -1 ) * pi.getListLimit();
		ArrayList<Board> bList = bService.selectList(pi);
		if(!bList.isEmpty()) {
			mv.addObject("bList", bList).addObject("pageNum", pageNum).addObject("pi", pi).setViewName("board/boardMain");
		}else {
			mv.setViewName("board/boardMain");
		}
		return mv;
	}
	@RequestMapping(value="boardDetail.do", method = RequestMethod.GET)
	public ModelAndView selectOne(ModelAndView mv, int boardKey) {
		bService.updateCount(boardKey);
		Board board = bService.selectOne(boardKey);
		if(board!=null) {
			mv.addObject("board", board).setViewName("board/boardDetail");
		}else {
			mv.addObject("msg", "오류 발생").addObject("url", "BoardInfo.do").setViewName("common/redirect");
		}
		return mv;
		
	}
	
	@RequestMapping(value="BoardInsert.do", method = RequestMethod.POST)
	public String insertBoard(Board board, Model model, HttpServletRequest request) {
		String url = null;
		int result = 0;
		result = bService.registerBoard(board);
		if(result > 0) {
			url = "redirect:BoardInfo.do";
		}else {
			model.addAttribute("msg", "등록 실패...");
			model.addAttribute("url", "selectList.do");
			url = "common/redirect";
		}
		return url;
	}
	
	@RequestMapping(value="boardUpdateForm.do", method = RequestMethod.GET)
	public ModelAndView updateForm(ModelAndView mv, int boardKey) {
		Board board = bService.selectOne(boardKey);
		mv.addObject("board", board).setViewName("board/boardUpdateForm");
		
		return mv;
	}
	
	@RequestMapping(value="boardUpdate.do", method = RequestMethod.POST)
	public ModelAndView modifyBoard(ModelAndView mv, Board board) {
		int result = 0;
		result = bService.modifyBoard(board);
		if(result > 0) {
			mv.addObject("board", board);
			mv.setViewName("board/boardDetail");
		}else {
			mv.addObject("msg", "오류").addObject("url", "javascript:history.back();").setViewName("common/redirect");
		}
		return mv;
	}
	
	@RequestMapping(value="boardDelete.do")
	public ModelAndView deleteBoard(int boardKey, ModelAndView mv, HttpServletResponse response) {
		int result = bService.deleteBoard(boardKey);
		if(result>0) {
			mv.setViewName("redirect:BoardInfo.do");
		}else {
			mv.addObject("msg", "오류 발생").setViewName("redirect:BoardInfo.do");
		}
		return mv;
	}
	
	@RequestMapping(value="searchBoard.do", method = RequestMethod.GET)
	public ModelAndView selectSearchList(Search search, ModelAndView mv, Integer page) {
		
		int currentPage = (page != null) ? page : 1;
		int listCount = bService.getBoardSearchListCount(search);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		int pageNum = listCount - (currentPage-1)* pi.getListLimit();
		ArrayList<Board> bList = bService.selectSearchList(pi, search);
		if(!bList.isEmpty()) {
			mv.addObject("bList", bList).addObject("search", search).addObject("pageNum", pageNum).addObject("pi", pi).setViewName("board/boardMain");
		}
		return mv;
	}
	@ResponseBody
	@RequestMapping(value="brCommentAdd.do", method = RequestMethod.POST)
	public String insertReply(BoardReply reply, HttpSession session) {
		int result = 0;
		Member loginUser = (Member)session.getAttribute("loginUser");
		String brWriter = loginUser.getMemberId();
		reply.setBrWriter(brWriter);
		result = bService.insertReply(reply);
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	@ResponseBody
	@RequestMapping(value="brCommentList.do", method =  RequestMethod.GET)
	public void selectReplyList(int boardKey, HttpServletResponse response) throws Exception {
		ArrayList<BoardReply> brList = bService.selectReplyList(boardKey);
		for(BoardReply bReply : brList) {
			bReply.setBrContent(URLEncoder.encode(bReply.getBrContent(), "utf-8"));
		}
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(brList, response.getWriter());
	}
	@ResponseBody
	@RequestMapping(value="brCommentDelete.do", method = RequestMethod.GET)
	public String deleteReply(int brKey, Model model) {
		int result = bService.deleteReply(brKey);
		if(result>0) {
			return "success";
		}else {
			return "fail";
		}
	}
}
