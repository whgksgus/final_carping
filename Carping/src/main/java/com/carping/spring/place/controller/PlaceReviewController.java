package com.carping.spring.place.controller;

import java.io.File;
import java.net.URLEncoder;
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

import com.carping.spring.common.Search;
import com.carping.spring.member.domain.Member;
import com.carping.spring.place.domain.PageInfo;
import com.carping.spring.place.domain.Pagination;
import com.carping.spring.place.domain.Place;
import com.carping.spring.place.domain.PlaceReview;
import com.carping.spring.place.domain.PlaceReviewComment;
import com.carping.spring.place.service.PlaceReviewService;
import com.carping.spring.place.service.PlaceService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

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
	public String placeReviewSearch(Search search, Model model, @RequestParam(value="page", required=false) Integer page) {
		int currentPage = (page != null) ? page : 1;
//		int listCount = prService.getListCount(search);
//		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
//		int pageNum = listCount - (currentPage -1) * pi.getListLimit();
		ArrayList<Place> pList = prService.searchPlaceReview(search);
		if(!pList.isEmpty()) {
			model.addAttribute("pList", pList);
//			model.addAttribute("pageNum", pageNum);
//			model.addAttribute("pi", pi);
			model.addAttribute("search", search);
			return "place/placeReviewSearch";
		}else {
			return "error";
		}
	}
	
	// 명소 선택 후 리뷰 불러오는 메소드
	@RequestMapping(value="placeReviewListView.do", method=RequestMethod.GET)
	public ModelAndView placeReviewListView(ModelAndView mv, 
			@RequestParam(value="page", required = false) Integer page, int placeKey) {
		int currentPage = (page != null) ? page : 1;
		int listCount = prService.getListCount(placeKey);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		int pageNum = listCount - (currentPage -1) * pi.getListLimit();
		ArrayList<PlaceReview> prList = prService.selectPlaceReviewList(pi, placeKey);	
		if(!prList.isEmpty()) {
			mv.addObject("prList", prList);
			mv.addObject("placeKey", placeKey);
			mv.addObject("pageNum", pageNum);
			mv.addObject("pi", pi);
			mv.setViewName("place/placeReviewList");
		}else {
			mv.addObject("placeKey", placeKey);
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
	public ModelAndView placeReviewInsert(PlaceReview pr, ModelAndView mv, int placeKey, Integer page, HttpServletRequest request,
			@RequestParam(name="uploadFile", required = false) MultipartFile uploadFile) {
		// 파일을 서버에 저장하는 작업
		if(!uploadFile.getOriginalFilename().equals("")) {
			String fileName = saveFile(uploadFile, request);
			if(fileName != null) {
				pr.setPrPhoto(uploadFile.getOriginalFilename());
			}
		}
		int result = 0;
		int currentPage = (page != null) ? page : 1;
		int listCount = prService.getListCount(placeKey);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		int pageNum = pi.getListCount() - (currentPage -1) * pi.getListLimit();
		result = prService.insertPlaceReview(pr);
		ArrayList<PlaceReview> prList = prService.selectPlaceReviewList(pi, placeKey);	
		if(result > 0) {
			mv.addObject("prList", prList);
			mv.addObject("placeKey", placeKey);
			mv.addObject("pageNum", pageNum);
			mv.addObject("pi", pi);
			mv.setViewName("place/placeReviewList");
		}else {
			mv.addObject("placeKey", placeKey);
			mv.addObject("pageNum", pageNum);
			mv.addObject("pi", pi);
			mv.setViewName("place/placeReviewList");
		}
		return mv;
	}
	
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\placeImage";
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
	
	// 리뷰 상세보기
	@RequestMapping(value="placeReviewDetail.do", method=RequestMethod.GET)
	public ModelAndView placeReviewDetail(ModelAndView mv, int placeKey, int prKey, Integer page) {
		PlaceReview preview = prService.selectPlaceReviewDetail(prKey);
		if (preview != null) {
			mv.addObject("preview", preview).addObject("placeKey", placeKey).setViewName("place/placeReviewDetail");
		}else {
			mv.addObject("msg", "게시글 상세조회 실패!");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 리뷰 수정 화면 이동
		@RequestMapping(value="placeReviewUpdateView.do", method=RequestMethod.GET)
		/*public ModelAndView boardUpdateView(ModelAndView mv, @RequestParam(value="prKey") int prKey,
				@RequestParam(value="page") Integer page) {*/
		public ModelAndView boardUpdateView(ModelAndView mv, @RequestParam(value="prKey") int prKey, int placeKey) {
			Place place = prService.selectOne(placeKey);
			PlaceReview preview = prService.selectPlaceReviewDetail(prKey);
			mv.addObject("preview", preview);
			mv.addObject("place", place);
			mv.setViewName("place/placeReviewUpdate");
			return mv;
		}
	
		// 리뷰 수정
		@RequestMapping(value="placeReviewUpdate.do", method=RequestMethod.POST)
		public ModelAndView placeReviewUpdate(ModelAndView mv, PlaceReview pr, int prKey, int placeKey, HttpServletRequest request,
				@RequestParam(value="reloadFile", required = false) MultipartFile reloadFile) {
			if(reloadFile != null && !reloadFile.isEmpty()) {
				deleteFile(pr.getPrPhoto(), request);
			}
			String renameFileName = saveFile(reloadFile, request); // ""
			if (renameFileName != null) {
				pr.setPrPhoto(reloadFile.getOriginalFilename()); // ""
			}
			int result = prService.updatePlaceReview(pr);
			PlaceReview preview = prService.selectPlaceReviewDetail(prKey);
			if (result > 0) {
				mv.addObject("preview", preview).addObject("placeKey", placeKey).setViewName("place/placeReviewDetail");
			}else {
				mv.addObject("msg", "게시글 상세조회 실패!");
				mv.setViewName("common/errorPage");
			}
			return mv;
		}
		
	
		// 리뷰 삭제
		@RequestMapping(value="placeReviewDelete.do", method=RequestMethod.GET)
		public ModelAndView placeReviewDelete(ModelAndView mv, int prKey, int placeKey, Integer page, HttpServletRequest request) {
			PlaceReview preview = prService.selectPlaceReviewDetail(prKey);
			deleteFile(preview.getPrPhoto(), request);
			// DB에서 데이터 삭제

			int currentPage = (page != null) ? page : 1;
			int listCount = prService.getListCount(placeKey);
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			int pageNum = pi.getListCount() - (currentPage -1) * pi.getListLimit();
			int result = prService.deletePlaceReview(prKey);
			ArrayList<PlaceReview> prList = prService.selectPlaceReviewList(pi, placeKey);	
			if(result > 0) {
				mv.addObject("prList", prList);
				mv.addObject("placeKey", placeKey);
				mv.addObject("pageNum", pageNum);
				mv.addObject("pi", pi);
				mv.setViewName("place/placeReviewList");
			}else {
				mv.addObject("placeKey", placeKey);
				mv.addObject("pageNum", pageNum);
				mv.addObject("pi", pi);
				mv.setViewName("place/placeReviewList");
			}
			return mv;
		}
	
	public void deleteFile(String prPhoto, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\placeImage";
		File file = new File(savePath + "\\" + prPhoto);
		if(file.exists()) {
			file.delete();
		}
	}
	
	// 댓글 등록
	@ResponseBody
	@RequestMapping(value="prCommentAdd.do", method = RequestMethod.POST)
	public String placeReviewCommentAdd(PlaceReviewComment prc, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String prcWriter = loginUser.getMemberId();
		prc.setPrcWriter(prcWriter);
		int result = prService.insertPlaceReviewComment(prc);
		if (result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	// 댓글 조회
	@RequestMapping(value="prCommentList.do", method=RequestMethod.GET)
	public void placeReviewCommentList(HttpServletResponse response, int prKey)throws Exception {
		ArrayList<PlaceReviewComment> prcList = prService.selectPlaceReviewCommentList(prKey);
		for (PlaceReviewComment prc : prcList) {
			prc.setPrcContent(URLEncoder.encode(prc.getPrcContent(), "utf-8"));
		}
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(prcList, response.getWriter());
	}
	
	// 댓글 삭제
	@ResponseBody
	@RequestMapping(value="prCommentDelete.do", method=RequestMethod.GET)
	public String placeReviewCommentDelete(int prcKey, Model model, HttpServletRequest request) {
		int result = prService.deletePlaceReviewComment(prcKey);
		if (result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}

}
