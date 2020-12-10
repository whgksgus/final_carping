 package com.carping.spring.area.controller;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.carping.spring.area.domain.Area;
import com.carping.spring.area.service.AreaService;
import com.carping.spring.common.Search;
import com.carping.spring.common.SearchMap;
import com.carping.spring.foodzone.service.FoodZoneService;
import com.carping.spring.place.service.PlaceService;

@Controller
public class AreaController {

	@Autowired
	private AreaService aService;
	
	@Autowired
	private FoodZoneService fzService;
	
	@Autowired
	private PlaceService pService;

	@RequestMapping(value="areaInfoView.do", method=RequestMethod.GET)
	public ModelAndView areaInfoView(ModelAndView mv) {
		ArrayList<Area> aList = aService.selectAreaList();
		mv.addObject("aList", aList);
		mv.setViewName("area/areaInfoView");
		return mv;
	}
	

	public String areaSearch(Search search, Model model) {
		return "";
	}
	
	
	@RequestMapping(value="selectAreaInfo.do", method=RequestMethod.POST)
	@ResponseBody
	public String areaInfoSelect(String areaName, Model model) {
		Area area = aService.selectAreaInfo(areaName);
		if(area != null) {
			model.addAttribute("area", area);
			return"area/areaInfoView";
		}else {
			model.addAttribute("msg", "자유게시판 검색 실패");
			return "common/errorPage";
		}
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
	
	@RequestMapping(value="searchsido.do", method=RequestMethod.POST, produces = "application/text; charset=utf8")
    @ResponseBody
    public String search(SearchMap searchMap) {
       return searchMap.getSido()+ " " +searchMap.getSigun()+ " " +searchMap.getAddress();
    }
}
