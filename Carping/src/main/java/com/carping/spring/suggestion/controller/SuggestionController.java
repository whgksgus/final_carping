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
	@RequestMapping(value="sugUpdateView.do", method=RequestMethod.GET)
	public ModelAndView sugUpdateView(ModelAndView mv, int suggestionKey) {
		Suggestion sug = sService.selectOne(suggestionKey);
		mv.addObject("sList", sug);
		mv.setViewName("suggestion/sugUpdate");
		return mv;
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
		Answer answer = sService.selectAnswer(suggestionKey);
		if (sug != null) {
			mv.addObject("sList", sug);
			mv.addObject("answer", answer);
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
	
	// 건의사항 수정 메소드
	@RequestMapping(value="sugUpdate.do", method=RequestMethod.POST)
	public ModelAndView updateSug(ModelAndView mv, Suggestion suggestion, int suggestionKey) {
		int result = sService.modifySug(suggestion);
		Suggestion sug = sService.selectOne(suggestionKey);
		if(result > 0) {
			mv.addObject("sList", sug);
			mv.setViewName("suggestion/sugDetail");
		}else {
			mv.addObject("msg", "건의사항 수정 실패! 새로고침 후 다시 실행해주세요");
			mv.addObject("url", "javascript:history.back();");
			mv.setViewName("common/redirect");
		}
		return mv;
	}
	
	// 건의사항 삭제 메소드
	@RequestMapping(value="sugDelete.do", method=RequestMethod.GET)
	public ModelAndView deleteSug(ModelAndView mv, int suggestionKey, Model model) {
		int result = sService.deleteSug(suggestionKey);
		if(result > 0) {
			mv.setViewName("redirect:selectList.do");
		}else {
			mv.addObject("msg", "건의사항 삭제 실패! 새로고침 후 다시 실행해주세요");
			mv.setViewName("redirect:selectList.do");
		}
		return mv;
	}
	
	// 건의사항 검색 메소드
	@RequestMapping(value="sugSearchList.do", method=RequestMethod.GET)
	public String selectSearchList(Search search, Model model, Integer page) {
		int currentPage = (page != null) ? page : 1;
		int listCount = sService.getSugSearchList(search);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		int pageNum = listCount - (currentPage -1) * pi.getListLimit();
		ArrayList<Suggestion> sugsearch = sService.selectSearList(pi, search);
		if(!sugsearch.isEmpty()) {
			model.addAttribute("sList", sugsearch);
			model.addAttribute("search", search);
			model.addAttribute("pageNum", pageNum);
			model.addAttribute("pi", pi);
			return "suggestion/sugList";
		}else {
			return "suggestion/sugList";
		}
	}
	
	// 건의사항 답변 등록화면
	@RequestMapping(value="insertAnswerView.do", method=RequestMethod.GET)
	public String insertAnswerView(Model model, int suggestionKey) {
		model.addAttribute("suggestionKey", suggestionKey);
		return "suggestion/answerInsert";
	}

	// 건의사항 답변 등록
	@RequestMapping(value="insertAnswer.do", method=RequestMethod.POST)
	public ModelAndView insertAnswer(ModelAndView mv, Answer answer, Model model, int suggestionKey) {
		int result = sService.insertAnswer(answer);
		sService.updateOne(suggestionKey);
		Suggestion sug = sService.selectOne(suggestionKey);
		Answer ans = sService.selectAnswer(suggestionKey);
		if(result > 0) {
			mv.addObject("sList", sug);
			mv.addObject("answer", ans);
			mv.setViewName("suggestion/sugDetail");
		}else {
			mv.addObject("msg", "답변 등록에 실패하였습니다");
			mv.addObject("url", "javascript:history.back();");
			mv.setViewName("common/redirect");
		}
		return mv;
	}
	
	// 건의사항 답변 수정화면
	@RequestMapping(value="updateAnswerView.do", method=RequestMethod.GET)
	public String updateAnswerView(Model model, int suggestionKey) {
		Answer answer = sService.selectAnswer(suggestionKey);
		model.addAttribute("answer", answer);
		return "suggestion/answerUpdate";
	}
		
	// 건의사항 답변 수정 메소드
	@RequestMapping(value="updateAnswer.do", method=RequestMethod.POST)
	public ModelAndView updateAnswer(ModelAndView mv, Answer answer, int suggestionKey) {
		int result = sService.updateAnswer(answer);
		Suggestion sug = sService.selectOne(suggestionKey);
		Answer answer1 = sService.selectAnswer(suggestionKey);
		if(result > 0) {
			mv.addObject("sList", sug);
			mv.addObject("answer", answer1);
			mv.setViewName("suggestion/sugDetail");
		}else {
			mv.addObject("msg", "답변 수정 실패! 새로고침 후 다시 실행해주세요");
			mv.addObject("url", "javascript:history.back();");
			mv.setViewName("common/redirect");
		}
		return mv;
	}
	
	
	@RequestMapping(value="deleteAnswer.do", method=RequestMethod.GET)
	// 건의사항 답변 삭제
	public String deleteAnswer(int suggestionKey, Model model) {
		int result = sService.deleteAnswer(suggestionKey);
		sService.updateZero(suggestionKey);
		Suggestion sug = sService.selectOne(suggestionKey);
		if(result > 0) {
			model.addAttribute("sList", sug);
			return "suggestion/sugDetail";
		}else {
			model.addAttribute("msg", "답변 삭제에 실패하였습니다.");
			model.addAttribute("url", "selectList.do");
			return "common/redirect";
		}
	}
}
