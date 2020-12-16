package com.carping.spring.member.service;

import com.carping.spring.member.domain.FindId;
import com.carping.spring.member.domain.Member;

public interface MemberService {
	public Member loginMember(Member member);
	public int insertMember(Member member);
	public int checkIdDup(String memberId);
	public Member findIdCheck(FindId fId);
	public int findPwCheckIdName(Member member);
	public int updateMemberInfo(Member member);
	public int deleteMember(Member member);
	public int insertAdmin(Member member);
}
