package com.carping.spring.foodzone.controller;

import java.io.File;
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
	@RequestMapping(value="foodZoneReviewInsertForm.do", method = RequestMethod.GET)
	public ModelAndView foodZoneInsertFormView(ModelAndView mv, int foodZoneKey) {
		FoodZone foodZone = fzService.selectFoodZoneInfoByKey(foodZoneKey);
		mv.addObject("foodZone", foodZone);
		mv.setViewName("foodzone/foodZoneReviewInsertForm");
		return mv;
	}
	
	@RequestMapping(value="foodZoneInsert.do", method = RequestMethod.POST)
	public ModelAndView insertFoodZoneReview(FoodZoneReview fzr, ModelAndView mv, HttpServletRequest request,Integer page,
			 @RequestParam(name="uploadFile", required = false) MultipartFile uploadFile) {

		if(!uploadFile.getOriginalFilename().equals("")) {
			String fileName = saveFile(uploadFile, request);
			if(fileName != null) {
				fzr.setFrPhoto(uploadFile.getOriginalFilename());
			}
		}
		
		int currentPage = (page != null) ? page : 1;
		int listCount = fzrService.getListCount(fzr.getFoodZoneKey());
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		int result = fzrService.insertFoodZoneReview(fzr);
		ArrayList<FoodZoneReview> fzrList = fzrService.selectFoodZoneReviewList(fzr.getFoodZoneKey(), pi);
		if(result>0) {
			mv.addObject("fzrList", fzrList).addObject("foodZoneKey", fzr.getFoodZoneKey());
			mv.setViewName("redirect:foodZoneReviewListView.do");
		}else {
			mv.addObject("msg", "다시 시도해주세요");
		}
		return mv;
	}
	
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\foodZoneImage";
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdir();
		}
		String originalFileName = file.getOriginalFilename();
		String filePath = folder + "\\" + originalFileName;
		if (originalFileName == "") {
			return null;
		}else {
			try {
				file.transferTo(new File(filePath));
			} catch(Exception e) {
				e.printStackTrace();
			}
			return originalFileName;
		}
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
