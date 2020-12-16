package com.carping.spring.suggestion.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.carping.spring.common.Search;
import com.carping.spring.suggestion.domain.Answer;
import com.carping.spring.suggestion.domain.PageInfo;
import com.carping.spring.suggestion.domain.Pagination;
import com.carping.spring.suggestion.domain.Suggestion;
import com.carping.spring.suggestion.service.SuggestionService;

@Controller
public class SuggestionController {
	
	@Autowired
	private SuggestionService sService;
	
	// 건의사항 등록 페이지로 이동
	@RequestMapping(value="sugInsertView.do", method=RequestMethod.POST)
		public String sugWriteView() {
			return "suggestion/sugInsert";
		}
	
	// 건의사항 수정 페이지로 이동
	@RequestMapping(value="sugUpdate.do", method=RequestMethod.GET)
	public String sugInfoView() {
		return "suggestion/sugList";
	}
	
	// 건의사항 리스트
	@RequestMapping(value="selectList.do", method=RequestMethod.GET)
	public ModelAndView selectList(ModelAndView mv, @RequestParam(value="page", required = false)Integer page) {
		int currentPage = (page != null) ? page : 1;
		int listCount = sService.getSugListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		int pageNum = listCount - (currentPage -1) * pi.getListLimit();
		ArrayList<Suggestion> sugList = sService.selectList(pi);
		if(!sugList.isEmpty()) {
			mv.addObject("sList", sugList);
			mv.addObject("pageNum", pageNum);
			mv.addObject("pi", pi);
			mv.setViewName("suggestion/sugList");
		}else {
			mv.setViewName("suggestion/sugList");
		}
		return mv;
	}
	
	// 건의사항 상세보기
	@RequestMapping(value="selectOne.do", method=RequestMethod.GET)
	public ModelAndView selectOne(ModelAndView mv, int suggestionKey) {
		sService.sugCount(suggestionKey);
		Suggestion sug = sService.selectOne(suggestionKey);
		if (sug != null) {
			mv.addObject("sList", sug);
			mv.setViewName("suggestion/sugDetail");
		}else {
			mv.addObject("msg", "건의사항 상세보기 실패!");
			mv.addObject("url", "selectList.do");
			mv.setViewName("common/redirect");
		}
		return mv;
	}
	
	
	// 건의사항 등록 메소드
	@RequestMapping(value="sugInsert.do", method=RequestMethod.POST)
	public String insertSug(Suggestion suggestion, Model model, HttpServletRequest request) {
		String url = null;
		int result = sService.insertSug(suggestion);
		if (result > 0 ) {
			url = "redirect:selectList.do";
		}else {
			model.addAttribute("msg", "건의사항 등록에 실패하였습니다.");
			model.addAttribute("url", "selectList.do");
			url = "common/redirect";
		}
		return url;
	}
	
	public String modifySug(Suggestion suggestion, Model model) {
		return "";
	}
	
	public String deleteSug(int suggestionKey, Model model) {
		return "";
	}
	
	public String selectSearchList(Search search, Model model) {
		return "";
	}
	
	public String insertAnswer(Answer answer, Model model) {
		return "";
	}
	
	public String selectAnswer(int suggestionKey, Model model) {
		return "";
	}
	
	public String deleteAnswer(int suggestionKey, Model model) {
		return "";
	}
}
