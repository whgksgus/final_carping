package com.carping.spring.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
