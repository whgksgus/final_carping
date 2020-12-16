package com.carping.spring.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carping.spring.member.domain.FindId;
import com.carping.spring.member.domain.FindPw;
import com.carping.spring.member.domain.Member;
import com.carping.spring.member.store.MemberStore;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberStore mStore;
	
	@Override
	public Member loginMember(Member member) {
		return mStore.loginMember(member);
	}

	@Override
	public int insertMember(Member member) {
		return mStore.insertMember(member);
	}

	@Override
	public int checkIdDup(String memberId) {
		return mStore.checkIdDup(memberId);
	}

	@Override
	public Member findIdCheck(FindId fId) {
		return mStore.findIdCheck(fId);
	}

	@Override
	public Member findPwCheckIdName(FindPw fPw) {
		return mStore.findPwCheckIdName(fPw);
	}

	@Override
	public int updateMemberInfo(Member member) {
		return mStore.updateMemberInfo(member);
	}

	@Override
	public int insertAdmin(Member member) {
		return mStore.insertAdmin(member);
	}

	@Override
	public int deleteMember(Member member) {
		return mStore.deleteMember(member);
	}

}
