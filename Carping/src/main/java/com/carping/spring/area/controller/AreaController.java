 package com.carping.spring.area.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.carping.spring.area.domain.Area;
import com.carping.spring.area.service.AreaService;
import com.carping.spring.common.Search;
import com.carping.spring.foodzone.service.FoodZoneService;
import com.carping.spring.place.service.PlaceService;


public class AreaController {

	private AreaService aService;
	private FoodZoneService fzService;
	private PlaceService pService;

	public String areaInfoView() {
		return "";
	}
	

	public String areaSearch(Search search, Model model) {
		return "";
	}
	

	public String areaInfoSelect(String areaAddress, Model model) {
		return "";
	}
	

	public String areaReviewSelect(int arKey, Model model) {
		return "";
	}
	

	public String placeInfoSelect(int placeKey, Model model) {
		return "";
	}
	

	public String foodZoneInfoSelect(int FoodZoneKey, Model model) {
		return "";
	}
	

	public ModelAndView areaReviewList(ModelAndView mv, 
			@RequestParam(value="page", required=false) Integer page, int areaKey) {
		return mv;
	}
	

	public String areaReviewScoreAvg(int areaKey, Model model) {
		return "";
	}
	

	public String scoreAvgUpdate(int areaKey, double scoreAvg, Model model) {
		return "";
	}
	
	public String registerCategoryForm() {
		return "";
	}
	
	public String areaRegisterForm() {
		return "";
	}
	
	public String selectFoodZoneList(String areaAddress, Model model) {
		return "";
	}
	
	public String selectPlaceList(String areaAddress, Model model) {
		return "";
	}
	
	public String insertArea(Area area,  Model model, HttpServletRequest request, 
			@RequestParam(name="areaImage", required=false) MultipartFile areaImage) {
		return "";
	}
	
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		return "";
	}
	
	public void deleteFile(String areaImage, HttpServletRequest request) {
		
	}
}
