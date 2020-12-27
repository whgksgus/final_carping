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
         mv.setViewName("item/tentListView");
      }
      return mv;
   }

   // 텐트 새상품순 정렬
   @RequestMapping( value="tentListNew.do", method=RequestMethod.GET )
   public ModelAndView tentListNew(ModelAndView mv, Integer page) {
      int currentPage = (page != null) ? page : 1;
      int listCount = iService.getListCount();
      PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
      ArrayList<Item> iList = iService.selectTentNew(pi);
      if(!iList.isEmpty()) {
         mv.addObject("iList", iList);
         mv.addObject("pi", pi);
         mv.setViewName("item/tentListView");
      }else {
         mv.addObject("msg", "상품 목록 조회 실패");
         mv.setViewName("item/tentListView");
      }
      return mv;
   }

   // 텐트 낮은가격순 정렬
   @RequestMapping( value="tentListLow.do", method=RequestMethod.GET )
   public ModelAndView tentListLow(ModelAndView mv, Integer page) {
      int currentPage = (page != null) ? page : 1;
      int listCount = iService.getListCount();
      PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
      ArrayList<Item> iList = iService.selectTentLow(pi);
      if(!iList.isEmpty()) {
         mv.addObject("iList", iList);
         mv.addObject("pi", pi);
         mv.setViewName("item/tentListView");
      }else {
         mv.addObject("msg", "상품 목록 조회 실패");
         mv.setViewName("item/tentListView");
      }
      return mv;
   }
   
   // 텐트 높은가격순 정렬
   @RequestMapping( value="tentListHigh.do", method=RequestMethod.GET )
   public ModelAndView tentListHigh(ModelAndView mv, Integer page) {
      int currentPage = (page != null) ? page : 1;
      int listCount = iService.getListCount();
      PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
      ArrayList<Item> iList = iService.selectTentHigh(pi);
      if(!iList.isEmpty()) {
         mv.addObject("iList", iList);
         mv.addObject("pi", pi);
         mv.setViewName("item/tentListView");
      }else {
         mv.addObject("msg", "상품 목록 조회 실패");
         mv.setViewName("item/tentListView");
      }
      return mv;
   }

   // 텐트 상품 내 검색
   @RequestMapping( value="searchTent.do", method=RequestMethod.GET )
      public String searchTent(Search search, Model model, Integer page) {
         int currentPage = (page != null) ? page : 1;
         int listCount = iService.getSearchCount(search);
         PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
         ArrayList<Item> searchList = iService.searchTentList(search, pi);
         if(!searchList.isEmpty()) {
            model.addAttribute("iList", searchList);
            model.addAttribute("pi", pi);
            model.addAttribute("search", search);
            return "item/tentListView";
         }else {
         model.addAttribute("msg", "상품 검색 실패");
         model.addAttribute("url", "javascript:history.back();");
         return "common/redirect";
      }
   }

   // 취사도구 상품 목록 보기
   @RequestMapping( value="cookListView.do", method=RequestMethod.GET )
   public ModelAndView cookListView(ModelAndView mv, Integer page) {
      int currentPage = (page != null) ? page : 1;
      int listCount = iService.getListCount();
      PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
      ArrayList<Item> iList = iService.selectCookList(pi);
      if(!iList.isEmpty()) {
         mv.addObject("iList", iList);
         mv.addObject("pi", pi);
         mv.setViewName("item/cookListView");
      }else {
         mv.addObject("msg", "상품 목록 조회 실패");
         mv.addObject("url", "javascript:history.back();");
         mv.setViewName("common/redirect");
      }
      return mv;
   }

   @RequestMapping( value="cookListNew.do", method=RequestMethod.GET)
   public ModelAndView cookListNew(ModelAndView mv, Integer page) {
      int currentPage = (page != null) ? page : 1;
      int listCount = iService.getListCount();
      PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
      ArrayList<Item> iList = iService.selectCookNew(pi);
      if (!iList.isEmpty()) {
         mv.addObject("iList", iList);
         mv.addObject("pi", pi);
         mv.setViewName("item/cookListView");
      }else {
         mv.addObject("msg", "상품 목록 조회 실패");
         mv.addObject("url", "javascript:history.back();");
         mv.setViewName("common/redirect");
      }
      return mv;
   }

   @RequestMapping( value="cookListLow.do", method=RequestMethod.GET )
   public ModelAndView cookListLow(ModelAndView mv, Integer page) {
      int currentPage = (page != null) ? page : 1;
      int listCount = iService.getListCount();
      PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
      ArrayList<Item> iList = iService.selectCookLow(pi);
      if(!iList.isEmpty()) {
         mv.addObject("iList", iList);
         mv.addObject("pi", pi);
         mv.setViewName("item/cookListView");
      }else {
         mv.addObject("msg", "상품 목록 조회 실패");
         mv.addObject("url", "javascript:history.back();");
         mv.setViewName("common/redirect");
      }
      return mv;
   }


   @RequestMapping( value="cookListHigh.do", method=RequestMethod.GET )
   public ModelAndView cookListHigh(ModelAndView mv, Integer page) {
      int currentPage = (page != null) ? page : 1;
      int listCount = iService.getListCount();
      PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
      ArrayList<Item> iList = iService.selectCookHigh(pi);
      if(!iList.isEmpty()) {
         mv.addObject("iList", iList);
         mv.addObject("pi", pi);
         mv.setViewName("item/cookListView");
      }else {
         mv.addObject("msg", "상품 목록 조회 실패");
         mv.addObject("url", "javascript:history.back();");
         mv.setViewName("common/redirect");
      }
      return mv;
   }


   @RequestMapping( value="searchCook.do", method=RequestMethod.GET )
   public String searchCook(Search search, Model model, Integer page){
      int currentPage = (page != null) ? page : 1;
       int listCount = iService.getSearchCount(search);
      PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
      ArrayList<Item> searchList = iService.searchCookList(search, pi);
      if(!searchList.isEmpty()) {
         model.addAttribute("iList", searchList);
         model.addAttribute("pi", pi);
         model.addAttribute("search", search);
         return "item/cookListView";
      }else {
         model.addAttribute("msg", "상품 검색 실패");
         model.addAttribute("url", "javascript:history.back();");
         return "common/redirect";
      }
   }


   @RequestMapping( value="sleepListView.do", method=RequestMethod.GET )
   public ModelAndView sleepListView(ModelAndView mv, Integer page) {
      int currentPage = (page != null) ? page : 1;
      int listCount = iService.getListCount();
      PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
      ArrayList<Item> iList = iService.selectSleepList(pi);
      if(!iList.isEmpty()) {
         mv.addObject("iList", iList);
         mv.addObject("pi", pi);
         mv.setViewName("item/sleepListView");
      }else {
         mv.addObject("msg", "상품 목록 조회 실패");
         mv.addObject("url", "javascript:history.back();");
         mv.setViewName("common/redirect");
      }
      return mv;
   }

   @RequestMapping( value="sleepListNew.do", method=RequestMethod.GET)
   public ModelAndView sleepListNew(ModelAndView mv, Integer page) {
      int currentPage = (page != null) ? page : 1;
      int listCount = iService.getListCount();
      PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
      ArrayList<Item> iList = iService.selectSleepNew(pi);
      if (!iList.isEmpty()) {
         mv.addObject("iList", iList);
         mv.addObject("pi", pi);
         mv.setViewName("item/sleepListView");
      }else {
         mv.addObject("msg", "상품 목록 조회 실패");
         mv.addObject("url", "javascript:history.back();");
         mv.setViewName("common/redirect");
      }
      return mv;
   }

   @RequestMapping( value="sleepListLow.do", method=RequestMethod.GET )
   public ModelAndView sleepListLow(ModelAndView mv, Integer page) {
      int currentPage = (page != null) ? page : 1;
      int listCount = iService.getListCount();
      PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
      ArrayList<Item> iList = iService.selectSleepLow(pi);
      if(!iList.isEmpty()) {
         mv.addObject("iList", iList);
         mv.addObject("pi", pi);
         mv.setViewName("item/sleepListView");
      }else {
         mv.addObject("msg", "상품 목록 조회 실패");
         mv.addObject("url", "javascript:history.back();");
         mv.setViewName("common/redirect");
      }
      return mv;
   }

   @RequestMapping( value="sleepListHigh.do", method=RequestMethod.GET )
   public ModelAndView sleepListHigh(ModelAndView mv, Integer page) {
      int currentPage = (page != null) ? page : 1;
      int listCount = iService.getListCount();
      PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
      ArrayList<Item> iList = iService.selectSleepHigh(pi);
      if(!iList.isEmpty()) {
         mv.addObject("iList", iList);
         mv.addObject("pi", pi);
         mv.setViewName("item/sleepListView");
      }else {
         mv.addObject("msg", "상품 목록 조회 실패");
         mv.addObject("url", "javascript:history.back();");
         mv.setViewName("common/redirect");
      }
      return mv;
   }


   @RequestMapping( value="searchSleep.do", method=RequestMethod.GET )
   public String searchSleep(Search search, Model model, Integer page) {
      int currentPage = (page != null) ? page : 1;
      int listCount = iService.getSearchCount(search);
      PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
      ArrayList<Item> searchList = iService.searchSleepList(search, pi);
      if(!searchList.isEmpty()) {
         model.addAttribute("iList", searchList);
         model.addAttribute("pi", pi);
         model.addAttribute("search", search);
         return "item/sleepListView";
      }else {
         model.addAttribute("msg", "상품 검색 실패");
         model.addAttribute("url", "javascript:history.back();");
         return "common/redirect";
      }
   }

   @RequestMapping( value="etcListView.do", method=RequestMethod.GET )
   public ModelAndView etcListView(ModelAndView mv, Integer page) {
      int currentPage = (page != null) ? page : 1;
      int listCount = iService.getListCount();
      PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
      ArrayList<Item> iList = iService.selectEtcList(pi);
      if(!iList.isEmpty()) {
         mv.addObject("iList", iList);
         mv.addObject("pi", pi);
         mv.setViewName("item/etcListView");
      }else {
         mv.addObject("msg", "상품 목록 조회 실패");
         mv.addObject("url", "javascript:history.back();");
         mv.setViewName("common/redirect");
      }
      return mv;
   }

   @RequestMapping( value="etcListNew.do", method=RequestMethod.GET)
   public ModelAndView etcListNew(ModelAndView mv, Integer page) {
      int currentPage = (page != null) ? page : 1;
      int listCount = iService.getListCount();
      PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
      ArrayList<Item> iList = iService.selectEtcNew(pi);
      if (!iList.isEmpty()) {
         mv.addObject("iList", iList);
         mv.addObject("pi", pi);
         mv.setViewName("item/etcListView");
      }else {
         mv.addObject("msg", "상품 목록 조회 실패");
         mv.addObject("url", "javascript:history.back();");
         mv.setViewName("common/redirect");
      }
      return mv;
   }

   @RequestMapping( value="etcListLow.do", method=RequestMethod.GET )
   public ModelAndView etcListLow(ModelAndView mv, Integer page) {
      int currentPage = (page != null) ? page : 1;
      int listCount = iService.getListCount();
      PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
      ArrayList<Item> iList = iService.selectEtcLow(pi);
      if(!iList.isEmpty()) {
         mv.addObject("iList", iList);
         mv.addObject("pi", pi);
         mv.setViewName("item/etcListView");
      }else {
         mv.addObject("msg", "상품 목록 조회 실패");
         mv.addObject("url", "javascript:history.back();");
         mv.setViewName("common/redirect");
      }
      return mv;
   }


   @RequestMapping( value="etcListHigh.do", method=RequestMethod.GET )
   public ModelAndView etcListHigh(ModelAndView mv, Integer page) {
      int currentPage = (page != null) ? page : 1;
      int listCount = iService.getListCount();
      PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
      ArrayList<Item> iList = iService.selectEtcHigh(pi);
      if(!iList.isEmpty()) {
         mv.addObject("iList", iList);
         mv.addObject("pi", pi);
         mv.setViewName("item/etcListView");
      }else {
         mv.addObject("msg", "상품 목록 조회 실패");
         mv.addObject("url", "javascript:history.back();");
         mv.setViewName("common/redirect");
      }
      return mv;
   }

   @RequestMapping( value="searchEtc.do", method=RequestMethod.GET )
   public String searchEtc(Search search, Model model, Integer page) {
      int currentPage = (page != null) ? page : 1;
       int listCount = iService.getSearchCount(search);
      PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
      ArrayList<Item> searchList = iService.searchEtcList(search, pi);
      if(!searchList.isEmpty()) {
         model.addAttribute("iList", searchList);
         model.addAttribute("pi", pi);
         model.addAttribute("search", search);
         return "item/etcListView";
      }else {
         model.addAttribute("msg", "상품 검색 실패");
         model.addAttribute("url", "javascript:history.back();");
         return "common/redirect";
      }
   }


   // 장바구니에 상품 등록   
   @ResponseBody
   @RequestMapping(value="insertCart.do", method=RequestMethod.POST)
   public int insertCart( HttpServletRequest request, Model model, @RequestBody Map<String, Object> map ) {
      int result = 0;

      HttpSession session = request.getSession();
      Member mem = (Member) session.getAttribute( "loginUser" );

      String memberId = mem.getMemberId();
      System.out.println( "itemController session memberId >>>>> " + memberId );
      int itemKey = Integer.parseInt( map.get( "itemKey" ).toString() );      // ajax 에서 넘어온 map에서 데이터 받아오기
      int cartQuantity = Integer.parseInt( map.get( "cartQuantity" ).toString() );

      Cart cart = new Cart( cartQuantity , itemKey, memberId );
      cart.setCartStatus( "N" );

      Map<String, Object> paramMap = new HashMap<String, Object>();
      paramMap.put( "itemKey", itemKey );
      paramMap.put("memberId", memberId );
      int itemCheck = iService.checkItemKey( paramMap );   // 
      if( itemCheck > 0 ) {
         // 기존 장바구니에 데이터가 있을 경우 >>> update
         int oldItemQuantity = cSvc.selectCartDetail( cart );
         int newItemQuantity = cartQuantity + oldItemQuantity;      // 기존 수량에 추가된 수량 더하기
         cart.setCartQuantity( newItemQuantity );
         result = iService.updateCart( cart );
      } else {
         // 신규 아이템 등록
         result = iService.insertCart( cart );
      }

      return result;
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
         model.addAttribute("url", "javascript:history.back();");
         return "common/redirect";
      }
   }

   // 상품 디테일 페이지에서 바로 구매
   @ResponseBody
   @RequestMapping(value="orderItem.do", method=RequestMethod.POST)
   public int orderItem(@RequestBody Cart cart, HttpServletRequest request, Model model) {

      System.out.println( "cartQuantity from ajax>>> " + cart.getCartQuantity() );
      System.out.println( "cartQuantity from itemKey>>> " + cart.getItemKey() );

      // 로그인 유저 아이디 불러오기
      HttpSession session = request.getSession();
      Member mem = (Member) session.getAttribute( "loginUser" );
      String memberId = mem.getMemberId();
      cart.setMemberId(memberId);
      cart.setCartStatus( "Y" );

      return iService.insertCart(cart);
   }

}