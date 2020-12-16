package com.carping.spring.foodzone.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.carping.spring.common.Search;
import com.carping.spring.foodzone.domain.FoodZone;
import com.carping.spring.foodzone.domain.FoodZoneReview;
import com.carping.spring.foodzone.domain.TakeOut;
import com.carping.spring.foodzone.service.FoodZoneService;
import com.carping.spring.member.domain.Member;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

@Controller
public class FoodZoneController {
	@Autowired
	private FoodZoneService fzService;
	
	@RequestMapping(value="foodZoneView.do", method = RequestMethod.GET)
	public ModelAndView foodZoneInfoView(ModelAndView mv) {
		
		ArrayList<FoodZone> fList = fzService.selectFoodZoneList();
		mv.addObject("fList", fList);
		//맛집리스트 리뷰 리스트
		
		mv.setViewName("foodzone/foodZoneInfoView");
		return mv;
	}
	
	public String foodZoneSearch(Search search, Model model) {
		return "";
	}
	
	@ResponseBody
	@RequestMapping(value="foodZoneSelect.do", method = RequestMethod.GET)
	public FoodZone foodZoneInfoSelect(String foodZoneName, Model model) {
		FoodZone foodZone = fzService.selectFoodZoneInfo(foodZoneName);
		return foodZone;
	}
	
	@RequestMapping("reviewList.do")
	public ModelAndView foodReviewList(ModelAndView mv) {
		mv.setViewName("foodzone/reviewList");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="foodZoneReviewList.do", method = RequestMethod.GET)
	public Object foodZoneReviewList(ModelAndView mv,
			@RequestParam(value="page", required=false) Integer page, String foodZoneName) {
		 FoodZone foodZone = fzService.selectFoodZoneInfo(foodZoneName);
		 int foodZoneKey = foodZone.getFoodZoneKey();
	     ArrayList<FoodZoneReview> fzReviewList = fzService.selectFoodZoneReviewList(foodZoneKey);
	     HashMap<String, Object> paramMap = new HashMap<String, Object>();
	     paramMap.put("frList", fzReviewList);
	     for(int i=0; i<fzReviewList.size();i++) { 
	    	 System.out.println(fzReviewList.get(i).toString());
	     }
	     
	     return paramMap;
	}
	
	public String insertFoodZone(FoodZone foodZone, Model model,
			@RequestParam(name="foodZoneImage", required = false) MultipartFile uploadFile) {
		return "";
	}
	
	public String foodZoneReviewScoreAvg(int foodZoneKey) {
		return "";
	}
	
	@ResponseBody
	@RequestMapping(value="foodZoneScoreAvgUpdate.do", method = RequestMethod.GET)
	public double scoreAvgUpdate(String foodZoneName, Model model) {
		FoodZone foodZone = fzService.selectFoodZoneInfo(foodZoneName);
		int foodZoneKey = foodZone.getFoodZoneKey();
		double foodZoneAvg =0;
		try {
			foodZoneAvg = fzService.selectFoodZoneAvg(foodZoneKey);
			System.out.println(foodZoneAvg);
		}catch(Exception e) {
			foodZoneAvg = 0;
			System.out.println(foodZoneAvg);
		}
		

		return foodZoneAvg;
		
		
	}
	
	@RequestMapping(value="takeOut.do", method = RequestMethod.GET)
	public ModelAndView takeOut(ModelAndView mv, String foodZoneName) {
		FoodZone foodZone = fzService.selectFoodZoneInfo(foodZoneName);
		System.out.println(foodZone);
		int foodZoneKey = foodZone.getFoodZoneKey();
		System.out.println(foodZoneKey);
		ArrayList<TakeOut> tList = fzService.selectTakeOutMenu(foodZoneKey);
		System.out.println(tList);
		
		mv.addObject("foodZone", foodZone).addObject("tList", tList);
		mv.setViewName("foodzone/foodZoneTakeOut");
		return mv;
	}
	
	public String registerCategoryForm() {
		return "";
	}
	
	public String foodZoneRegisterForm() {
		return "";
	}
	
	
	@RequestMapping(value="takeOutInsert.do", method = RequestMethod.GET)
	public String takeOutMenuInsert(@RequestParam String data) {
		
		System.out.println(data);
		return "";
	}
	
	@RequestMapping(value="takeOutSuccess.do", method = RequestMethod.GET)
	public String takeOutSuccess() {
		return "foodzone/takeOutMenuSuccess";
	}
	
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		return "";
	}
	
	public void deleteFile(MultipartFile file, HttpServletRequest request) {
	}
}
