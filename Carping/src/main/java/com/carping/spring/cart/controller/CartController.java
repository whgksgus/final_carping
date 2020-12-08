package com.carping.spring.cart.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.carping.spring.cart.service.CartService;

public class CartController {
	private CartService cService;
	
	public String cartListView(HttpServletRequest request, Model model) {
		return "";
	}
	
	public String deleteCart(int cartKey, Model model) {
		return "";
	}
	
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
