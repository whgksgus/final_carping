package com.carping.spring.item.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.carping.spring.common.Search;
import com.carping.spring.item.service.ItemService;

public class ItemController {
	
	private ItemService iService;
	
	public ModelAndView tentListView(ModelAndView mv, Integer page) {
		return mv;
	}
	
	public ModelAndView tentListNew(ModelAndView mv, Integer page) {
		return mv;
	}
	
	public ModelAndView tentListLow(ModelAndView mv, Integer page) {
		return mv;
	}
	
	public ModelAndView tentListHigh(ModelAndView mv, Integer page) {
		return mv;
	}
	
	public ModelAndView searchTent(ModelAndView mv, Integer page, Search search) {
		return mv;
	}
	
	//
	
	public ModelAndView cookListView(ModelAndView mv, Integer page) {
		return mv;
	}
	
	public ModelAndView cookListNew(ModelAndView mv, Integer page) {
		return mv;
	}
	
	public ModelAndView cookListLow(ModelAndView mv, Integer page) {
		return mv;
	}
	
	public ModelAndView cookListHigh(ModelAndView mv, Integer page) {
		return mv;
	}
	
	public ModelAndView searchCook(ModelAndView mv, Integer page, Search search) {
		return mv;
	}
	
	//
	
	public ModelAndView sleepListView(ModelAndView mv, Integer page) {
		return mv;
	}
	
	public ModelAndView sleepListNew(ModelAndView mv, Integer page) {
		return mv;
	}
	
	public ModelAndView sleepListLow(ModelAndView mv, Integer page) {
		return mv;
	}
	
	public ModelAndView sleepListHigh(ModelAndView mv, Integer page) {
		return mv;
	}
	
	public ModelAndView searchSleep(ModelAndView mv, Integer page, Search search) {
		return mv;
	}
	
	//
	
	public ModelAndView etcListView(ModelAndView mv, Integer page) {
		return mv;
	}
	
	public ModelAndView etcListNew(ModelAndView mv, Integer page) {
		return mv;
	}
	
	public ModelAndView etcListLow(ModelAndView mv, Integer page) {
		return mv;
	}
	
	public ModelAndView etcListHigh(ModelAndView mv, Integer page) {
		return mv;
	}
	
	public ModelAndView searchEtc(ModelAndView mv, Integer page, Search search) {
		return mv;
	}
	
	//    
	
	public String insertCart(int cartQuantity, HttpServletRequest request, int itemKey, Model model) {
		return "";
	}
	
	public String orderItem(int cartQuantity, HttpServletRequest request, int itemKey, Model model) {
		return "";
	}
	
	public String itemDetail(int itemKey, Model model) {
		return "";
	}
	
}
