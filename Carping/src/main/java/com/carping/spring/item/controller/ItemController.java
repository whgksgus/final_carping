package com.carping.spring.item.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.carping.spring.cart.domain.Cart;
import com.carping.spring.cart.service.CartService;
import com.carping.spring.item.domain.Item;
import com.carping.spring.item.domain.PageInfo;
import com.carping.spring.item.domain.Pagination;
import com.carping.spring.item.domain.Search;
import com.carping.spring.item.service.ItemService;
import com.carping.spring.member.domain.Member;

@Controller
public class ItemController {
   
   @Autowired
   private ItemService iService;
   @Autowired
   private CartService cSvc;
   
   
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
   
   @RequestMapping( value="searchTent.do", method=RequestMethod.GET )
   public String searchTent(Search search, Model model) {
	   ArrayList<Item> searchList = iService.searchTentList(search);
		if(!searchList.isEmpty()) {
			model.addAttribute("iList", searchList);
			model.addAttribute("search", search);
			return "item/tentListView";
		}else {
			model.addAttribute("msg", "텐트 상품 검색 실패");
			return "common/erroePage";
		}
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
   @ResponseBody
   @RequestMapping(value="insertCart.do", method=RequestMethod.POST)
   public int insertCart( HttpServletRequest request, Model model, @RequestBody Map<String, Object> map ) {
	   int result = 0;
	   
	   HttpSession session = request.getSession();
	   Member mem = (Member) session.getAttribute( "loginUser" );
	   System.out.println( "itemController session memberdto >>>>> " + mem.toString() );
	   
	   String memberId = mem.getMemberId();
	   System.out.println( "itemController session memberId >>>>> " + memberId );
	   int itemKey = Integer.parseInt( map.get( "itemKey" ).toString() );		// ajax 에서 넘어온 map에서 데이터 받아오기
	   int cartQuantity = Integer.parseInt( map.get( "cartQuantity" ).toString() );
	   
	   Cart cart = new Cart( cartQuantity , itemKey, memberId );
	   
	   Map<String, Object> paramMap = new HashMap<String, Object>();
	   paramMap.put( "itemKey", itemKey );
	   paramMap.put("memberId", memberId );
	   int itemCheck = iService.checkItemKey( paramMap );	// 
	   if( itemCheck > 0 ) {
	   // 기존 장바구니에 데이터가 있을 경우 >>> update
   		int oldItemQuantity = cSvc.selectCartDetail( itemKey );
   		int newItemQuantity = cartQuantity + oldItemQuantity;		// 기존 수량에 추가된 수량 더하기
   		cart.setCartQuantity( newItemQuantity );
   		result = iService.updateCart( cart );
	   } else {
	   	 // 신규 아이템 등록
	   	 result = iService.insertCart( cart );
	   }
	   	 
	   return result;
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