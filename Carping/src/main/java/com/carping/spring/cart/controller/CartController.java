package com.carping.spring.cart.controller;

import java.util.List;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import com.carping.spring.member.domain.Member;
@Controller
public class CartController {
	
	@Autowired
	private CartService cService;
	
	// 장바구니 등록 후 장바구니 페이지 이동
   @RequestMapping( value="cartListView.do", method = RequestMethod.GET )
	public String cartListView(HttpServletRequest request, Model model) {
	   // 로그인 유저 아이디 불러오기
	   HttpSession session = request.getSession();
	   Member mem = (Member) session.getAttribute( "loginUser" );
	   String memberId = mem.getMemberId();
	   System.out.println( "memberId in cartController>>>>> " + memberId );
	   
	   ArrayList<Map<String, Object>> cart = cService.selectCartList( memberId );
	   int grandTotal = 0;
	   StringBuffer cartKeys = new StringBuffer();
	   
	   for( Map<String, Object> map : cart ) {
		   int cartQuantity = Integer.parseInt( map.get("CART_QUANTITY").toString() );
		   int cartPrice = Integer.parseInt( map.get( "ITEM_PRICE").toString() );
		   int totalPrice = cartQuantity * cartPrice;
		   grandTotal += totalPrice;
		   map.put( "totalPrice", totalPrice );
		   
		   // CART_STATUS 업데이트를 위한 작업
		   cartKeys.append( map.get("CART_KEY") );
		   cartKeys.append( "/" );
	   }
	   // grandTotal을 model에 넣어줘야함
	   model.addAttribute( "grandTotal", grandTotal );
	   model.addAttribute( "cartKeys", cartKeys );
	   model.addAttribute( "cart", cart );
		return "item/cartListView";
	}
   
   // 선택한 상품 삭제
   @ResponseBody
   @RequestMapping( value = "deleteCart.do", method=RequestMethod.POST )
	public int deleteCart( @RequestBody int cartKey, Model model ) {
	   return cService.deleteCart( cartKey );
	}
	
   
	// 장바구니 수량 변경
   @ResponseBody
   @RequestMapping( value = "updateCartList.do", method = RequestMethod.POST )
	public int modifyCartQuantity( @RequestBody Cart cart ) {
	   return cService.updateCartList( cart );
	}
	
   
   
   @ResponseBody
   @RequestMapping( value = "deleteAllCart.do", method=RequestMethod.POST )
	public int deleteAllCart(HttpServletRequest request, Model model) {
	   Cart cart = new Cart();
	   HttpSession session = request.getSession();
	   Member mem = (Member) session.getAttribute( "loginUser" );
	   String memberId = mem.getMemberId();
	   cart.setMemberId(memberId);
	   cart.setCartStatus( "N" );
	   return cService.deleteAllCart( cart );
	}
	
	@ResponseBody
	@RequestMapping ( value="insertOrder.do", method=RequestMethod.POST ) 
	public int orderCart( HttpServletRequest request, @RequestBody String[] data ) {
		// 로그인 유저 아이디 불러오기
		HttpSession session = request.getSession();
		Member mem = (Member) session.getAttribute( "loginUser" );
		String memberId = mem.getMemberId();
		
		int result = 0;
		
		for( String i : data ) {
			if( ! i.isEmpty() ) {
				Cart cart = new Cart();
				cart.setCartKey( Integer.parseInt(i) );
				cart.setMemberId( memberId );
				cart.setCartStatus( "Y" );
				cService.orderCart( cart );
				result ++;
			}
		} 
		 return result;
	}
	
	@RequestMapping (value="myOrderView.do", method=RequestMethod.GET)
	public String orderListView(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		Member mem = (Member) session.getAttribute( "loginUser" );
		String memberId = mem.getMemberId();
		
		ArrayList<Map<String, Object>> rslt = cService.selectOrderList(memberId);
		System.out.println( "rslt npe fuck you>>> " + rslt );
		for( Map<String, Object> map : rslt ) {
			if( map.containsKey( "CART_ORDERDATE" ) ) {
				String date = new SimpleDateFormat( "yyyy-MM-dd" ).format( map.get( "CART_ORDERDATE" ) );
				map.put( "CART_ORDERDATE", date );
			}
			int itemPrice = Integer.parseInt( map.get( "ITEM_PRICE" ).toString() );
			int cartQuan = Integer.parseInt( map.get( "CART_QUANTITY" ).toString() );
			int eachPrice = itemPrice * cartQuan;
			map.put( "TOTAL_PRICE", eachPrice );
		}
		
		model.addAttribute( "orderList", rslt );
		
		return "item/orderListView";
	}
}
