package com.carping.spring.item.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.carping.spring.common.PageInfo;
import com.carping.spring.common.Pagination;
import com.carping.spring.common.Search;
import com.carping.spring.item.domain.Item;
import com.carping.spring.item.service.ItemService;

@Controller
public class ItemController {
   
   @Autowired
   private ItemService iService;
   
   @RequestMapping(value="tentListView.do", method=RequestMethod.GET)
   public ModelAndView tentListView(ModelAndView mv, @RequestParam(value="page", required=false) Integer page) {
      int currentPage = (page != null) ? page : 1;
      int listCount = iService.getListCount();
      PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
      ArrayList<Item> iList = iService.selectTentList(pi);
      if(!iList.isEmpty()) {
         mv.addObject("iList", iList);
         mv.setViewName("item/tentListView");
      }else {
         mv.addObject("msg", "상품 목록 조회 실패");
         mv.setViewName("common/errorPage");
      }
      return mv;
   }
   
   public ModelAndView tentListNew(ModelAndView mv, Integer page) {
      return mv;
   }
   
   public ModelAndView tentListLow(ModelAndView mv, Integer page) {
      return mv;
   }
   
   public ModelAndView tentListHigh(ModelAndView mv, Integer page) {
      return mv;
   }
   
   public ModelAndView searchTent(ModelAndView mv, Integer page, Search search) {
      return mv;
   }
   
   // 
   
   public ModelAndView cookListView(ModelAndView mv, Integer page) {
      return mv;
   }
   
   public ModelAndView cookListNew(ModelAndView mv, Integer page) {
      return mv;
   }
   
   public ModelAndView cookListLow(ModelAndView mv, Integer page) {
      return mv;
   }
   
   public ModelAndView cookListHigh(ModelAndView mv, Integer page) {
      return mv;
   }
   
   public ModelAndView searchCook(ModelAndView mv, Integer page, Search search) {
      return mv;
   }
   
   //
   
   public ModelAndView sleepListView(ModelAndView mv, Integer page) {
      return mv;
   }
   
   public ModelAndView sleepListNew(ModelAndView mv, Integer page) {
      return mv;
   }
   
   public ModelAndView sleepListLow(ModelAndView mv, Integer page) {
      return mv;
   }
   
   public ModelAndView sleepListHigh(ModelAndView mv, Integer page) {
      return mv;
   }
   
   public ModelAndView searchSleep(ModelAndView mv, Integer page, Search search) {
      return mv;
   }
   
   //
   
   public ModelAndView etcListView(ModelAndView mv, Integer page) {
      return mv;
   }
   
   public ModelAndView etcListNew(ModelAndView mv, Integer page) {
      return mv;
   }
   
   public ModelAndView etcListLow(ModelAndView mv, Integer page) {
      return mv;
   }
   
   public ModelAndView etcListHigh(ModelAndView mv, Integer page) {
      return mv;
   }
   
   public ModelAndView searchEtc(ModelAndView mv, Integer page, Search search) {
      return mv;
   }
   //    
   
   @RequestMapping(value="insertCart.do", method=RequestMethod.POST)
   public String insertCart(int cartQuantity, HttpServletRequest request, int itemKey, Model model) {
	   model.addAttribute("item",iService.insertCart(cart)); 
		return "redirect:/";
   }
   
   public String orderItem(int cartQuantity, HttpServletRequest request, int itemKey, Model model) {
      return "";
   }
   
   @RequestMapping(value="itemDetail.do", method = RequestMethod.GET)
   public String itemDetail(int itemKey, Model model) {
			Item item = iService.selectItemDetail(itemKey);
			if(item != null) {
				model.addAttribute("item", item);
				return "item/itemDetailView";
			}else {
				model.addAttribute("msg", "상품 상세조회 실패");
				return "common/errorPage";
			}
   }
   
}