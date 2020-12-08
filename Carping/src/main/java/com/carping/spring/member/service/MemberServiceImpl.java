package com.carping.spring.member.service;

import com.carping.spring.member.domain.Member;
import com.carping.spring.member.store.MemberStore;

public class MemberServiceImpl implements MemberService {

	private MemberStore mStore;
	
	@Override
	public Member loginMember(Member member) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertMember(Member member) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int checkIdDup(String memberId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int findIdCheck(Member member) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int findPwCheckIdName(Member member) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateMemberInfo(Member member) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMember(String memberId) {
		// TODO Auto-generated method stub
		return 0;
	}

}
