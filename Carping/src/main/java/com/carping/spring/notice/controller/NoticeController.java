package com.carping.spring.notice.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.carping.spring.common.Search;
import com.carping.spring.notice.domain.Notice;
import com.carping.spring.notice.domain.PageInfo;
import com.carping.spring.notice.domain.Pagination;
import com.carping.spring.notice.service.NoticeService;


@Controller
public class NoticeController {

	@Autowired
	private NoticeService nService;

	// 공지사항 작성 폼 연결
	@RequestMapping(value="noticeWriteView.do", method=RequestMethod.GET)
	public String noticeWriteView() {
		return "notice/noticeWriteForm";
	}

	// 공지사항 작성 
	@RequestMapping(value="noticeInsert.do", method=RequestMethod.POST)
	public String noticeInsert(Notice notice, Model model, HttpServletRequest request) {
		int result=0;
		String path = null;
		result = nService.insertNotice(notice);
		if (result>0) {
			path = "redirect:noticeList.do";
		} else {
			model.addAttribute("msg", "공지사항 등록 실패");
			path = "redirect:noticeList.do";
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
			mv.setViewName("redirect:noticeList.do");
		}
		return mv;
	}

	// 공지사항 검색
	@RequestMapping( value="noticeSearch.do", method=RequestMethod.GET )
	public String noticeSearch(Search search, Model model) {
		ArrayList<Notice> searchList = nService.selectSearchList(search);
		if(!searchList.isEmpty()) {
			model.addAttribute("nList", searchList);
			model.addAttribute("search", search);
			return "notice/noticeListView";
		}else {
			model.addAttribute("msg", "공지사항 검색 실패");
			return "redirect:noticeList.do";
		}
	}


	// 공지사항 상세 조회
	@RequestMapping(value="noticeDetail.do", method=RequestMethod.GET)
	public ModelAndView noticeDetail( int nKey, ModelAndView mv, Integer page ) {
		int currentPage = page != null ? page : 1;
		nService.addReadCount(nKey);
		Notice notice = nService.selectNotice(nKey);
		if(notice != null) {
			mv.addObject("notice", notice).addObject("currentPage", currentPage).setViewName("notice/noticeDetailView");
		}else {
			mv.addObject("msg", "공지사항 상세 조회 실패");
			mv.setViewName("redirect:noticeList.do");
		}
		return mv;
	}


	// 공지사항 삭제
	@RequestMapping(value="noticeDelete.do", method=RequestMethod.GET)
	public ModelAndView noticeDelete(int nKey, ModelAndView mv, HttpServletRequest request) {
		int result = nService.deleteNotice(nKey);
		if(result>0) {
			mv.setViewName("redirect:noticeList.do");
		}else {
			mv.addObject("msg", "공지사항 삭제 실패").setViewName("redirect:noticeDetail.do");
		}
		return mv;
	}

	// 공지글 수정 폼 연결
	@RequestMapping(value="noticeUpdateView.do", method=RequestMethod.GET)
	public String noticeUpdateView(int nKey, Model model) {
		model.addAttribute("notice", nService.selectNotice(nKey));
		return "notice/noticeUpdateForm";
	}

	// 공지글 수정
	@RequestMapping(value="noticeUpdate.do", method=RequestMethod.POST)
	public String noticeUpdate(Notice notice, Model model, HttpServletRequest request) {
		int result = nService.updateNotice(notice);
		if(result > 0) {
			return "redirect:noticeDetail.do?nKey="+notice.getnKey();
		}else {
			model.addAttribute("msg", "공지사항 수정 실패");
			return "redirect:noticeDetail.do";
		}
	}

}
