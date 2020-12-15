package com.carping.spring.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	@RequestMapping(value="enrollForm.do", method=RequestMethod.GET)
	public String enrollForm() {
		return "member/enrollForm";
	}
	
	@RequestMapping(value="adminEnrollForm.do", method=RequestMethod.GET)
	public String adminEnrollForm() {
		return "member/adminEnrollForm";
	}
	
	@RequestMapping(value="findPwForm.do", method=RequestMethod.GET)
	public String findPwForm() {
		return "member/findPwForm";
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
			mv.addObject("msg", "ID 또는 비밀번호를 확인해주세요.");
			mv.addObject("url", "login.do");
			mv.setViewName("common/redirect");
		}
		return mv;
	}
	
	@RequestMapping(value="logout.do", method=RequestMethod.GET)
	public String memberLogout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "member/loginForm";
	}
	
	@RequestMapping(value="memberRegister.do", method=RequestMethod.POST)
	public String memberRegister(Model model, Member member, String jibunAddress, String detailAddress) {
		member.setMemberAddress(jibunAddress+" "+detailAddress);
		int result = mService.insertMember(member);
		if (result > 0) {
			model.addAttribute("msg", "회원가입에 성공하였습니다."); 
			model.addAttribute("url", "login.do"); 
			return "common/redirect";
		}else {
			model.addAttribute("msg", "회원 가입에 실패했습니다.");
			model.addAttribute("url", "enrollForm.do");
			return "common/redirect";
		}
	}
	
	@RequestMapping(value="adminRegister.do", method=RequestMethod.POST)
	public String adminRegister(Model model, Member member, String jibunAddress, String detailAddress) {
		member.setMemberAddress(jibunAddress+", "+detailAddress);
		int result = mService.insertAdmin(member);
		if (result > 0) {
			model.addAttribute("msg", "관리자 추가에 성공하였습니다."); 
			model.addAttribute("url", "home.do"); 
			return "common/redirect";
		}else {
			model.addAttribute("msg", "관리자 추가에 실패하였습니다."); 
			model.addAttribute("url", "adminEnrollForm.do");
			return "common/redirect";
		}
	}	
	
	@ResponseBody
	@RequestMapping(value="idDupCheck.do", method=RequestMethod.GET)
	public String idDuplicateCheck(String memberId) {
		boolean isUsable = mService.checkIdDup(memberId) == 0 ? true : false;
		return isUsable+"";
	}
	
	public ModelAndView findId(ModelAndView mv, String memberName, String email) {
		return mv;
	}
	
	public ModelAndView findPw(ModelAndView mv, String memberId, String memberName) {
		return mv;
	}
	
	@RequestMapping(value="myInfoPwCheckForm.do", method=RequestMethod.GET)
	public String myInfoPwCheckForm() {
		return "member/myInfoPwCheckForm";
	}
	
	@RequestMapping(value="memberDeletePwCheckForm.do", method=RequestMethod.GET)
	public String deletePwCheckForm() {
		return "member/memberDeletePwCheckForm";
	}
	
	
	@RequestMapping(value="myInfoForm.do", method=RequestMethod.POST)
	public ModelAndView myInfoForm(ModelAndView mv,String memberId, String memberPwd, HttpServletRequest request) {
		System.out.println(memberId);
		Member member = new Member(memberId, memberPwd);
		Member result = mService.loginMember(member);
		if(result != null) {
			mv.addObject("loginUser", result);
			mv.setViewName("member/modifyForm");
		}else {
			mv.addObject("msg", "비밀번호를 확인해주세요.");
			mv.addObject("url", "myInfoPwCheckForm.do");
			mv.setViewName("common/redirect");
		}
		return mv;
	}
	
	@RequestMapping(value="updateMember.do", method=RequestMethod.POST)
	public String updateMember(Model model, Member member, String jibunAddress, String detailAddress,
			HttpServletRequest request) {
		member.setMemberAddress(jibunAddress+", "+detailAddress);
		int result = mService.updateMemberInfo(member);
		if (result > 0) {
			model.addAttribute("msg", "회원정보 수정에 성공했습니다."); 
			model.addAttribute("url", "home.do"); 
			return "common/redirect";
		}else {
			model.addAttribute("msg", "회원정보 수정에 실패했습니다.");
			model.addAttribute("url", "member/modifyForm");
			return "common/redirect";
		}
	}
	
	@RequestMapping(value="", method=RequestMethod.POST)
	public String deleteMember(String memberId, String memberPwd, HttpServletRequest request, Model model) {
		return "";
	}
}
