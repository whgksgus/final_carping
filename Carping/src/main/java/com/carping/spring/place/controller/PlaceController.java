package com.carping.spring.place.controller;

import java.io.File;
import java.text.SimpleDateFormat;
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
import com.carping.spring.place.domain.SearchMap;
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
	public String sidoSearch(SearchMap search) {
		return search.getSido()+" "+search.getSigun()+" "+search.getAddress(); 
	}
	
	@RequestMapping(value = "placeInsertView.do", method = RequestMethod.GET)
	public String placeInsertView() {
		return "place/placeInsertView";
	}
	
	@RequestMapping(value="selectPlaceInfo.do", method=RequestMethod.GET)
	@ResponseBody
	public Place placeInfoSelect(String placeName, Model model) {
		Place place = pService.selectPlaceInfo(placeName);
		if(place.getPlaceEtc() == null) {
			place.setPlaceEtc("기타사항 없음");
		}
		return place;
	}
	
	@ResponseBody
	@RequestMapping(value="selectPlaceReview.do", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	public String placeReviewList(int placeKey) {
		ArrayList<PlaceReview> prList = pService.selectPlaceReviewlist(placeKey);
		Gson gson = new Gson();
		String jsonPlaceReview = gson.toJson(prList);
		return jsonPlaceReview;
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
	
	@RequestMapping(value = "insertPlace.do", method = RequestMethod.POST)
	public String insertPlace(Place place, Model model, HttpServletRequest request, 
			@RequestParam(name="uploadFile", required = false) MultipartFile uploadFile) {
		System.out.println(place.toString());
		if(!uploadFile.getOriginalFilename().equals("")) {
			String renameFilename = saveFile(uploadFile, request);
			if (renameFilename != null) {
				place.setPlaceImage(renameFilename);
			}
		}
		int result = 0;
		String path = null;
		result = pService.insertPlace(place);
		if (result > 0) {
			path = "place/placeInsertView";
		}else {
			model.addAttribute("msg", "장소 등록 실패");
			model.addAttribute("url", "placecView.do");
			path = "common/redirect";
		}
		return path;
	}
	
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\placeImage";

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
	
}
