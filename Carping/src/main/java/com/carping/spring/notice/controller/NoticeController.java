package com.carping.spring.notice.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.carping.spring.common.Search;
import com.carping.spring.member.domain.Member;
import com.carping.spring.notice.domain.Notice;
import com.carping.spring.notice.domain.PageInfo;
import com.carping.spring.notice.domain.Pagination;
import com.carping.spring.notice.service.NoticeService;


@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService nService;
	
	
	@RequestMapping(value="noticeWriteView.do", method=RequestMethod.GET)
	public String noticeWriteView() {
		return "notice/noticeWriteForm";
	}
	@RequestMapping(value="noticeInsert.do", method=RequestMethod.POST)
	public String noticeInsert(Notice notice, Model model, HttpServletRequest request) {
		int result=0;
		String path = null;
		result = nService.insertNotice(notice);
		if (result>0) {
			path = "redirect:noticeList.do";
		} else {
			model.addAttribute("msg", "공지사항 등록 실패");
			path = "common/errorPage";
	}
	return path;
}
	
	// 공지사항 목록
	@RequestMapping(value="noticeList.do", method=RequestMethod.GET)
	public ModelAndView noticeList(ModelAndView mv, @RequestParam(value="page", required=false) Integer page) {
		int currentPage = (page != null) ? page : 1;
	    int listCount = nService.getListCount();
	    PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Notice> nList = nService.selectList(pi);
		if(!nList.isEmpty()) {
			mv.addObject("nList", nList);
		    mv.addObject("pi", pi);
			mv.setViewName("notice/noticeListView");
		}else {
			mv.addObject("msg", "공지사항 목록조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping( value="noticeSearch.do", method=RequestMethod.GET )
	public String noticeSearch(Search search, Model model) {
		ArrayList<Notice> searchList = nService.selectSearchList(search);
		if(!searchList.isEmpty()) {
			model.addAttribute("nList", searchList);
			model.addAttribute("search", search);
			return "notice/noticeListView";
		}else {
			model.addAttribute("msg", "자유게시판 검색 실패");
			return "common/erroePage";
		}
	}
	
	
	// 공지글 상세 조회
	@RequestMapping(value="noticeDetail.do", method=RequestMethod.GET)
	public ModelAndView noticeDetail( int nKey, ModelAndView mv, Integer page ) {
		int currentPage = page != null ? page : 1;
		nService.addReadCount(nKey);
		Notice notice = nService.selectNotice(nKey);
		if(notice != null) {
			mv.addObject("notice", notice).addObject("currentPage", currentPage).setViewName("notice/noticeDetailView");
		}else {
			mv.addObject("msg", "자유게시판 상세조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	

	public String noticeDelete(int nKey, Model model, HttpServletRequest request) {
		return "";
	}
	
	public String noticeUpdateView(int nKey, Model model) {
		return "";
	}
	
	public String noticeUpdate(Notice notcie, Model model, HttpServletRequest request) {
		return "";
	}

}
