package com.kh.pyeonstaurant.member.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.kh.pyeonstaurant.member.domain.Member;
import com.kh.pyeonstaurant.member.store.MemberStore;

@Repository
public class MemberStoreLogic implements MemberStore{

	@Override
	public Member selectLoginMember(SqlSession session, Member member) {
		Member mOne 
		= session
		.selectOne("MemberMapper.selectLoginOne", member);
		return mOne;
	}

	@Override
	public Member selectOneByEmail(SqlSession session, String memberEmail) {
		Member member = session.selectOne("MemberMapper.selectOneByEmail", memberEmail);
		return member;
	}

	@Override
	public int insertMember(SqlSession session, Member member) {
		int result = session.insert("MemberMapper.insertMember", member);
		return result;
	}

	@Override
	public int updateMemberNickname(SqlSession session, Member member) {
		int result = session.update("MemberMapper.updateMemberNickname", member);
		return result;
	}

	@Override
	public int updateMemberPwd(SqlSession session, Member member) {
		int result = session.update("MemberMapper.updateMemberPwd", member);
		return result;
	}
	
	@Override
	public int deleteMember(SqlSession session, String memberEmail) {
		int result = session.delete("MemberMapper.deleteMember", memberEmail);
		return result;
	}

}