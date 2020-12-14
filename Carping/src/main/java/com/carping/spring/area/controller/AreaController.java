package com.carping.spring.area.controller;

import java.io.File;
import java.text.SimpleDateFormat;
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
import com.carping.spring.area.domain.AreaReview;
import com.carping.spring.area.service.AreaService;
import com.carping.spring.common.Search;
import com.carping.spring.common.SearchMap;
import com.carping.spring.foodzone.domain.FoodZone;
import com.carping.spring.place.domain.Place;
import com.google.gson.Gson;

@Controller
public class AreaController {

	@Autowired
	private AreaService aService;

	@RequestMapping(value = "areaInfoView.do", method = RequestMethod.GET)
	public ModelAndView areaInfoView(ModelAndView mv) {
		ArrayList<Area> aList = aService.selectAreaList();
		mv.addObject("aList", aList);
		mv.setViewName("area/areaInfoView");
		return mv;
	}

	@RequestMapping(value = "areaInsertView.do", method = RequestMethod.GET)
	public String areaInsertView() {
		return "area/areaInsertView";
	}

	public String areaSearch(Search search, Model model) {
		return "";
	}

	@RequestMapping(value = "selectAreaInfo.do", method = RequestMethod.GET)
	@ResponseBody
	public Area areaInfoSelect(String areaName, Model model) {
		Area area = aService.selectAreaInfo(areaName);
		return area;
	}

	public String areaReviewSelect(int arKey, Model model) {
		return "";
	}
	
	@ResponseBody
	@RequestMapping(value="selectP.do", method=RequestMethod.POST)
	public Place placeInfoSelect(int placeKey) {
		Place pl = aService.selectPlaceInfo(placeKey);
		return pl;
	}
	
	@ResponseBody
	@RequestMapping(value="selectFz.do", method=RequestMethod.POST)
	public FoodZone foodZoneInfoSelect(int foodZoneKey) {
		FoodZone fz = aService.selectFoodZoneInfo(foodZoneKey);
		return fz;
	}

	@ResponseBody
	@RequestMapping(value="selectAreview.do", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	public String areaReviewList(int areaKey) {
		ArrayList<AreaReview> arList = aService.selectAreaReviewList(areaKey);
		Gson gson = new Gson();
		String jsonAreaReview = gson.toJson(arList);
		System.out.println(jsonAreaReview);
		return jsonAreaReview;
	}

	public String areaReviewScoreAvg(int areaKey, Model model) {
		return "";
	}

	@ResponseBody
	@RequestMapping(value="areaScoreAvgUpdate.do", method = RequestMethod.GET)
	public double scoreAvgUpdate(String areaName, Model model) {
		Area area = aService.selectAreaInfo(areaName);
		int areaKey = area.getAreaKey();
		double areaAvg = 0;
		try {
			areaAvg = aService.selectAreaReviewScoreAvg(areaKey);
		} catch (Exception e) {
			areaAvg = 0;
			e.printStackTrace();
		}
		return areaAvg;
	}

	public String registerCategoryForm() {
		return "";
	}

	public String areaRegisterForm() {
		return "";
	}

	@ResponseBody
	@RequestMapping(value = "selectFzList.do", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public String selectFoodZoneList(String areaAddress) {
		String selectAddr = areaAddress.substring(0, 9) + "%";
		ArrayList<FoodZone> fList = aService.selectFoodZoneList(selectAddr);
		Gson gson = new Gson();
		String jsonFoodzone = gson.toJson(fList);
		return jsonFoodzone;
	}

	@ResponseBody
	@RequestMapping(value = "selectPList.do", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public String selectPlaceList(String areaAddress) {
		String selectAddr = areaAddress.substring(0, 9) + "%";
		ArrayList<Place> pList = aService.selectPlaceList(selectAddr);
		Gson gson = new Gson();
		String jsonFoodzone = gson.toJson(pList);
		return jsonFoodzone;
	}

	@RequestMapping(value = "insertArea.do", method = RequestMethod.POST)
	public String insertArea(Area area, Model model, HttpServletRequest request,
			@RequestParam(name = "uploadFile", required = false) MultipartFile uploadFile) {
		// 파일을 서버에 저장하는 작업
		if (!uploadFile.getOriginalFilename().equals("")) {
			String renameFilename = saveFile(uploadFile, request);
			if (renameFilename != null) {
				area.setAreaImage(uploadFile.getOriginalFilename());
				area.setAreaImage(renameFilename);
			}
	}
	// 데이터를 디비에 저장하는 작업
	int result = 0;
	String path = null;
	result = aService.insertArea(area);
	if (result > 0) {
		path = "area/areaInsertView";
	} else {
		model.addAttribute("msg", "장소 등록 실패");
		path = "common/erroPage";
	}
	return path;
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
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
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

public void deleteFile(String areaImage, HttpServletRequest request) {

}

@RequestMapping(value = "asearchsido.do", method = RequestMethod.POST, produces = "application/text; charset=utf8")
@ResponseBody
public String search(SearchMap searchMap) {
	return searchMap.getSido() + " " + searchMap.getSigun() + " " + searchMap.getAddress();
}
}
