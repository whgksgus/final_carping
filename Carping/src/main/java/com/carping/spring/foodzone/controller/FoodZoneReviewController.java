package com.carping.spring.foodzone.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.carping.spring.common.Search;
import com.carping.spring.foodzone.domain.BoardSearch;
import com.carping.spring.foodzone.domain.FoodZone;
import com.carping.spring.foodzone.domain.FoodZoneReview;
import com.carping.spring.foodzone.domain.FoodZoneReviewComment;
import com.carping.spring.foodzone.domain.PageInfo;
import com.carping.spring.foodzone.domain.Pagination;
import com.carping.spring.foodzone.domain.Tor;
import com.carping.spring.foodzone.service.FoodZoneReviewService;
import com.carping.spring.foodzone.service.FoodZoneService;
import com.carping.spring.member.domain.Member;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

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
	public ModelAndView foodZoneSearch(Search search, ModelAndView mv, @RequestParam(value="page", required=false) Integer page) {

		ArrayList<FoodZone> fList = fzrService.searchFoodZone(search);
		if(!fList.isEmpty()) {
			mv.addObject("fList", fList).addObject("search", search).setViewName("foodzone/foodZoneReviewSearch");
		}else {
			mv.addObject("msg", "검색 결과가 없습니다..").addObject("url", "foodzone/foodZoneReviewSearch");
		}
		return mv;
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
			mv.addObject("fReview", fReview).addObject("foodZoneKey", foodZoneKey).setViewName("foodzone/foodZoneReviewDetail");
		}else {
			mv.addObject("msg", "실패..");
			mv.addObject("url", "javascript:history.back();");
			mv.setViewName("common/redirect");
		}
		
		return mv;
	}
	@ResponseBody
	@RequestMapping(value="frCommentAdd.do", method = RequestMethod.POST)
	public String foodZoneReviewCommentAdd(FoodZoneReviewComment frc , HttpSession session) {
		int result = 0;
		Member loginUser = (Member)session.getAttribute("loginUser");
		String frcWriter = loginUser.getMemberId();
		frc.setFrcWriter(frcWriter);
		result = fzrService.insertFoodZoneReviewComment(frc);
		if(result>0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	@RequestMapping(value="frCommentList.do", method = RequestMethod.GET)
	public void foodZoneReviewCommentList(HttpServletResponse response, int frKey) throws Exception {
		
		ArrayList<FoodZoneReviewComment> frcList = fzrService.selectFoodZoneReviewCommentList(frKey);
		for (FoodZoneReviewComment frc : frcList) {
			frc.setFrcContent(URLEncoder.encode(frc.getFrcContent(), "utf-8"));
			
		}
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(frcList, response.getWriter());
		
	
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
				System.out.println(uploadFile.getOriginalFilename());
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
	
	public void deleteFile(String frPhoto, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\foodzoneImage";
		File file = new File(savePath+"\\"+frPhoto);
		if(file.exists()) {
			file.delete();
		}
		
	}
	
	@RequestMapping(value="foodZoneReviewUpdate.do", method = RequestMethod.GET)
	public ModelAndView foodZoneReviewUpdateView(ModelAndView mv, int frKey, int foodZoneKey) {
		FoodZone foodZone = fzService.selectFoodZoneInfoByKey(foodZoneKey);
		FoodZoneReview fReview = fzrService.selectFoodZoneReviewDetail(frKey);
		mv.addObject("foodZone", foodZone).addObject("fReview", fReview).setViewName("foodzone/foodZoneReviewUpdate");
		return mv;
	}
	
	@RequestMapping(value="foodZoneUpdate.do", method = RequestMethod.POST)
	public ModelAndView foodZoneReviewUpdate(ModelAndView mv, FoodZoneReview fzr,int foodZoneKey,  int frKey, HttpServletRequest request,
			@RequestParam(name="reloadFile", required = false) MultipartFile reloadFile) {
		if(reloadFile != null && !reloadFile.isEmpty()) {
			deleteFile(fzr.getFrPhoto(), request);
		}
		String renameFileName = saveFile(reloadFile, request);
		if(renameFileName != null) {
			fzr.setFrPhoto(reloadFile.getOriginalFilename());
		}
		
		int result = fzrService.updateFoodZoneReview(fzr);
		FoodZoneReview fReview = fzrService.selectFoodZoneReviewDetail(frKey);
		if(result > 0) {
			mv.addObject("fReview", fReview).addObject("foodZoneKey", foodZoneKey).setViewName("foodzone/foodZoneReviewDetail");
		}else {
			mv.addObject("msg", "다시 시도해주세요").addObject("url", "javascript:history.back();").setViewName("common/redirect");
		}
		return mv;
	}
	
	@RequestMapping(value="/foodZoneReviewDelete.do", method = RequestMethod.GET)
	public ModelAndView foodZoneReviewDelete(ModelAndView mv, int frKey, int foodZoneKey, HttpServletRequest request, Integer page) {
		System.out.println("동작확인");
		FoodZoneReview fReview = fzrService.selectFoodZoneReviewDetail(frKey);
		deleteFile(fReview.getFrPhoto(), request);
		
		int currentPage = (page != null) ? page : 1;
		int listCount = fzrService.getListCount(foodZoneKey);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		int result = fzrService.deleteFoodZoneReview(frKey);
		ArrayList<FoodZoneReview> fzrList = fzrService.selectFoodZoneReviewList(foodZoneKey, pi);
		if(result > 0) {
			mv.addObject("fzrList", fzrList).addObject("foodZoneKey", foodZoneKey).setViewName("redirect:foodZoneReviewListView.do");
		}else {
			mv.addObject("foodZoneKey", foodZoneKey).setViewName("redirect:foodZoneReviewListView.do");
		}
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="frCommentDelete.do", method = RequestMethod.GET)
	public String deleteFoodZoneReviewComment(Model model, int frcKey, HttpServletRequest request) {
		int result = fzrService.deleteFoodZoneReviewComment(frcKey);
		if(result > 0) {
			return "success";
		}else {
			return "fail";
			
		}
	}
	@RequestMapping(value="myReserve.do", method=RequestMethod.GET)
	   public ModelAndView myReserveForm(HttpServletRequest request, ModelAndView mv) {
	       HttpSession session = request.getSession();
	       Member mem = (Member) session.getAttribute( "loginUser" );
	       String memberId = mem.getMemberId();
	       ArrayList<Tor> tor = fzService.selectTakeOutReserve(memberId);
	       System.out.println(tor);
	      if(tor != null) {
	         mv.addObject("reserveList", tor);
	         mv.setViewName("member/myReserve");
	      }
	      return mv;
	   }
	@RequestMapping(value="searchFoodZoneBoardReview.do", method = RequestMethod.GET)
	public ModelAndView searchFoodZoneBoardReview(BoardSearch boardSearch, ModelAndView mv, @RequestParam(value="foodZoneKey") int foodZoneKey , Integer page) {
		int fk = foodZoneKey;
		boardSearch.setFoodZoneKey(fk);
		int currentPage = (page != null) ? page : 1;
		int listCount = fzService.getSearchReviewListCount(boardSearch);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		int pageNum = listCount - (currentPage-1)* pi.getListLimit();
		ArrayList<FoodZoneReview> searchList = fzrService.searchFoodZoneBoardReview(pi, boardSearch);
		if(!searchList.isEmpty()) {
			mv.addObject("fzrList", searchList).addObject("search", boardSearch).addObject("foodZoneKey", foodZoneKey).addObject("pageNum", pageNum).addObject("pi", pi).setViewName("foodzone/foodZoneReviewList");
		}
		return mv;
	}
}
