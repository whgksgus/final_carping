package com.carping.spring.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.carping.spring.member.domain.Member;
import com.carping.spring.member.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	@RequestMapping(value="login.do", method=RequestMethod.GET)
	public String loginForm() {
		return "member/loginForm";
	}
	
	public String enrollForm() {
		return "";
	}
	
	public String findPwForm() {
		return "";
	}
	
	@RequestMapping(value="loginMember.do", method=RequestMethod.POST)
	public ModelAndView memberLogin(String memberId, String memberPwd, ModelAndView mv, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		Member member = new Member(memberId, memberPwd);
		Member loginUser = mService.loginMember(member);
		
		if(loginUser != null) {
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("home");
		}else {
			mv.addObject("msg", "로그인 실패!");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	public String memberLogout(HttpServletRequest request) {
		return "";
	}
	
	public String memberRegister(Model model, Member member, String post, String road) {
		return "";
	}
	
	public String idDuplicateCheck(String userId) {
		return "";
	}
	
	public ModelAndView findId(ModelAndView mv, String memberName, String email) {
		return mv;
	}
	
	public ModelAndView findPw(ModelAndView mv, String memberId, String memberName) {
		return mv;
	}
	
	public String myInfoPwCheckForm() {
		return "";
	}
	
	public ModelAndView myInfoForm(ModelAndView mv, String memberPwd, HttpServletRequest request) {
		return mv;
	}
	
	public ModelAndView updateMember(ModelAndView mv, @RequestParam("post") String post, @RequestParam("road") String road,
			HttpServletRequest request) {
		return mv;
	}
	
	public String deletePwCheckForm() {
		return "";
	}
	
	public String deleteMember(String memberPwd, HttpServletRequest request, Model model) {
		return "";
	}
}
