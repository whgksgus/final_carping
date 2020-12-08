package com.carping.spring.notice.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.carping.spring.common.Search;
import com.carping.spring.notice.domain.Notice;
import com.carping.spring.notice.service.NoticeService;

public class NoticeController {
	
	private NoticeService nService;
	
	public String noticeWriteView() {
		return "";
	}
	
	public String noticeInsert(Notice notice, Model model, HttpServletRequest request) {
		return "";
	}
	
	public ModelAndView noticeList(ModelAndView mv, Integer page) {
		return mv;
	}
	
	public String noticeSearch(Search search, Model model) {
		return "";
	}
	
	public ModelAndView noticeDetail(ModelAndView mv, int nKey, Integer page) {
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
