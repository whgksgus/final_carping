package com.carping.spring.member.store;

import com.carping.spring.member.domain.Member;

public interface MemberStore {
	public Member loginMember(Member member);
	public int insertMember(Member member);
	public int checkIdDup(String memberId);
	public int findIdCheck(Member member);
	public int findPwCheckIdName(Member member);
	public int updateMemberInfo(Member member);
	public int deleteMember(String memberId);
	public int insertAdmin(Member member);
}	
