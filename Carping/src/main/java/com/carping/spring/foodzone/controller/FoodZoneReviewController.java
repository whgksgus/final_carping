package com.carping.spring.foodzone.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.carping.spring.common.Search;
import com.carping.spring.foodzone.domain.FoodZone;
import com.carping.spring.foodzone.domain.FoodZoneReview;
import com.carping.spring.foodzone.domain.FoodZoneReviewComment;
import com.carping.spring.foodzone.domain.PageInfo;
import com.carping.spring.foodzone.domain.Pagination;

import com.carping.spring.foodzone.service.FoodZoneReviewService;
import com.carping.spring.foodzone.service.FoodZoneService;

@Controller
public class FoodZoneReviewController {
	@Autowired
	private FoodZoneReviewService fzrService;
	
	@Autowired
	private FoodZoneService fzService;

	@RequestMapping(value="foodZoneReviewSearch.do", method = RequestMethod.GET)
	public String foodZoneReviewSearchForm() {
		return "foodzone/foodZoneReviewSearch";
	}
	
	@RequestMapping(value="foodZoneSearch.do", method = RequestMethod.POST)
	public String foodZoneSearch(Search search, Model model, @RequestParam(value="page", required=false) Integer page) {
		int currentPage = (page != null) ? page : 1;
		
		ArrayList<FoodZone> fList = fzrService.searchFoodZone(search);
		if(!fList.isEmpty()) {
			model.addAttribute("fList", fList);
			model.addAttribute("search", search);
			System.out.println(fList.toString());
			return "foodzone/foodZoneReviewSearch";
		}else {
			return "common/error";
		}
		
	}
	
	@RequestMapping(value="foodZoneReviewListView.do", method = RequestMethod.GET)
	public ModelAndView foodZoneReviewListView(ModelAndView mv, @RequestParam(value="page", required = false)
	Integer page, int foodZoneKey) {
		int currentPage = (page != null) ? page : 1;
		int listCount = fzrService.getListCount(foodZoneKey);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		int pageNum = listCount - (currentPage -1) * pi.getListLimit();
		ArrayList<FoodZoneReview> fzrList = fzrService.selectFoodZoneReviewList(foodZoneKey, pi);
		if(!fzrList.isEmpty()) {
			mv.addObject("fzrList", fzrList);
			mv.addObject("foodZoneKey", foodZoneKey);
			mv.addObject("pageNum", pageNum);
			mv.addObject("pi", pi);
			System.out.println(pi.toString());
			mv.setViewName("foodzone/foodZoneReviewList");
		}else {
			System.out.println("null");
			mv.addObject("foodZoneKey", foodZoneKey);
			mv.setViewName("foodzone/foodZoneReviewList");
		}
		return mv;
	}
	
	@RequestMapping(value="foodZoneReviewDetail.do", method = RequestMethod.GET)
	public ModelAndView foodZoneReviewDetail(ModelAndView mv, int foodZoneKey, int frKey, Integer page) {
		fzrService.foodZoneReviewHits(frKey);
		FoodZoneReview fReview = fzrService.selectFoodZoneReviewDetail(frKey);
		FoodZone foodZone = fzService.selectFoodZoneInfoByKey(foodZoneKey);
		if(fReview != null && foodZone !=null) {
			mv.addObject("fReview", fReview).addObject("foodZone", foodZone).setViewName("foodzone/foodZoneReviewDetail");
		}else {
			mv.addObject("msg", "실패..");
			mv.addObject("url", "javascript:history.back();");
			mv.setViewName("common/redirect");
		}
		
		return mv;
	}
	
	public String foodZoneReviewCommentAdd(FoodZoneReviewComment frc , HttpSession session) {
		return "";
	}
	
	public void foodZoneReviewCommentList(HttpServletResponse response, int foodZoneKey) {
	
	}
	
	public String insertFoodZoneReview(FoodZoneReview fzr, Model model, HttpServletRequest request,
			@RequestParam(name="frPhoto", required = false) MultipartFile uploadFile) {
		return "";
	}
	
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		return "";
	}
	
	public void deleteFile(MultipartFile file, HttpServletRequest request) {
		
	}
	
	public String foodZoneReviewUpdate(Model model, FoodZoneReview fzr, HttpServletRequest request,
			@RequestParam(name="reloadFile", required = false) MultipartFile uploadFile) {
		return "";
	}
	
	public String foodZoneReviewDelete(Model model, int frKey, HttpServletRequest request) {
		return "";
	}
	
	public String deleteFoodZoneReviewComment(Model model, int frcKey, HttpServletRequest request) {
		return "";
	}
}
