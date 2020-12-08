package com.carping.spring.member.store;

import org.mybatis.spring.SqlSessionTemplate;

import com.carping.spring.member.domain.Member;

public class MemberStoreLogic implements MemberStore {

	private SqlSessionTemplate sqlSession;
	
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
