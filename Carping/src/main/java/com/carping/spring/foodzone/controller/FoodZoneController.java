package com.carping.spring.foodzone.controller;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.activation.CommandMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import com.carping.spring.foodzone.domain.FoodZone;
import com.carping.spring.foodzone.domain.FoodZoneReview;
import com.carping.spring.foodzone.domain.Search;
import com.carping.spring.foodzone.domain.TakeOut;
import com.carping.spring.foodzone.domain.TakeOutReserve;
import com.carping.spring.foodzone.service.FoodZoneService;
import com.carping.spring.member.domain.Member;
import com.google.gson.Gson;
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

	@ResponseBody
	@RequestMapping(value="foodZoneSelect.do", method = RequestMethod.GET)
	public FoodZone foodZoneInfoSelect(String foodZoneName, Model model) {
		FoodZone foodZone = fzService.selectFoodZoneInfo(foodZoneName);
		if(foodZone.getFoodZoneEtc() == null || foodZone.getFoodZonePhone() == null) {
			foodZone.setFoodZoneEtc("기타사항 없음");
			foodZone.setFoodZonePhone("전화번호 없음");
		}
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

	@RequestMapping(value="foodZoneInsertView.do", method = RequestMethod.GET)
	public String insertFoodZoneView() {
		return "foodzone/insertFoodZone";
	}

	@RequestMapping(value="insertFoodZone.do", method = RequestMethod.POST)
	public void insertFoodZone(FoodZone foodZone, ModelAndView mv, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(name="uploadFile", required = false) MultipartFile uploadFile) throws Exception  {

		if(!uploadFile.getOriginalFilename().equals("")) {
			String fileName = saveFile(uploadFile, request);
			if(fileName!=null) {
				foodZone.setFoodZoneImage(uploadFile.getOriginalFilename());
			}
		}
		int result = 0;
		result = fzService.insertFoodZone(foodZone);
		response.setContentType("text/html; charset=utf-8");

		PrintWriter out = response.getWriter();
		if(result>0) {
			out.println("<script>alert('등록이 완료되었습니다. 메뉴판을 추가해보세요.'); location.href='insertInfo.do';</script>");
		}else {
			out.println("<script>alert('등록이 실패하였습니다.'); location.href='home.do';</script>");

		}
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
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\images";
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

	@RequestMapping(value="foodZoneMenuInsertView.do", method =  RequestMethod.GET)
	public String foodZoneMenuInsertView() {
		return "foodzone/menuInsert";
	}

	@ResponseBody
	@RequestMapping(value="searchFoodZone", method = RequestMethod.GET,  produces = "application/text; charset=utf8")
	public String searchFoodZone(String foodZoneName) {
		ArrayList<FoodZone> fList = fzService.searchMenuFoodZone(foodZoneName);
		Gson gson = new Gson();
		String jsonFoodZone = gson.toJson(fList);
		System.out.println(jsonFoodZone);
		return jsonFoodZone;
	}

	@RequestMapping(value="insertMenu.do", method = RequestMethod.POST)
	public void menuInsert(@RequestParam(name="uploadFile", required = false) MultipartFile[] uploadFile, HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		String[] foodZoneKey = request.getParameterValues("foodZoneKey");
		String[] takeOutMenu = request.getParameterValues("takeOutMenu");
		String[] takeOutMenuPrice = request.getParameterValues("takeOutMenuPrice");
		int chk = 0;
		response.setContentType("text/html; charset=utf-8");
		for(int i=0; i<foodZoneKey.length;i++) {
			TakeOut takeOut = new TakeOut();
			takeOut.setFoodZoneKey(Integer.parseInt(foodZoneKey[i]));
			takeOut.setTakeOutMenu(takeOutMenu[i]);
			takeOut.setTakeOutMenuPrice(Integer.parseInt(takeOutMenuPrice[i]));
			if(!uploadFile[i].getOriginalFilename().equals("")) {
				String fileName = saveFileMenu(uploadFile[i], request);
				if(fileName!=null) {
					takeOut.setTakeOutMenuPhoto(uploadFile[i].getOriginalFilename());
				}
			}

			int result = fzService.insertMenu(takeOut);
			if(result>0) {
				chk++;
			}

			if(i==foodZoneKey.length-1) {
				if(chk==foodZoneKey.length) {
					out.println("<script>alert('정상적으로 등록되었습니다.'); location.href='foodZoneMenuInsertView.do';</script>");
				}else {
					out.println("<script>alert('오류발생.'); location.href='foodZoneMenuInsertView.do';</script>");
				}
			}
		}
	}

	public String saveFileMenu(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\images\\menu";
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
	
	@RequestMapping(value = "fsearchsido.do", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String search(Search search) {
		return search.getSido() + " " + search.getSigun() + " " + search.getAddress();
	}
}
