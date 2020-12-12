package com.carping.spring.place.controller;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.carping.spring.common.PageInfo;
import com.carping.spring.common.Pagination;
import com.carping.spring.common.Search;
import com.carping.spring.place.domain.Place;
import com.carping.spring.place.domain.PlaceReview;
import com.carping.spring.place.domain.PlaceReviewComment;
import com.carping.spring.place.service.PlaceReviewService;
import com.carping.spring.place.service.PlaceService;

@Controller
public class PlaceReviewController {
	
	@Autowired
	private PlaceReviewService prService;
	
	// 장소 검색하는 폼으로 이동하는 메소드
	@RequestMapping(value="placeReviewSearchForm.do", method=RequestMethod.GET)
	public String placeReviewSearchForm() {
		return "place/placeReviewSearch";
	}
	
	// 명소 선택하는 메소드
	@RequestMapping(value="placeReviewSearch.do", method=RequestMethod.POST)
	public String placeReviewSearch(Search search, Model model) {
		ArrayList<Place> pList = prService.searchPlaceReview(search);
		if(!pList.isEmpty()) {
			model.addAttribute("pList", pList);
			model.addAttribute("search", search);
			return "place/placeReviewSearch";
		}else {
			return "error";
		}
	}
	
	// 명소 선택 후 리뷰 불러오는 메소드
	@RequestMapping(value="placeReviewListView.do", method=RequestMethod.POST)
	public ModelAndView placeReviewListView(ModelAndView mv, 
			@RequestParam(value="page", required = false) Integer page, int placeKey) {
		int currentPage = 1;
		int listCount = 1;
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<PlaceReview> prList = prService.selectPlaceReviewList(pi, placeKey);	
		if(!prList.isEmpty()) {
			mv.addObject("prList", prList);
			mv.setViewName("place/placeReviewList");
		}else {
			mv.setViewName("place/placeReviewList");
		}
		return mv;
	}
	
	// 리뷰 등록 폼으로 이동하는 메소드
	@RequestMapping(value="placeReviewInsertForm.do", method=RequestMethod.POST)
	public String placeReviewInsertForm(Model model, int placeKey) {
		Place place = prService.selectOne(placeKey);
		if(place != null) {
			model.addAttribute("place", place);
		}
		return "place/placeReviewInsert";
	}
	
	// 리뷰 등록
	@RequestMapping(value="placeReviewInsert.do", method=RequestMethod.POST)
	public String placeReviewInsert(PlaceReview pr, Model model, HttpServletRequest request,
			@RequestParam(name="uploadFile", required = false) MultipartFile uploadFile) {
		// 파일을 서버에 저장하는 작업
		if(!uploadFile.getOriginalFilename().equals("")) {
			String fileName = saveFile(uploadFile, request);
			if(fileName != null) {
				pr.setPrPhoto(uploadFile.getOriginalFilename());
			}
		}
		int result = 0;
		String path = null;
		result = prService.insertPlaceReview(pr);
		if(result > 0) {
			path = "place/placeReviewList";
		}else {
			model.addAttribute("msg", "등록 실패");
			path = "common/errorPage";
		}
		return path;
	}
	
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\ruploadFiles";
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdir();
		}
		String originalFileName = file.getOriginalFilename();
		
		String filePath = folder + "\\" + originalFileName;
		
		try {
			file.transferTo(new File(filePath));
		} catch(Exception e) {
			e.printStackTrace();
		}
		return originalFileName;
	}

	public ModelAndView placeReviewDetail(ModelAndView mv, int placeKey, Integer page) {
		return mv;
	}
	
	public String placeReviewUpdate(Model model, PlaceReview pr, HttpServletRequest request,
			@RequestParam(value="reloadFile", required = false) MultipartFile reloadFile) {
		return "";
	}
	
	public String placeReviewDelete(Model model, int prKey, HttpServletRequest request) {
		return "";
	}
	
	public String placeReviewCommentAdd(PlaceReviewComment prc, HttpSession session) {
		return "";
	}
	
	public void placeReviewCommentList(HttpServletResponse response, int prKey) {
		
	}
	
	public String placeReviewCommentDelete(int prcKey, Model model, HttpServletRequest request) {
		return "";
	}
	
	public void deleteFile(String placeImage, HttpServletRequest request) {
		
	}
}
