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

import com.carping.spring.cart.domain.Cart;
import com.carping.spring.item.domain.PageInfo;
import com.carping.spring.item.domain.Pagination;
import com.carping.spring.common.Search;
import com.carping.spring.item.domain.Item;
import com.carping.spring.item.service.ItemService;

@Controller
public class ItemController {
   
   @Autowired
   private ItemService iService;
   
   
   // 텐트 상품 목록 보기
   @RequestMapping(value="tentListView.do", method=RequestMethod.GET)
   public ModelAndView tentListView(ModelAndView mv, @RequestParam(value="page", required=false) Integer page) {
      int currentPage = (page != null) ? page : 1;
      int listCount = iService.getListCount();
      PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
      ArrayList<Item> iList = iService.selectTentList(pi);
      if(!iList.isEmpty()) {
         mv.addObject("iList", iList);
         mv.addObject("pi", pi);
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
 
   // 장바구니에 상품 등록   
   @RequestMapping(value="insertCart.do", method=RequestMethod.POST)
   public String insertCart(int cartQuantity, HttpServletRequest request, int itemKey, Model model) {
	   
	   	 HttpSession session = request.getSession();
	   	 String memberId = session.getAttribute("loginUser");
		 int result = 0;
	     String path = null;
	     Cart cart = new Cart(cartQuantity, itemKey, memberId);
	      
	      result = iService.insertCart(cart);
	      if(result > 0) {
	         path = "redirect:cartListView.do";
	      }else {
	         model.addAttribute("msg", "장바구니 상품 등록 실패");
	         path = "common/erroPage";
	      }
	      return path;
   }
   
   public String orderItem(int cartQuantity, HttpServletRequest request, int itemKey, Model model) {
      return "";
   }
   
   // 상품 상세 보기
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