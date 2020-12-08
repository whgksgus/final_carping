package com.carping.spring.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.carping.spring.member.domain.Member;
import com.carping.spring.member.service.MemberService;

public class MemberController {
	private MemberService mService;
	
	public String loginForm() {
		return "";
	}
	
	public String enrollForm() {
		return "";
	}
	
	public String findPwForm() {
		return "";
	}
	
	public ModelAndView memberLogin(String userId, String password, ModelAndView mv, HttpServletRequest request) {
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
	
	public ModelAndView myInfoForm(ModelAndView mv, String password, HttpServletRequest request) {
		return mv;
	}
	
	public ModelAndView updateMember(ModelAndView mv, @RequestParam("post") String post, @RequestParam("road") String road,
			HttpServletRequest request) {
		return mv;
	}
	
	public String deletePwCheckForm() {
		return "";
	}
	
	public String deleteMember(String password, HttpServletRequest request, Model model) {
		return "";
	}
}
