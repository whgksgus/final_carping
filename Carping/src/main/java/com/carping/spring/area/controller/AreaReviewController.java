package com.carping.spring.area.controller;

import java.io.File;
import java.net.URLEncoder;
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

import com.carping.spring.area.domain.Area;
import com.carping.spring.area.domain.AreaReview;
import com.carping.spring.area.domain.AreaReviewComment;
import com.carping.spring.area.domain.BoardSearch;
import com.carping.spring.area.domain.PageInfo;
import com.carping.spring.area.domain.Pagination;
import com.carping.spring.area.service.AreaReviewService;
import com.carping.spring.common.Search;
import com.carping.spring.member.domain.Member;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
public class AreaReviewController {
	
	@Autowired
	private AreaReviewService arService;
	
	
	@RequestMapping(value="areaReviewSerachForm.do", method=RequestMethod.GET)
	public String areaReviewSearchForm() {
		return "area/areaReviewSearch";
	}
	
	@RequestMapping(value="areaReviewSearch.do", method=RequestMethod.POST)
	public String areaReviewSearch(Search search, Model model, @RequestParam(value="page", required=false) Integer page) {
		int currentPage = (page != null) ? page: 1;
		int listCount = arService.getReviewListCount(search);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		int pageNum = listCount - (currentPage -1) * pi.getListLimit(); 
		ArrayList<Area> aList = arService.searchAreaReview(pi, search);
		if(!aList.isEmpty()) {
			model.addAttribute("aList", aList);
			model.addAttribute("pageNum", pageNum);
			model.addAttribute("pi", pi);
			model.addAttribute("search", search);
			return "area/areaReviewSearch";
		}else {
			model.addAttribute("msg", "검색된 차박장소가 없습니다. 다시 검색 해주세요");
			model.addAttribute("url", "areaReviewSearchForm.do");
			return "common/redirect";
		}
	}
	
	// 명소 선택 후 리뷰 불러오는 메소드
		@RequestMapping(value="areaReviewListView.do", method=RequestMethod.GET)
		public ModelAndView areaReviewListView(ModelAndView mv, 
				@RequestParam(value="page", required = false) Integer page, int areaKey) {
			int currentPage = (page != null) ? page : 1;
			int listCount = arService.getAreaListCount(areaKey);
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			int pageNum = listCount - (currentPage -1) * pi.getListLimit();
			ArrayList<AreaReview> arList = arService.selectAreaReviewList(pi, areaKey);	
			if(!arList.isEmpty()) {
				mv.addObject("arList", arList);
				mv.addObject("areaKey", areaKey);
				mv.addObject("pageNum", pageNum);
				mv.addObject("pi", pi);
				mv.setViewName("area/areaReviewList");
			}else {
				mv.addObject("areaKey", areaKey);
				mv.setViewName("area/areaReviewList");
			}
			return mv;
		}
		
		// 리뷰 등록 폼으로 이동하는 메소드
		@RequestMapping(value="areaReviewInsertForm.do", method=RequestMethod.POST)
		public String areaReviewInsertForm(Model model, int areaKey) {
			Area area = arService.selectOne(areaKey);
			if(area != null) {
				model.addAttribute("area", area);
			}
			return "area/areaReviewInsert";
		}
		
		// 리뷰 등록
		@RequestMapping(value="areaReviewInsert.do", method=RequestMethod.POST)
		public ModelAndView areaReviewInsert(AreaReview ar, ModelAndView mv, int areaKey, Integer page, HttpServletRequest request,
				@RequestParam(name="uploadFile", required = false) MultipartFile uploadFile) {
			// 파일을 서버에 저장하는 작업
			if(!uploadFile.getOriginalFilename().equals("")) {
				String fileName = saveFile(uploadFile, request);
				if(fileName != null) {
					ar.setArPhoto(fileName);
				}
			}
			int currentPage = (page != null) ? page : 1;
			int listCount = arService.getAreaListCount(areaKey);
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			int result = arService.insertAreaReview(ar);
			ArrayList<AreaReview> arList = arService.selectAreaReviewList(pi, areaKey);	
			if(result > 0) {
				mv.addObject("arList", arList);
				mv.addObject("areaKey", areaKey);
				mv.setViewName("redirect:areaReviewListView.do");
			}else {
				mv.addObject("msg", "리뷰 등록 실패.. 다시 한번 시도해주세요!");
				mv.addObject("url", "redirect:areaReviewListView.do");
				mv.setViewName("common/redirect");
			}
			return mv;
		}
		
		public String saveFile(MultipartFile file, HttpServletRequest request) {

			String root = request.getSession().getServletContext().getRealPath("resources");
			String savePath = root + "\\areaImage";

			File folder = new File(savePath);
			if (!folder.exists()) {
				folder.mkdir();
			}
			// 공지사항 첨부파일은 파일명 변환없이 바로 저장했지만
			// 게시판 같은 경우 많은 회원들이 동시에 올릴 수도 있고, 같은 이름의 파일을 올릴 수도 있기 때문에
			// 파일명을 rename하는 과정이 필요함. rename할땐 "년월일시분초.확장자"로 변경 필요
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMddHmmss");
			String originalFilename = file.getOriginalFilename();
			String renameFilename = sdf.format(new java.sql.Date(System.currentTimeMillis()))+"."
					+ originalFilename.substring(originalFilename.lastIndexOf(".")+1);
			String filePath = folder + "\\" + renameFilename;

			try {
				file.transferTo(new File(filePath));
			} catch (Exception e) {
				e.printStackTrace();
			}
			return renameFilename;
		}
		
		// 리뷰 상세보기
		@RequestMapping(value="areaReviewDetail.do", method=RequestMethod.GET)
		public ModelAndView areaReviewDetail(ModelAndView mv, int areaKey, int arKey, Integer page) {
			System.out.println(areaKey+", "+arKey);
			arService.areaReviewHits(arKey);
			AreaReview areview = arService.selectAreaReviewDetail(arKey);
			if (areview != null) {
				mv.addObject("areview", areview).addObject("areaKey", areaKey).setViewName("area/areaReviewDetail");
			}else {
				mv.addObject("msg", "리뷰 상세조회 실패! 새로고침 후 다시 실행해주세요");
				mv.addObject("url", "javascript:history.back();");
				mv.setViewName("common/redirect");
			}
			return mv;
		}
		
		// 리뷰 수정 화면 이동
			@RequestMapping(value="areaReviewUpdateView.do", method=RequestMethod.GET)
			/*public ModelAndView boardUpdateView(ModelAndView mv, @RequestParam(value="prKey") int prKey,
					@RequestParam(value="page") Integer page) {*/
			public ModelAndView boardUpdateView(ModelAndView mv, @RequestParam(value="arKey") int arKey, int areaKey) {
				Area area = arService.selectOne(areaKey);
				AreaReview areview = arService.selectAreaReviewDetail(arKey);
				mv.addObject("areview", areview);
				mv.addObject("area", area);
				mv.setViewName("area/areaReviewUpdate");
				return mv;
			}
		
			// 리뷰 수정
			@RequestMapping(value="areaReviewUpdate.do", method=RequestMethod.POST)
			public ModelAndView areaReviewUpdate(ModelAndView mv, AreaReview ar, int arKey, int areaKey, HttpServletRequest request,
					@RequestParam(value="reloadFile", required = false) MultipartFile reloadFile) {
				System.out.println("t1"+arKey);
				System.out.println("t2"+areaKey);
				if(reloadFile != null && !reloadFile.isEmpty()) {
					deleteFile(ar.getArPhoto(), request);
				}
				String renameFileName = saveFile(reloadFile, request); // ""
				if (renameFileName != null) {
					ar.setArPhoto(renameFileName); // ""
				}
				int result = arService.updateAreaReview(ar);
				AreaReview areview = arService.selectAreaReviewDetail(arKey);
				if (result > 0) {
					mv.addObject("areview", areview).addObject("areaKey", areaKey).setViewName("area/areaReviewDetail");
				}else {
					mv.addObject("msg", "리뷰 수정 실패! 새로고침 후 다시 실행해주세요");
					mv.addObject("url", "javascript:history.back();");
					mv.setViewName("common/redirect");
				}
				return mv;
			}
			
		
			// 리뷰 삭제
			@RequestMapping(value="areaReviewDelete.do", method=RequestMethod.GET)
			public ModelAndView areaReviewDelete(ModelAndView mv, int arKey, int areaKey, Integer page, HttpServletRequest request) {
				AreaReview areview = arService.selectAreaReviewDetail(arKey);
				deleteFile(areview.getArPhoto(), request);
				// DB에서 데이터 삭제

				int currentPage = (page != null) ? page : 1;
				int listCount = arService.getAreaListCount(areaKey);
				PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
//				int pageNum = pi.getListCount() - (currentPage -1) * pi.getListLimit();
				int result = arService.deleteAreaReview(arKey);
				ArrayList<AreaReview> arList = arService.selectAreaReviewList(pi, areaKey);	
				if(result > 0) {
					mv.addObject("arList", arList);
					mv.addObject("areaKey", areaKey);
					mv.setViewName("redirect:areaReviewListView.do");
				}else {
					mv.addObject("areaKey", areaKey);
					mv.setViewName("redirect:areaReviewListView.do");
				}
				return mv;
			}
		
		// 파일 삭제
		public void deleteFile(String arPhoto, HttpServletRequest request) {
			String root = request.getSession().getServletContext().getRealPath("resources");
			String savePath = root + "\\areaImage";
			File file = new File(savePath + "\\" + arPhoto);
			if(file.exists()) {
				file.delete();
			}
		}
		
		// 리뷰 게시판에서의 검색
		@RequestMapping(value="searchAreaBoardReview.do", method=RequestMethod.GET)
		public ModelAndView searchAreaBoardReview(BoardSearch boardSearch, ModelAndView mv,@RequestParam(value="areaKey") int areaKey, Integer page) {
			int ak = areaKey;
			boardSearch.setAreaKey(ak);
			int currentPage = (page != null) ? page : 1;
			int listCount = arService.getSearchReviewListCount(boardSearch);
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			int pageNum = listCount - (currentPage -1) * pi.getListLimit();
			ArrayList<AreaReview> searchList = arService.searchAreaBoardReview(pi, boardSearch);
			if(!searchList.isEmpty()) {
				mv.addObject("arList", searchList);
				mv.addObject("search", boardSearch);
				mv.addObject("areaKey", areaKey);
				mv.addObject("pageNum", pageNum);
				mv.addObject("pi", pi);
				mv.setViewName("area/areaReviewList");
			}else {
				mv.addObject("msg", "리뷰 검색 실패!");
				mv.addObject("areaKey", areaKey);
				mv.setViewName("area/areaReviewList");
			}
			return mv;
		}
		
		
		// 댓글 등록
		@ResponseBody
		@RequestMapping(value="arCommentAdd.do", method = RequestMethod.POST)
		public String areaReviewCommentAdd(AreaReviewComment arc, HttpSession session) {
			Member loginUser = (Member)session.getAttribute("loginUser");
			String arcWriter = loginUser.getMemberId();
			arc.setArcWriter(arcWriter);
			int result = arService.insertAreaReviewComment(arc);
			if (result > 0) {
				return "success";
			}else {
				return "fail";
			}
		}
		
		// 댓글 조회
		@RequestMapping(value="arCommentList.do", method=RequestMethod.GET)
		public void areaReviewCommentList(HttpServletResponse response, int arKey)throws Exception {
			ArrayList<AreaReviewComment> arcList = arService.selectAreaReviewCommentList(arKey);
			for (AreaReviewComment arc : arcList) {
				arc.setArcContent(URLEncoder.encode(arc.getArcContent(), "utf-8"));
			}
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(arcList, response.getWriter());
		}
		
		// 댓글 삭제
		@ResponseBody
		@RequestMapping(value="arCommentDelete.do", method=RequestMethod.GET)
		public String areaReviewCommentDelete(int arcKey, Model model, HttpServletRequest request) {
			int result = arService.deleteAreaReviewComment(arcKey);
			if (result > 0) {
				return "success";
			} else {
				return "fail";
			}
		}

	}
