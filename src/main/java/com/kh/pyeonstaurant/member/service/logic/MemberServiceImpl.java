package com.kh.pyeonstaurant.member.service.logic;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.kh.pyeonstaurant.member.domain.Member;
import com.kh.pyeonstaurant.member.service.MemberService;
import com.kh.pyeonstaurant.member.store.MemberStore;
import com.kh.pyeonstaurant.member.store.logic.MemberStoreLogic;


@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private SqlSessionTemplate session;
	@Autowired
	private MemberStore mStore;

	@Override
	public Member loginMember(Member member) {
		Member mOne 
		= mStore.selectLoginMember(session, member);
		return mOne;
	}

	@Override
	public Member printOneByEmail(String memberEmail) {
		Member member = mStore.selectOneByEmail(session, memberEmail);
		return member;
	}

	@Override
	public int registerMember(Member member) {
		int result = mStore.insertMember(session, member);
		return result;
	}

	@Override
	public int modifyMemberNickname(Member member) {
		int result = mStore.updateMemberNickname(session, member);
		return result;
	}
	
	@Override
	public int modifyMemberPwd(Member member) {
		int result = mStore.updateMemberPwd(session, member);
		return result;
	}

	@Override
	public int removeMember(String memberEmail) {
		int result = mStore.deleteMember(session, memberEmail);
		return result;
	}

}