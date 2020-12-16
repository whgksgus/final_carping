package com.carping.spring.place.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

import com.carping.spring.place.domain.Place;
import com.carping.spring.place.domain.PlaceReview;
import com.carping.spring.place.domain.Search;
import com.carping.spring.place.service.PlaceService;
import com.google.gson.Gson;

@Controller
public class PlaceController {
	
	@Autowired
	private PlaceService pService;
	
	// Info 페이지 띄우게 해주는 메소드
	@RequestMapping(value="placeView.do",method=RequestMethod.GET)
	public ModelAndView placeInfoView(ModelAndView mv) {
		ArrayList<Place> pList = pService.selectPlaceList();
		mv.addObject("pList", pList);
		mv.setViewName("place/placeInfoView");
		return mv;
	}
	
	@RequestMapping(value="psearchsido.do", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String search(Search search) {
		return search.getSido()+" "+search.getSigun()+" "+search.getAddress(); 
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
	
	@RequestMapping(value="selectPlaceInfo.do", method=RequestMethod.GET)
	@ResponseBody
	public Place placeInfoSelect(String placeName, Model model) {
		Place place = pService.selectPlaceInfo(placeName);
		return place;
	}
	
	@ResponseBody
	@RequestMapping(value="selectPlaceReview.do", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	public String placeReviewList(int placeKey) {
		ArrayList<PlaceReview> prList = pService.selectPlaceReviewlist(placeKey);
		Gson gson = new Gson();
		String jsonPlaceReview = gson.toJson(prList);
//		System.out.println(jsonPlaceReview);
		return jsonPlaceReview;
	}
	
	public String placeReviewScoreAvg(int placeKey, Model model) {
		return "";
	}
	
	@ResponseBody
	@RequestMapping(value="placeScoreAvgUpdate.do", method=RequestMethod.GET)
	public double scoreAvgUpdate(String placeName, Model model) {
		Place place = pService.selectPlaceInfo(placeName);
		int placeKey = place.getPlaceKey();
		double placeAvg = 0;
		try {
			placeAvg = pService.selectPlaceReviewScoreAvg(placeKey);
		} catch(Exception e) {
			placeAvg = 0;
			e.printStackTrace();
		}
		return placeAvg;
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
