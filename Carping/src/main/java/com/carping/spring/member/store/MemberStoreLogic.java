package com.carping.spring.member.store;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carping.spring.member.domain.FindId;
import com.carping.spring.member.domain.FindPw;
import com.carping.spring.member.domain.Member;

@Repository
public class MemberStoreLogic implements MemberStore {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Member loginMember(Member member) {
		return sqlSession.selectOne("MemberMapper.loginMember", member);
	}

	@Override
	public int insertMember(Member member) {
		return sqlSession.insert("MemberMapper.insertMember", member);
	}

	@Override
	public int checkIdDup(String memberId) {
		return sqlSession.selectOne("MemberMapper.checkId", memberId);
	}

	@Override
	public Member findIdCheck(FindId fId) {
		return sqlSession.selectOne("MemberMapper.findId", fId);
	}

	@Override
	public Member findPwCheckIdName(FindPw fPw) {
		return sqlSession.selectOne("MemberMapper.findPw", fPw);
	}

	@Override
	public int updateMemberInfo(Member member) {
		return sqlSession.update("MemberMapper.updateMember", member);
	}

	@Override
	public int insertAdmin(Member member) {
		return sqlSession.insert("MemberMapper.insertAdmin", member);
	}

	@Override
	public int deleteMember(Member member) {
		return sqlSession.delete("MemberMapper.deleteMember", member);
	}

}
