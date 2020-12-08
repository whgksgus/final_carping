package com.carping.spring.foodzone.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.carping.spring.common.Search;
import com.carping.spring.foodzone.domain.FoodZoneReview;
import com.carping.spring.foodzone.domain.FoodZoneReviewComment;
import com.carping.spring.foodzone.service.FoodZoneReviewService;

public class FoodZoneReviewController {
	
	private FoodZoneReviewService fzrSrvice;
	
	public String reviewCategoryForm() {
		return "";
	}
	
	public String foodZoneReviewSearchForm() {
		return "";
	}
	
	public String foodZoneSearch(Search search, Model model) {
		return "";
	}
	
	public ModelAndView foodZoneReviewListView(ModelAndView mv, @RequestParam(value="page", required = false)
	Integer page, int foodZoneKey) {
		return mv;
	}
	
	public ModelAndView foodZoneReviewDetail(ModelAndView mv, int foodZoneKey, Integer page) {
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
