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

import com.carping.spring.member.domain.Email;
import com.carping.spring.member.domain.FindId;
import com.carping.spring.member.domain.FindPw;
import com.carping.spring.member.domain.Member;
import com.carping.spring.member.service.EmailSender;
import com.carping.spring.member.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private EmailSender emailSender;
	
	@Autowired
	private Email emailMsg;
	
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
	
	@RequestMapping(value="insertInfo.do", method=RequestMethod.GET)
	public String insertInfoForm() {
		return "member/insertInfo";
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
		member.setMemberAddress(jibunAddress+", "+detailAddress);
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
	
	@ResponseBody
	@RequestMapping(value="findId.do", method=RequestMethod.POST)
	public Member findId(String memberName, String phone) {
		FindId fId = new FindId(memberName, phone);
		Member member = mService.findIdCheck(fId);
		if(member != null) {
			return member;
		}else {
			return null;
		}
	}
	
	@RequestMapping(value="findIdPwForm.do", method=RequestMethod.GET)
	public String findIdPwForm() {
		return "member/memberSearch";
	}
	
	@ResponseBody
	@RequestMapping(value="findPw.do", method=RequestMethod.POST)
	public Member findPw(String memberId, String email) throws Exception {
		FindPw fPw = new FindPw(memberId, email);
		Member member = mService.findPwCheckIdName(fPw);
		if(member != null) {
			emailMsg.setContent("안녕하세요. ["+member.getMemberName()+"] 님의 비밀번호는 ["+ member.getMemberPwd()+"] 입니다.");
			emailMsg.setReceiver(member.getEmail());
			emailMsg.setSubject("Carping 비밀번호 재발급 이메일입니다.");
			emailSender.SendEmail(emailMsg);
			return member;
		}else {
			return null;
		}
	}
	
	@RequestMapping(value="myInfoPwCheckForm.do", method=RequestMethod.GET)
	public String myInfoPwCheckForm() {
		return "member/myInfoPwCheckForm";
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
	
	
	@RequestMapping(value="memberDeletePwCheckForm.do", method=RequestMethod.GET)
	public String deletePwCheckForm() {
		return "member/memberDeletePwCheckForm";
	}
	
	@RequestMapping(value="memberDelete.do", method=RequestMethod.POST)
	public String deleteMember(String memberId, String memberPwd, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		Member member = new Member(memberId, memberPwd);
		int result = mService.deleteMember(member);
		if(result > 0) {
			session.invalidate();
			model.addAttribute("msg", "회원정보 탈퇴에 성공했습니다."); 
			model.addAttribute("url", "login.do"); 
			return "common/redirect";
		}else {
			model.addAttribute("msg", "회원정보 탈퇴에 실패했습니다.");
			model.addAttribute("url", "myInfoPwCheckForm.do");
			return "common/redirect";
		}
	}
	
	
}
