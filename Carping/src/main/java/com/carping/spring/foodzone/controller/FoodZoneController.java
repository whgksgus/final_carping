package com.carping.spring.foodzone.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.carping.spring.common.Search;
import com.carping.spring.foodzone.domain.FoodZone;
import com.carping.spring.foodzone.service.FoodZoneService;

@Controller
public class FoodZoneController {
	@Autowired
	private FoodZoneService fzService;
	
	@RequestMapping(value="foodZoneView.do", method = RequestMethod.GET)
	public ModelAndView foodZoneInfoView(ModelAndView mv) {
		ArrayList<FoodZone> fList = fzService.selectFoodZoneList();
		mv.addObject("fList", fList);
		mv.setViewName("foodzone/foodZoneInfoView");
		return mv;
	}
	
	public String foodZoneSearch(Search search, Model model) {
		return "";
	}
	
	public String foodZoneInfoSelect(String foodZoneAddress, Model model) {
		return "";
	}
	
	public ModelAndView foodZoneReviewList(ModelAndView mv,
			@RequestParam(value="page", required=false) Integer page, int areaKey) {
		return mv;
	}
	
	public String insertFoodZone(FoodZone foodZone, Model model,
			@RequestParam(name="foodZoneImage", required = false) MultipartFile uploadFile) {
		return "";
	}
	
	public String foodZoneReviewScoreAvg(int foodZoneKey) {
		return "";
	}
	
	public String scoreAvgUpdate(int foodZoneKey, double scoreAvg, Model model) {
		return "";
	}
	
	public String registerCategoryForm() {
		return "";
	}
	
	public String foodZoneRegisterForm() {
		return "";
	}
	
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		return "";
	}
	
	public void deleteFile(MultipartFile file, HttpServletRequest request) {
	}
}
