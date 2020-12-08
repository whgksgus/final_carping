package com.carping.spring.place.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.carping.spring.common.Search;
import com.carping.spring.place.domain.Place;
import com.carping.spring.place.service.PlaceService;

public class PlaceController {
	private PlaceService pService;
	
	public String placeInfoView() {
		return "";
	}
	public String registerCategoryForm() {
		return "";
	}
	public String placeRegisterForm() {
		return "";
	}
	
	public String placeSearch(Search search, Model model) {
		return "";
	}
	
	public String placeInfoSelect(String placeAddress, Model model) {
		return "";
	}
	
	public ModelAndView placeReviewList(ModelAndView mv, 
			@RequestParam(value="page", required = false)Integer page, int placeKey) {
		return mv;
	}
	
	public String placeReviewScoreAvg(int placeKey, Model model) {
		return "";
	}
	
	public String scoreAvgUpdate(int placeKey, int scoreAvg, Model model) {
		return "";
	}
	
	public String insertPlace(Place place, Model model, HttpServletRequest request, 
			@RequestParam(name="uploadFile", required = false) MultipartFile uploadFile) {
		return "";
	}
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		return "";
	}
	
	public void deleteFile(String areaImage, HttpServletRequest request) {
		
	}
}
