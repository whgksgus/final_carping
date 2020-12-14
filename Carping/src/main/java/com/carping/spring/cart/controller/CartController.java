package com.carping.spring.cart.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.carping.spring.cart.service.CartService;
@Controller
public class CartController {
	
	@Autowired
	private CartService cService;
	
	// 장바구니 등록 후 장바구니 페이지 이동
   @RequestMapping( value="cartListView.do", method = RequestMethod.GET )
	public String cartListView(HttpServletRequest request, Model model) {
	   ArrayList<Map<String, Object>> cart = cService.selectCartList();
		System.out.println( cart );
	   model.addAttribute( "cart", cart );
		return "item/cartListView";
	}
	
   // 선택한 상품 삭제
   @ResponseBody
   @RequestMapping( value = "deleteCart.do", method=RequestMethod.POST )
	public String deleteCart( @RequestBody int cartKey ) {
	   System.out.println( cartKey );
	   
	   int result = cService.deleteCart( cartKey );
		   
	   if ( result >0 ) {
		   return "redirect:cartListView.do";
	   } else {
		   return "";
	   }
	}
	
	/*
	 * public String modifyCartQuantity(HttpServletRequest request, Model model) {
	 * return ""; }
	 */
   
   
	public String deleteAllCart(HttpServletRequest request, Model model) {
		return "";
	}
	
	public String orderCart(HttpServletRequest request, int totalPrice, Model model) {
		return "";
	}
	
	public ModelAndView orderListView(HttpServletRequest request, ModelAndView mv, Integer page) {
		return mv;
	}
}
