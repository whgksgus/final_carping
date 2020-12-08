package com.carping.spring.area.controller;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.carping.spring.area.domain.AreaReview;
import com.carping.spring.area.domain.AreaReviewComment;
import com.carping.spring.area.service.AreaReviewService;
import com.carping.spring.common.Search;

public class AreaReviewController {
	
	private AreaReviewService arService;
	
	public String reviewCategoryForm() {
		return "";
	}
	
	public String areaReviewSearchForm() {
		return "";
	}
	
	public String areaReviewSearch(Search search, Model model) {
		return "";
	}
	
	public ModelAndView areaReviewListView(ModelAndView mv, @RequestParam(value="page",required = false) Integer page
	, int areaKey){
		return mv;
	}
	
	public ModelAndView areaReviewDetail(ModelAndView mv, int arKey, Integer page) {
		return mv; 
	}
	
	public String areaReviewUpdate(Model model, AreaReview ar, HttpServletRequest request,
			@RequestParam(value="reloadFile", required = false) MultipartFile reloadFile) {
		return "";
	}
	
	public String areaReviewDelete(Model model, int arKey, HttpServletRequest request) {
		return "";
	}
	
	public String areaReviewCommentAdd(AreaReviewComment arc, HttpSession session) {
		return "";
	}
	
	public void areaReviewCommentList(HttpServletResponse response, int arKey) {
		
	}
	
	public String areaReviewCommentDelete(int arcKey, Model model, HttpServletRequest request) {
		return "";
	}
	
	public String areaReviewInsert(AreaReview ar, Model model, HttpServletRequest request,
			@RequestParam(name="arPhoto", required = false) MultipartFile arPhoto) {
		return "";
	}
	
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		return "";
	}
	
	public void deleteFile(String areaImage, HttpServletRequest request) {
		
	}
}
