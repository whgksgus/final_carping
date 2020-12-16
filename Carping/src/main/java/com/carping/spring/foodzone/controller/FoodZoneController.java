package com.carping.spring.foodzone.controller;


import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.activation.CommandMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
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
import com.carping.spring.foodzone.domain.TakeOutReserve;
import com.carping.spring.foodzone.service.FoodZoneService;
import com.carping.spring.member.domain.Member;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;


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
	
	@ResponseBody
	@RequestMapping(value="takeOutInsert.do", method = RequestMethod.POST)
	public int takeOutMenuInsert(@RequestParam String data , HttpServletRequest request) {
		// json-simple jar -> pom.xml
		// string -> jsonArray, jsonArray -> json    arr[0]
		// json 데이터 추출
		// 추출한 데이터 VO에 담기
		// insert
		int result=0;
		HttpSession session = request.getSession();
		JsonParser jsonParser = new JsonParser();
		JsonArray jsonArray = (JsonArray) jsonParser.parse(data);
		System.out.println(jsonArray);
		for(int i=0; i<jsonArray.size();i++) {
			JsonObject object = (JsonObject)jsonArray.get(i);
			String takeOutMenu = object.get("takeOutMenu").getAsString();
			String menuEa = object.get("menuEa").getAsString();
			String menuPrice = object.get("menuPrice").getAsString();
			String regDate = object.get("regDate").getAsString();
			String time = object.get("time").getAsString();
			String totalPrice = object.get("totalPrice").getAsString();
			String memberId = ((Member)session.getAttribute("loginUser")).getMemberId();
			String foodZoneKey = object.get("foodZoneKey").getAsString();
			
			TakeOut takeOut = new TakeOut();
			takeOut.setFoodZoneKey(Integer.parseInt(foodZoneKey));
			takeOut.setTakeOutMenu(takeOutMenu);
			
			TakeOut takeOutFind = fzService.selectTakeOut(takeOut);
			TakeOutReserve tor = new TakeOutReserve();
			tor.setTakeOutKey(takeOutFind.getTakeOutKey());
			tor.setTorEa(Integer.parseInt(menuEa));
			tor.setTorPrice(Integer.parseInt(menuPrice));
			tor.setTorRegDate(regDate+", "+time);
			tor.setTorTotalPrice(Integer.parseInt(totalPrice));
			tor.setMemberId(memberId);
			tor.setFoodZoneKey(Integer.parseInt(foodZoneKey));
				
			result = fzService.insertTakeout(tor);
			
				
		}
		return result;
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
